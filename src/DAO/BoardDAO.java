package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.BoardDTO;

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

	public List<BoardDTO> sellectAll() throws Exception {
		String sql = "select * from pboard";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<BoardDTO> list = new ArrayList<>();
			while(rs.next()) {
				int board_num = rs.getInt("board_num");
				String id = rs.getNString("id");
				int category = rs.getInt("category");
				String title = rs.getNString("title");
				String contents = rs.getNString("contents");
				String nickname = rs.getNString("nickname");
				Date write_date = rs.getDate("write_date");
				int view_count = rs.getInt("view_count");
				int report = rs.getInt("report");
				
				BoardDTO dto = new BoardDTO(board_num, id, category, title, contents, nickname, write_date, view_count, report);
				list.add(dto);
			}
			return list;

		}
	}

	public int modify(BoardDTO dto)throws Exception{
		String sql = "update pboard set title=?, contents=? where board_num=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			
			pstat.setNString(1, dto.getTitle());
			pstat.setNString(2, dto.getContents());
			pstat.setInt(3, dto.getBoard_num());
			
			int result = pstat.executeUpdate();
			
			con.commit();
			return result;
			
		}
	}
	
	public void view_countPlus(int board_num) throws Exception{ // view_count 증가
		int view_count = this.view_count(board_num);
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

	public int view_count(int board_num) throws Exception { // view_count 증가를 위한 view_count
		String sql = "select view_count from pboard where board_num = ?";
		try(
				Connection con = this.getConnection();		
				PreparedStatement pstat = con.prepareStatement(sql);		
				)
		{
			pstat.setInt(1, board_num);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				rs.next();
				int view_count = rs.getInt("view_count");

				return view_count;
			}
		}
	}
	
	
	
}
