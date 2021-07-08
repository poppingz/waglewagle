package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CommentDAO;
import DTO.CommentDTO;
import DTO.MemberDTO;

@WebServlet("*.comment")
public class CommentController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset =utf-8");

		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String url = requestURI.substring(ctxPath.length());
		
		try {
			CommentDAO cmdao = CommentDAO.getInstance();
			
			if(url.contentEquals("/insert.comment")) {
				// id / nicknama / comments / parent_board
				MemberDTO dto = (MemberDTO)request.getSession().getAttribute("login");	
				String nickname = request.getParameter("nickname");
				String comments = request.getParameter("comments");
				int parent_board = Integer.parseInt(request.getParameter("parent_board"));
				
				int result = cmdao.insertComment(dto.getId(), nickname, comments, parent_board);
				
				response.sendRedirect("boardView.board?board_num="+ parent_board);
				
				
			}else if(url.contentEquals("/cmselect.comment")) {
				int parent_num = Integer.parseInt(request.getParameter("parent_num"));
				
				List<CommentDTO> commentList =cmdao.selectComment(parent_num);
				request.setAttribute("comments", commentList);
				
				
			}else if(url.contentEquals("/modify.comment")) {
				int comm_num = Integer.parseInt("comm_num");
				String nickname = request.getParameter("nickname");
				String comments = request.getParameter("comments");
				String parent_num = request.getParameter("parent_num");
				
				int result = cmdao.modifyComment(new CommentDTO(comm_num, nickname, comments));
				
				request.setAttribute("result", result);
				response.sendRedirect("/boardView.board?board_num="+parent_num);
			}else if(url.contentEquals("/moodifyView.comment")) {
				
				
				
			}else if(url.contentEquals("/delete.comment")) {
				int delComNum = Integer.parseInt(request.getParameter("comm_num"));
				int parent_board = Integer.parseInt(request.getParameter("parent_board"));
				cmdao.deleteComment(delComNum);
			
				response.sendRedirect("boardView.board?board_num="+ parent_board);
			
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
