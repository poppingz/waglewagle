package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MemberDAO;
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
			
			if(cmd.contentEquals("/idCheck.mem")) { // ID 중복체크
				String id = request.getParameter("id");
				System.out.println("인자 ID : " + id);
		
				boolean result = dao.isIdExist(id); // ajax 중복체크
				response.getWriter().append(String.valueOf(result));
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
