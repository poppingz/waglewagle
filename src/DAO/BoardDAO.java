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

	
	private int getRecordCount()throws Exception {
		String sql = "select count(*) from board";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){    

			rs.next();
			return rs.getInt(1);
		}
	}

	 public List<BoardDTO> getPageList(int startNum,int endNum) throws Exception{
	        String sql ="select * from (select row_number() over(order by seq desc) rnum, board_num, title, id, nickname, write_date, view_count from board) where rnum between ? and ?";
	        try(Connection con = this.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);){

	            pstat.setInt(1, startNum);
	            pstat.setInt(2, endNum);

	            try(ResultSet rs = pstat.executeQuery();){
	                List<BoardDTO> list = new ArrayList<>();
	                while(rs.next()) {
	                    BoardDTO dto = new BoardDTO();
	                    dto.setBoard_num(rs.getInt("board_num"));
	                    dto.setTitle(rs.getNString("title"));
	                    dto.setId(rs.getNString("id"));
	                    dto.setNickname(rs.getNString("nickname"));
	                    dto.setWrite_date(rs.getDate("write_date"));
	                    dto.setView_count(rs.getInt("view_count"));

	                    list.add(dto);
	                }
	                return list;
	            }
	        }
	    }

	 public List<String> getPageNavi(int currentPage)throws Exception{
	        int recordTotalCount = this.getRecordCount();
	        int recordCountPerPage = BoardConfig.RECORD_COUNT_PER_PAGE;
	        int naviCountPerPage = BoardConfig.NAVI_COUNT_PER_PAGE;

	        int pageTotalCount = 0; 
	        if(recordTotalCount % recordCountPerPage > 0) {
	            pageTotalCount = recordTotalCount / recordCountPerPage + 1;
	        }else {
	            pageTotalCount = recordTotalCount / recordCountPerPage;
	        }

	        if(currentPage > pageTotalCount) {
	            currentPage = pageTotalCount;
	        }else if(currentPage < 1) {
	            currentPage = 1;
	        }

	        int startNavi = (currentPage-1) / naviCountPerPage * naviCountPerPage + 1;
	        int endNavi = startNavi + (naviCountPerPage - 1);

	        if(endNavi>pageTotalCount) {endNavi = pageTotalCount;}

	        boolean needPrev = true;
	        boolean needNext = true;

	        if(startNavi == 1) {needPrev = false;}
	        if(endNavi == pageTotalCount) {needNext = false;}

	        List<String> pageNavi = new ArrayList<>();

	        if(needPrev) {pageNavi.add("<");}

	        for(int i = startNavi; i <= endNavi; i++) {
	            pageNavi.add(String.valueOf(i));
	        }

	        if(needNext) {pageNavi.add(">");}

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
