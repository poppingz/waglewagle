package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ReportDAO;
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
			
			// 신고내역 목록 출력
			if(cmd.contentEquals(".rep")) {
				List<ReportDTO> list = dao.getAllList();
				
				request.setAttribute("", list);
				request.getRequestDispatcher("manager/reportList.jsp").forward(request, response);
				
			// 검색 기능
			}else if(cmd.contentEquals("")) {
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
