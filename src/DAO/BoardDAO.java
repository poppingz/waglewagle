package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.BoardDTO;
import config.BoardConfig;

public class BoardDAO {

	private static BoardDAO instance;

	public synchronized static BoardDAO getInstance() {
		if(instance == null) {
			instance = new BoardDAO();
		}
		return instance;
	}

	private BoardDAO() {}

	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}



	public int insert(String id, int category , String title, String contents, String nickname) throws Exception {
		System.out.println(id + " : " + category + " : " + title + " : " + contents + " : " + nickname);
		String sql = "insert into pboard values(board_num_seq.nextval, ?, ?, ?, ?, ?, sysdate, 0, 0)";
		try (
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, id);
			pstat.setInt(2, category);
			pstat.setString(3, title);
			pstat.setString(4, contents);
			pstat.setString(5, nickname);		
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}


	/* Board List */
	public List<BoardDTO> sellectAll(int category) throws Exception {
		String sql = "select * from pboard where category=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){

			pstat.setInt(1, category);

			try(ResultSet rs = pstat.executeQuery();){
				List<BoardDTO> list = new ArrayList<>();
				while(rs.next()) {
					int board_num = rs.getInt("board_num");
					String id = rs.getNString("id");
					int category1 = rs.getInt("category");
					String title = rs.getNString("title");
					String contents = rs.getNString("contents");
					String nickname = rs.getNString("nickname");
					Date write_date = rs.getDate("write_date");
					int view_count = rs.getInt("view_count");
					int report = rs.getInt("report");

					BoardDTO dto = new BoardDTO(board_num, id, category1, title, contents, nickname, write_date, view_count, report);
					list.add(dto);
				}
				return list;
			}

		}
	}

	/* Board Detail View */
	public BoardDTO DetailView(int board_num)throws Exception {
		String sql = "select * from pboard where board_num = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, board_num);

			try(ResultSet rs = pstat.executeQuery();){
				if(rs.next()) {
					int board_num1 = rs.getInt("board_num");
					String id = rs.getNString("id");
					int category = rs.getInt("category");
					String title = rs.getNString("title");
					String contents = rs.getNString("contents");
					String nickname = rs.getNString("nickname");
					Date write_date = rs.getDate("write_date");
					int view_count = rs.getInt("view_count");
					int report = rs.getInt("report");

					BoardDTO dto = new BoardDTO(board_num1, id, category, title, contents,
							nickname,write_date,view_count,report);

					return dto;
				}
				return null;
			}
		}
	}


	/* Board Delete */
	public int deleteBoard(int board_num) throws Exception{
		String sql = "delete from pboard where board_num = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, board_num);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	/* Board Modify */
	public int modify(BoardDTO dto)throws Exception{
		String sql = "update pboard set title=?, contents=? where board_num=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				)
		{	
			pstat.setNString(1, dto.getTitle());
			pstat.setNString(2, dto.getContents());
			pstat.setInt(3, dto.getBoard_num());

			int result = pstat.executeUpdate();

			con.commit();
			return result;	
		}
	}

	/* Report Count */
	public int getReportCount (int board_num, int report) throws Exception {
		String sql="update pboard set report = ? where board_num = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				)
		{
			pstat.setInt(1, report+1);
			pstat.setInt(2, board_num);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	/* View Count */
	public void view_countPlus(int board_num,int view_count) throws Exception{ // view_count 증가
		String sql = "update pboard set view_count = ? where board_num = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, view_count + 1);
			pstat.setInt(2, board_num);

			pstat.executeUpdate();
			con.commit();
		}
	}
	
	private int getRecordCount(int category) throws Exception{
		String sql ="select count(*) from pboard where category = ?";

		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, category);
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				return rs.getInt(1);
			}
		
		}
	}


	private int getRecordCount2(String category1, String keyword, int category) throws Exception{
		String sql ="select count(*) from pboard where "+category1+" like ? and category=?";

		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
			
				){
			pstat.setNString(1, "%"+keyword+"%");
			pstat.setInt(2, category);
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				return rs.getInt(1);
			}
		}
		
	}

	public List<BoardDTO> getPageList(String category1, String keyword, int category,int startNum,int endNum) throws Exception{
		
		System.out.println(category1 + " : " + keyword);
		
		String sql = "select * from (select row_number() over(order by board_num desc) rnum, board_num, id, category, title, contents, nickname, write_date, view_count from pboard where "+category1+" like ? and category=?) where rnum between ? and ?";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);

				){
			pstat.setString(1, "%"+keyword+"%");
			pstat.setInt(2, category);
			pstat.setInt(3, startNum);
			pstat.setInt(4, endNum);
			try(ResultSet rs = pstat.executeQuery();){
				List<BoardDTO> list = new ArrayList<>();
				while(rs.next()) {
					BoardDTO dto = new BoardDTO();
					dto.setBoard_num(rs.getInt("board_num"));
					dto.setId(rs.getNString("id"));
					dto.setCategory(rs.getInt("category"));
					dto.setTitle(rs.getNString("title"));
					dto.setContents(rs.getNString("contents"));
					dto.setNickname(rs.getNString("nickname"));
					dto.setWrite_date(rs.getDate("write_date"));
					dto.setView_count(rs.getInt("view_count"));

					list.add(dto);
				}
				return list;
			}
		}
	}

	public List<BoardDTO> getPageList(int category, int startNum, int endNum) throws Exception{


		String sql = "select * from (select row_number() over(order by board_num desc)  rnum, board_num, id, category, title, contents, nickname, write_date, view_count from pboard where category=?) where rnum between ? and ?";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);

				){
			pstat.setInt(1, category);
			pstat.setInt(2, startNum);
			pstat.setInt(3, endNum);
			try(ResultSet rs = pstat.executeQuery();){
				List<BoardDTO> list = new ArrayList<BoardDTO>();
				while(rs.next()) {
					BoardDTO dto = new BoardDTO();
					dto.setBoard_num(rs.getInt("board_num"));
					dto.setId(rs.getNString("id"));
					dto.setCategory(rs.getInt("category"));
					dto.setTitle(rs.getNString("title"));
					dto.setContents(rs.getNString("contents"));
					dto.setNickname(rs.getNString("nickname"));
					dto.setWrite_date(rs.getDate("write_date"));
					dto.setView_count(rs.getInt("view_count"));

					list.add(dto);
				}
				return list;
			}

		}
	}

	public List<String> getPageNavi(int currentPage, String category1, String keyword, int category) throws Exception{ // 페이징 넘버
	      int recordTotalCount = 0;
	      if(keyword == null || keyword.contentEquals("")) {
	         recordTotalCount = this.getRecordCount(category); // 전체 레코드의 개수 -> db에서 꺼내지는 값
	      }else {
	         recordTotalCount = this.getRecordCount2(category1, keyword, category);
	      }
	      int recordCountPerPage = BoardConfig.RECORD_COUNT_PER_PAGE; // 한 페이지 당 보여줄 게시글의 개수 -> 개발자가 정하는 값
	      int naviCountPerPage = BoardConfig.NAVI_COUNT_PER_PAGE; // 내 위치 페이지를 기준으로 시작부터 끝까지의 페이지가 총 몇개인지 -> 개발자가 정하는 값
	      
	      int pageTotalCount = 0; //총 몇개의 페이지인지 : 일단 0으로 정하고 if문을 통해 값 대입
	      
	      if(recordTotalCount % recordCountPerPage > 0) { // 전체레코드를, 한 페이지당 보여줄 값 만큼 나누고 난 나머지가 0보다 클 경우
	         pageTotalCount = recordTotalCount / recordCountPerPage + 1; // 나머지가 보여질 한 페이지 추가
	      }else { // 전체 레코드를, 한 페이지당 보여줄 값 만큼 나누고 난 나머지가 0일 경우
	         pageTotalCount = recordTotalCount / recordCountPerPage;
	      }
	      
//	      int currentPage = 12; // 내가 현재 위치한 페이지 번호 -> 매개변수로 받아옴
	      if(currentPage > pageTotalCount) { // 내 페이지 번호보다, 최대 페이지보다 크다면
	         currentPage = pageTotalCount; // 내 페이지 번호에 최대 페이지를 대입
	      }else if(currentPage < 1) {
	         currentPage = 1;
	      }
	      
	      int startNavi = (currentPage-1) / naviCountPerPage * naviCountPerPage + 1; // 보여질 시작 페이지
	      // 내 현재 페이지 -1 에서, 시작부터 끝까지 보여질 페이지의 개수를 나누고, 다시 곱한 후 +1
	      int endNavi = startNavi + (naviCountPerPage -1); // 보여질 마지막 페이지
	      // 스타트페이지 + (한 페이지당 보여질 페이지 -1)
	      
	      if(endNavi > pageTotalCount) { // 마지막 페이지가 최대 페이지보다 크다면
	         endNavi = pageTotalCount; // 마지막 페이지에 최대 페이지를 대입
	      }
	      
	      boolean needPrev = true; // 이전 페이지가 필요한지?
	      boolean needNext = true; // 다음 페이지가 필요한지?
	      
	      if(startNavi == 1) { // 시작페이지가 1일 경우
	         needPrev = false; // 이전 페이지는 필요없음
	      }else if(endNavi == pageTotalCount) { // 마지막 페이지가 최대페이지와 같다면
	         needNext = false; // 다음 페이지는 필요없음
	      }
	      
	      List<String> pageNavi = new ArrayList<>(); // 페이지 번호 리스트
	      
	      if(needPrev) { // 이전 페이지가 필요하면 
	         pageNavi.add("<"); // < 추가
	      }
	      
	      for(int i = startNavi; i <= endNavi; i++) {
	         pageNavi.add(String.valueOf(i));
	      }
	      
	      if(needNext) { // 다음 페이지가 필요하면
	         pageNavi.add(">"); // > 추가
	      }
	      
	      return pageNavi;
	   }

	public int getSeq()throws Exception{
		String sql ="select board_num_seq.nextval from dual";


		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);				
				ResultSet rs = pstat.executeQuery();){

			rs.next();
			return rs.getInt(1);
		}

	}
}
