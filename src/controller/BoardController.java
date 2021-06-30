package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.BoardDAO;
import kh.mvc.dto.MemberDTO;


@WebServlet("*.board")
public class BoardController extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset =utf-8");

		String requestURI = request.getRequestURI();
		System.out.println("requestURI : " + requestURI);

		String ctxPath = request.getContextPath();
		System.out.println("ctxPath : " + ctxPath);

		String url = requestURI.substring(ctxPath.length());
		System.out.println("url : " + url);


		BoardDAO dao = BoardDAO.getInstance();


		try {
			
             // 글 쓰기
			if(url.contentEquals("/boardWrite.board")) {
				MemberDTO dto = (MemberDTO)request.getSession().getAttribute("login");
				int category = Integer.parseInt(request.getParameter("category"));
				String title = request.getParameter("title");
				String contents = request.getParameter("contents");
				String nickname = request.getParameter("nickname");

				int result = dao.insert(dto.getId(), category, title, contents, nickname);

				request.setAttribute("result", result);
				
				response.sendRedirect(ctxPath +"/boardList.board");
           
				// 글 삭제
			}else if(url.contentEquals("/boardDelete.board")) {
				int board_num = Integer.parseInt(request.getParameter("board_num"));
				dao.deleteBoard(board_num);
				response.sendRedirect(ctxPath +"/boardList.board");
			}


		}catch(Exception e){
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
