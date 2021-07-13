package controller;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.BoardDAO;
import DAO.FilesDAO;
import DTO.FilesDTO;




@WebServlet("*.file")
public class FileController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset =utf-8");

		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String url = requestURI.substring(ctxPath.length());


		BoardDAO dao = BoardDAO.getInstance();
		FilesDAO fdao = FilesDAO.getInstance();


		try {	if(url.contentEquals("/download.file")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			String sysName = request.getParameter("sysname");	
			String oriName = request.getParameter("oriname");
			String filesPath = request.getServletContext().getRealPath("files");

			File targetFile = new File(filesPath+"/"+sysName);
			try(			
					FileInputStream fis = new FileInputStream(targetFile);
					DataInputStream dis = new DataInputStream(fis);
					DataOutputStream dos = new DataOutputStream(response.getOutputStream());
					){

				byte[] fileContents = new byte[(int)targetFile.length()];
				dis.readFully(fileContents);
				//여기까지가 1번 작업 - 하드디스크에 있는 파일의 내용을 램으로 복사한다.
				//--------------------------------------------------------------------------	
				// 2번 작업 - 램에 로딩된 내용을 클라이언트에게 전송한다.

				oriName = new String(oriName.getBytes("urf-8"),"iso-8859-1");// 파일의 인코딩방식을 크롬이 인식할 수 있는 iso-8859-1로 수정	    

				response.reset(); // response 객체의 기본동작을 다 제거
				response.setContentType("application/octet-stream");// text가 아니다 text처리하지마라
				response.setHeader("content-disposition","attachment; filename=\""+oriName+"\"");// attachment << 첨부파일이니 다운로드를 받으라는 지침


				dos.write(fileContents);
				dos.flush();

			}
		}else if(url.contentEquals("/upload.file")) {	
			response.setCharacterEncoding("utf8");
			response.setContentType("text/html;charset=utf8");
			String filesPath = request.getServletContext().getRealPath("files");
			File filesFolder = new File(filesPath);
			int maxSize = 1024 * 1024 * 10; //최대 10mb 크기의 파일을 받기.
			System.out.println("프로젝트 저장 된 진짜경로 : " + filesPath);

			if(!filesFolder.exists()) filesFolder.mkdir();// files 폴더가 없다면, mkdir로 폴더만듬
			MultipartRequest multi = new MultipartRequest(request, filesPath, maxSize, "utf8", new DefaultFileRenamePolicy());


			Set<String> fileNames = multi.getFileNameSet();

			int seq = dao.getSeq();


			String oriName =	multi.getOriginalFileName("abc");
			String sysName =	multi.getFilesystemName("abc");

			request.getSession().setAttribute("ingFiles", sysName);


			if(oriName != null) { 
				System.out.println("파일 오리지널이름 : " +  oriName + "DB에 저장됨.");
				System.out.println("파일이미지 넘버: " + seq);
				fdao.insert(new FilesDTO(oriName,sysName,null,seq));
				
			
			}

			String returnPath = "/files/"+sysName;
			response.getWriter().append(returnPath);
			
			
			


		}else if(url.contentEquals("/resolveFiles.file")){
			System.out.println("정리요청!");
		}


		}catch(Exception e){
			e.printStackTrace();
		}

	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
