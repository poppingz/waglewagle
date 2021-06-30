package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.BoardDAO;
import DTO.BoardDTO;

<<<<<<< HEAD
=======

>>>>>>> dc5846425a47054532b26ffbbbf6cc8e4e2d79bd


@WebServlet("*.board")
public class BoardController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset =utf-8");

		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String url = requestURI.substring(ctxPath.length());


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



			}else if(url.contentEquals("/select.board")) {
				List<BoardDTO> list = dao.sellectAll();
				request.setAttribute("BoardList", list);
				request.getRequestDispatcher("Board/BoardList").forward(request, response);

			}else if(url.contentEquals("/modify.board")) {
				int board_num = (Integer.parseInt(request.getParameter("board_num")));
				String title = request.getParameter("title");
				String contents = request.getParameter("contents");
				int result = dao.modify(new BoardDTO(board_num,title,contents));

				request.setAttribute("result", result);
				response.sendRedirect("index.jsp");}


		}catch(Exception e){
			e.printStackTrace();
		}

	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
