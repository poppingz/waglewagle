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
	
	//신고입력 받기
	public int insert(ReportDTO dto) throws Exception{
		String sql = "insert into preport values(report_num_seq.nextval,?,?,?,?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getId());
			pstat.setInt(2, dto.getBoard_num());		
			pstat.setString(3, dto.getTitle());
			pstat.setString(4, dto.getReason());
			
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
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
				int report_num = rs.getInt("report_num");
				String id = rs.getString("id");
				int board_num = rs.getInt("board_num");
				String title = rs.getString("title");
				String reason = rs.getString("reason");
				
				ReportDTO dto = new ReportDTO(report_num,id,board_num,title,reason);
				list.add(dto);
			}
			return list;
		}
	}
	
	// id로 신고자 검색기능
	public List<ReportDTO> getAllList(String inputID) throws Exception{
		String sql = "select * from preport where id=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, inputID);
			try(ResultSet rs = pstat.executeQuery();) {
				List<ReportDTO> list = new ArrayList<>();
				while(rs.next()) {
					int report_num = rs.getInt("report_num");
					String id = rs.getString("id");
					int board_num = rs.getInt("board_num");
					String title = rs.getString("title");
					String reason = rs.getString("reason");
					
					ReportDTO dto = new ReportDTO(report_num,id,board_num,title,reason);
					list.add(dto);
				}
				return list;
			}
		}
	}
	
	// 신고내역 삭제
	public int delete(int report_num) throws Exception{
		String sql = "delete from preport where report_num=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, report_num);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
}
