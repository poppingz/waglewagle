package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

<<<<<<< HEAD
import DTO.BoardDTO;



=======
>>>>>>> 13ff777147779759d70d91546a4855bb69140cb7
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
	
}
