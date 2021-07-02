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

import DTO.FilesDTO;



public class FilesDAO {
	private static FilesDAO instance;

	public synchronized static FilesDAO getInstance() { // 싱글톤 패턴
		if(instance == null) {
			instance = new FilesDAO();
		}
		return instance;
	}

	private FilesDAO() {}

	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public int insert(FilesDTO dto) throws Exception{
		String sql = "insert into pfiles values(?,?,sysdate,?)";
		try (	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setNString(1, dto.getOriName());
			pstat.setNString(2, dto.getSysName());
			pstat.setInt(3, dto.getParent());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}

	}
	public List<FilesDTO> selectBySeq(int parent)throws Exception{
		String sql = "select * from files where parent = ?";
		try (	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, parent);
			List<FilesDTO> list = new ArrayList<>();
			try(ResultSet rs = pstat.executeQuery()){
				while(rs.next()) {					
					String oriName = rs.getNString("oriname");
					String sysName = rs.getNString("sysname");
					Date reg_date = rs.getDate("reg_date");
					int parent_ = rs.getInt("parent");
					list.add(new FilesDTO(oriName,sysName,reg_date,parent));
				}
				return list;
			}
		}
	}




}
