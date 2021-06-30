package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.ReportDTO;

public class ReportDAO {
	private static ReportDAO instance;

	public synchronized static ReportDAO getInstance() {
		if(instance == null) {
			instance = new ReportDAO();
		}
		return instance;
	}

	private ReportDAO() {}

	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	// 신고내역 출력
	public List<ReportDTO> getAllList() throws Exception{
		String sql = "select * from preport";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<ReportDTO> list = new ArrayList<>();
			while(rs.next()) {
				String id = rs.getString("id");
				int board_num = rs.getInt("board_num");
				String title = rs.getString("title");
				String reason = rs.getString("reason");
				
				ReportDTO dto = new ReportDTO(id,board_num,title,reason);
				list.add(dto);
			}
			return list;
		}
	}
	// 검색기능
}
