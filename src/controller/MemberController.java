package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MemberDAO;
<<<<<<< HEAD
import DTO.MemberDTO;
=======
>>>>>>> 2f5ec019abcbe2faf776756d18a0f8280c72dccc
import util.MemberUtil;

@WebServlet("*.mem")
public class MemberController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset =utf-8");
		
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		
		String cmd = requestURI.substring(ctxPath.length());
		System.out.println("�슂泥� URL : " + cmd);
		
		try {
			MemberUtil util = new MemberUtil();
			MemberDAO dao = MemberDAO.getInstance();
			
			if(cmd.contentEquals("/idCheck.mem")) { // ID 以묐났泥댄겕
				String id = request.getParameter("id");
				System.out.println("�씤�옄 ID : " + id);
		
				boolean result = dao.isIdExist(id); // ajax 以묐났泥댄겕
				response.getWriter().append(String.valueOf(result));
				
			}else if(cmd.contentEquals("/insert.mem")) { // 회원가입
				String id = request.getParameter("id");
				String pw = util.getSHA512(request.getParameter("pw"));
				String email = request.getParameter("email");
				
				int result = dao.insert(new MemberDTO(id, pw, email, null, 0));
				
				request.setAttribute("result", result);
				request.getRequestDispatcher("").forward(request, response);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
