package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MemberDAO;
import DTO.MemberDTO;
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
				response.sendRedirect("main.jsp"); // 메인페이지로 이동
				
			}else if(cmd.contentEquals("/findid.mem")) { // 아이디 찾기
				String email = request.getParameter("email");
				
				String id = dao.findID(email);
				System.out.println("아이디 찾기 결과 : " + id);
				
				response.getWriter().append(String.valueOf(id));
				
			}else if(cmd.contentEquals("/findpw.mem")) { // 비밀번호 찾기
				String id = request.getParameter("id");
				String email = request.getParameter("email2");
				
				boolean result = dao.findPW(id, email);
				System.out.println("비밀번호 찾기 결과 : " + result);
				response.getWriter().append(String.valueOf(result));
				
			}else if(cmd.contentEquals("/changepw.mem")) { // 비밀번호 변경
				String id = request.getParameter("id");
				String pw = util.getSHA512(request.getParameter("repw"));
				System.out.println(id + " : " + pw);
				
				int result = dao.updatePw(pw, id);
				System.out.println(result);
				
				request.setAttribute("result", result);
				request.getRequestDispatcher("member/updateView.jsp").forward(request, response);
				
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
