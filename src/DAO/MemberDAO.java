package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.MemberDTO;

public class MemberDAO {
	
	private MemberDAO() {}

	public static MemberDAO instance;

	public synchronized static MemberDAO getInstance() {
		if(instance == null) {
			instance = new MemberDAO();
		}	
		return instance;
	}

	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public boolean isIdExist(String id) throws Exception { // ID 중복체크
		String sql = "select * from pmember where id=?";
		try(
			Connection con = this.getConnection();		
			PreparedStatement pstat = con.prepareStatement(sql);
		)
		{
			pstat.setString(1, id);
			try(ResultSet rs = pstat.executeQuery();)
			{
				boolean result = rs.next();
				return result;
			}
		}
	}

	
	public int insert(String id, String pw, String email) throws Exception { // 회원가입
		String sql = "insert into pmember values(?, ?, ?, sysdate, id_num_seq.nextval)";
		try(
			Connection con = this.getConnection();		
			PreparedStatement pstat = con.prepareStatement(sql);		
		)
		{
			pstat.setString(1, id);
			pstat.setString(2, pw);
			pstat.setString(3, email);

			int result = pstat.executeUpdate();
			con.commit();
			return result;	
		}
		
	}
	
	public MemberDTO login(String id, String pw) throws Exception{ // 로그인
		String sql="select * from pmember where id= ? and pw= ?";
		MemberDTO dto = new MemberDTO();
		try(
			Connection con = this.getConnection();		
			PreparedStatement pstat = con.prepareStatement(sql);
		)
		{
			pstat.setString(1, id);
			pstat.setString(2, pw);
			try(ResultSet rs = pstat.executeQuery();)
			{
				if(rs.next()) {
					String tmpId = rs.getString("id");
					System.out.println("임시아이디" + tmpId);
					dto.setId(tmpId);
				}
				return dto;
			}
		}
	}

}
