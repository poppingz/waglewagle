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
import DTO.MemberDTO;




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

			if(url.contentEquals("/select.board")) {
				int category = Integer.parseInt(request.getParameter("category"));

				List<BoardDTO> list = dao.sellectAll(category);
				request.setAttribute("list", list);
				request.getRequestDispatcher("board/boardList.jsp").forward(request, response);

			}else if(url.contentEquals("/insert.board")) {
				MemberDTO dto = (MemberDTO)request.getSession().getAttribute("login");
				int category = Integer.parseInt(request.getParameter("category"));
				String title = request.getParameter("title");
				String contents = request.getParameter("contents");
				String nickname = request.getParameter("nickname");

				int result = dao.insert(dto.getId(), category, title, contents, nickname);

				request.setAttribute("result", result);

				response.sendRedirect("/select.board?category="+category);

			}else if(url.contentEquals("/modify.board")) {
				int board_num = Integer.parseInt(request.getParameter("board_num"));
				String title = request.getParameter("title");
				String contents = request.getParameter("contents");
				int result = dao.modify(new BoardDTO(board_num,title,contents));

				request.setAttribute("result", result);
				response.sendRedirect("/boardView.board?board_num="+board_num);



			}else if(url.contentEquals("/modifyView.board")) {
				int board_num = Integer.parseInt(request.getParameter("board_num"));
				BoardDTO result = dao.DetailView(board_num);
				request.setAttribute("Board_Context", result);

				request.getRequestDispatcher("modify.jsp").forward(request, response);

			}else if(url.contentEquals("/delete.board")) {

				int board_num = Integer.parseInt(request.getParameter("board_num"));
				int category = Integer.parseInt(request.getParameter("category"));
				dao.deleteBoard(board_num);
				if(category==1) {
					response.sendRedirect("/select.board?category=1");
				}else if(category==2) {
					response.sendRedirect("/select.board?category=2");
				}else if(category==3) {
					response.sendRedirect("/select.board?category=3");
				}
			}else if(url.contentEquals("/boardView.board")) {
				int board_num = (Integer.parseInt(request.getParameter("board_num")));
				BoardDTO result = dao.DetailView(board_num);
				dao.view_countPlus(board_num, result.getView_count());

				request.setAttribute("Board_Context", result);
				request.getRequestDispatcher("indexDetail.jsp").forward(request, response);

			}else if(url.contentEquals("/report.board")) {
				int board_num = Integer.parseInt(request.getParameter("board_num"));
				BoardDTO result = dao.DetailView(board_num);
				dao.getReportCount(board_num, result.getReport());

				request.setAttribute("Board_Context", result);
				request.getRequestDispatcher("/boardView.board?board_num="+board_num).forward(request, response);
			}


		}catch(Exception e){
			e.printStackTrace();
		}

	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
