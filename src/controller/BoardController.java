package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.BoardDAO;
import DAO.CommentDAO;
import DAO.FilesDAO;
import DTO.BoardDTO;
import DTO.CommentDTO;
import DTO.FilesDTO;
import DTO.MemberDTO;
import config.BoardConfig;


@WebServlet("*.board")
public class BoardController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset =utf-8");

		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String url = requestURI.substring(ctxPath.length());
		System.out.println("요청 URL : " + url);

		BoardDAO dao = BoardDAO.getInstance();
		FilesDAO fdao = FilesDAO.getInstance();
		CommentDAO cdao = CommentDAO.getInstance();

		try {
              //게시판 글 목록출력

			if(url.contentEquals("/select.board")) {
				
				String category1 = request.getParameter("category1");
				String keyword = request.getParameter("keyword");
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				int category = Integer.parseInt(request.getParameter("category"));
				
				System.out.println("카테고리넘버 : "  + category);
				System.out.println("현재 페이지 : " + cpage);
				System.out.println("검색 분류 : " + category1);
				System.out.println("검색어 : " + keyword);

				int endNum = cpage * BoardConfig.RECORD_COUNT_PER_PAGE;
				int startNum = endNum - (BoardConfig.RECORD_COUNT_PER_PAGE-1);

				List<BoardDTO> list;
				if(keyword == null || keyword.contentEquals("")) {
					list = dao.getPageList(category,startNum,endNum);
				}else {
					list = dao.getPageList(category1,keyword,category,startNum,endNum);
				}


				List<String> pageNavi  = dao.getPageNavi(cpage,category1,keyword,category);
				
				request.setAttribute("list", list);
				request.setAttribute("navi", pageNavi);
				request.setAttribute("category1", category1);
				request.setAttribute("keyword", keyword);				
				request.getRequestDispatcher("board/boardList.jsp").forward(request, response);


			
				// 게시판 글 등록
				}else if(url.contentEquals("/insert.board")) {	
				String filesPath = request.getServletContext().getRealPath("files");
				File filesFolder = new File(filesPath);
				int maxSize = 1024 * 1024 * 10; //최대 10mb 크기의 파일을 받기.
				System.out.println("프로젝트 저장 된 진짜경로 : " + filesPath);

				if(!filesFolder.exists()) filesFolder.mkdir();// files 폴더가 없다면, mkdir로 폴더만듬

				MultipartRequest multi = new MultipartRequest(request, filesPath, maxSize, "utf8", new DefaultFileRenamePolicy());

				MemberDTO dto = (MemberDTO)request.getSession().getAttribute("login");	
				System.out.println(dto.getId());

				int category = Integer.parseInt(multi.getParameter("category"));

				String title = multi.getParameter("title");
				String contents = multi.getParameter("contents");
				String nickname = multi.getParameter("nickname");

				System.out.println(category + " : " + title + " : " + contents + " : " + nickname);

				int seq = dao.getSeq();
				int result = dao.insert(dto.getId(), category, title, contents, nickname);

				request.setAttribute("result", result);	

				Set<String> fileNames = multi.getFileNameSet();

				for(String fileName : fileNames) {
					String oriName = multi.getOriginalFileName(fileName);
					String sysName = multi.getFilesystemName(fileName);
					if(oriName != null) { 
						System.out.println("파일 오리지널이름 : " +  oriName + "DB에 저장됨.");
						System.out.println(seq);
						fdao.insert(new FilesDTO(oriName,sysName,null,seq));
					}
				}			

				response.sendRedirect("select.board?cpage=1&category="+ category);
             // 글 수정
			}else if(url.contentEquals("/modify.board")) {
				
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset =utf-8");
				
				int board_num = Integer.parseInt(request.getParameter("board_num"));
				String title = request.getParameter("title");
				String contents = request.getParameter("contents");
				int result = dao.modify(new BoardDTO(board_num,title,contents));

				request.setAttribute("result", result);
				response.sendRedirect("boardView.board?board_num="+board_num);



             // 글수정 페이지 이동

			}else if(url.contentEquals("/modifyView.board")) {
				int board_num = Integer.parseInt(request.getParameter("board_num"));
				BoardDTO result = dao.DetailView(board_num);
				request.setAttribute("Board_Context", result);

				request.getRequestDispatcher("board/boardModify.jsp").forward(request, response);
				
             // 글 삭제
			}else if(url.contentEquals("/delete.board")) {

				int board_num = Integer.parseInt(request.getParameter("board_num"));
				int category = Integer.parseInt(request.getParameter("category"));
				dao.deleteBoard(board_num);
				if(category==1) {
					response.sendRedirect("select.board?category=1&cpage=1");
				}else if(category==2) {
					response.sendRedirect("select.board?category=2&cpage=1");
				}else if(category==3) {
					response.sendRedirect("select.board?category=3&cpage=1");
				}
				
				// 게시글 자세히보기
			}else if(url.contentEquals("/boardView.board")) {
			
				int board_num = (Integer.parseInt(request.getParameter("board_num")));
				BoardDTO result = dao.DetailView(board_num);
				List<FilesDTO> flist = fdao.selectBySeq(board_num); //첨부 파일 목록을 가져오는 코드
				dao.view_countPlus(board_num, result.getView_count());
				List<CommentDTO> clist = cdao.selectComment(board_num);

				request.setAttribute("fileList", flist);
				request.setAttribute("Board_Context", result);
				request.setAttribute("comments", clist);
				request.getRequestDispatcher("board/indexDetail.jsp").forward(request, response);

			}else if(url.contentEquals("/report.board")) {
				int board_num = Integer.parseInt(request.getParameter("board_num"));
				BoardDTO result = dao.DetailView(board_num);
				dao.getReportCount(board_num, result.getReport());

				request.setAttribute("Board_Context", result);
				request.getRequestDispatcher("boardView.board?board_num="+board_num).forward(request, response);
			}


		}catch(Exception e){
			e.printStackTrace();
		}

	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
