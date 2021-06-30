package DAO;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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
}
