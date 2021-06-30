package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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

}
