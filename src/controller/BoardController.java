package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.BoardDAO;


@WebServlet("/BoardController")
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
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
