package DTO;

import java.sql.Date;

public class MemberDTO {
	
	private String id;
	private String pw;
	private String email;
	private Date reg_date;
	private int id_num;
	
	public MemberDTO() {}

	public MemberDTO(String id, String pw, String email, Date reg_date, int id_num) {
		super();
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.reg_date = reg_date;
		this.id_num = id_num;
	}

	public MemberDTO(String id,String pw, String email, Date reg_date) {
		super();
		this.id = id;
		this.email = email;
		this.reg_date = reg_date;
	}
	
	public MemberDTO(String id, String email) {
		super();
		this.id = id;
		this.email = email;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public int getId_num() {
		return id_num;
	}

	public void setId_num(int id_num) {
		this.id_num = id_num;
	}
	


}
