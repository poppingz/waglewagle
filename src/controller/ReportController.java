package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ReportDAO;
import DTO.MemberDTO;
import DTO.ReportDTO;


@WebServlet("*.rep")
public class ReportController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset =utf-8");
		
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		
		String cmd = requestURI.substring(ctxPath.length());
		System.out.println("요청 URL : " + cmd);
		
		try {
			ReportDAO dao = ReportDAO.getInstance();
			
			// 신고내역 받기
			if(cmd.contentEquals("/reportGet.rep")) {
				System.out.println("신고내역요청 들어옴");
				String id = ((MemberDTO)request.getSession().getAttribute("login")).getId(); //신고아이디
				int board_num = Integer.parseInt(request.getParameter("")); //게시판번호
				String title = request.getParameter(""); //신고게시글 제목
				String reason = request.getParameter("reason"); //신고사유
				
				int result = dao.insert(new ReportDTO(0,id,board_num,title,reason));
				
				request.setAttribute("reason", result);
				request.getRequestDispatcher("manager/reportFormView.jsp").forward(request, response); // 신고가 완료되었습니다 페이지로 가기		
				
			// 신고내역 출력
			}else if(cmd.contentEquals("/reportList.rep")) {
				List<ReportDTO> list = dao.getAllList();
				
				request.setAttribute("reportList", list);
				request.getRequestDispatcher("manager/reportList.jsp").forward(request, response);
				
			// 신고내역 삭제
			}else if(cmd.contentEquals("/reportDelete.rep")) {
				int list = Integer.parseInt(request.getParameter("list"));
				
				dao.delete(list);
				response.sendRedirect("reportList.rep"); // 신고내역 출력으로 이동
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
