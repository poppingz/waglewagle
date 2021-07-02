package DAO;

import java.sql.Connection;
import java.sql.Date;
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
					int id_num = rs.getInt("id_num");
					dto.setId(tmpId);
					dto.setId_num(id_num);
					
					return dto;
				}
			return dto;
			}
		}
	}
	
	
	public String findID(String email) throws Exception{ // 아이디 찾기
		String sql = "select * from pmember where email = ?";
		String id = null;
		try(
			Connection con = this.getConnection();		
			PreparedStatement pstat = con.prepareStatement(sql);
		){
			pstat.setString(1, email);
			try(ResultSet rs = pstat.executeQuery();)
			{
				if(rs.next()) {
					id = rs.getString("id");
				}
				return id;
			}
		}
	}
	
	
	public boolean findPW(String id, String email) throws Exception { // 비밀번호 찾기
		String sql = "select * from pmember where id=? and email=?";
		try(
			Connection con = this.getConnection();		
			PreparedStatement pstat = con.prepareStatement(sql);
		)
		{
			pstat.setString(1, id);
			pstat.setString(2, email);
			try(ResultSet rs = pstat.executeQuery();)
			{
				boolean result = rs.next();
				return result;
			}
		}
	}
	
	public int updatePw(String pw, String id) throws Exception{ // 비밀번호 변경
		String sql = "update pmember set pw=? where id=?";
		try(
			Connection con = this.getConnection();		
			PreparedStatement pstat = con.prepareStatement(sql);		
		){
			pstat.setString(1, pw);
			pstat.setString(2, id);
			
			int result = pstat.executeUpdate();
			con.commit();
			return result;	
		}
	}
	
	public int memberOut(String id) throws Exception{ // 탈퇴
		String sql = "delete from pmember where id = ?";
		try(
			Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
		){
			pstat.setString(1, id);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
//	mypage 구문 시작
	public MemberDTO getMyInfo(String paramID) throws Exception {
		String sql = "select * from pmember where id = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, paramID);
			try (ResultSet rs = pstat.executeQuery();) {
				if (rs.next()) {
					String id = rs.getString("id");
					String pw = rs.getString("pw");
					System.out.println("패스워드값 : " + pw);
					String email = rs.getString("email");
					Date reg_date = rs.getDate("reg_date");
					System.out.println("reg_date값 : " + reg_date);
					return new MemberDTO(id,pw,email,reg_date);
				}
			}
		}
		return null;
	}
//	mypage 구문 끝
	

	
	

	
	
	
	
	

}
