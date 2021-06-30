package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MemberDAO;
import DTO.MemberDTO;
<<<<<<< HEAD
=======

>>>>>>> 4f641b2901b8eae0c776b7bc7138a921475199eb
import util.MemberUtil;


@WebServlet("*.mem")
public class MemberController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset =utf-8");
		
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		
		String cmd = requestURI.substring(ctxPath.length());
		System.out.println("요청 URL : " + cmd);
		
		try {
			MemberUtil util = new MemberUtil();
			MemberDAO dao = MemberDAO.getInstance();
			
			if(cmd.contentEquals("/idCheck.mem")) { // ID 중복확인
				String id = request.getParameter("id");
				System.out.println("인자 ID : " + id);
		
				boolean result = dao.isIdExist(id); // ajax 중복체크
				response.getWriter().append(String.valueOf(result));
				
			}else if(cmd.contentEquals("/insert.mem")) { // 회원가입
				String id = request.getParameter("id");
				String pw = util.getSHA512(request.getParameter("pw"));
				String email = request.getParameter("email");
				
				int result = dao.insert(id, pw, email);
				
				request.setAttribute("result", result);
				request.getRequestDispatcher("member/insertView.jsp").forward(request, response);
				
			}else if(cmd.contentEquals("/login.mem")) { // 로그인	
				String id = request.getParameter("id");
				String pw = util.getSHA512(request.getParameter("pw"));
				
				MemberDTO dto = dao.login(id, pw);
				System.out.println("로그인 결과 : " + dto);
				
				if(dto.getId() != null) { // 로그인에 성공했다면
					request.getSession().setAttribute("login", dto); // session key 발급 후
				}
				response.sendRedirect("Board/BoardList.jsp"); // 게시판으로 이동
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
