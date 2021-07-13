package DTO;

import java.sql.Date;

public class CommentDTO {
	private int comm_num;
	private String id;
	private String nickname;
	private String comments;
	private Date write_date;
	private int parent_board;
	
	CommentDTO(){super();}

	public CommentDTO(int comm_num, String id, String nickname, String comments, Date write_date, int parent_board) {
		super();
		this.comm_num = comm_num;
		this.id = id;
		this.nickname = nickname;
		this.comments = comments;
		this.write_date = write_date;
		this.parent_board = parent_board;
	}

	public CommentDTO(int comm_num, String id, String nickname, String comments) {
		this.comm_num = comm_num;
		this.id = id;
		this.nickname = nickname;
		this.comments = comments;
	}

	public CommentDTO(int comm_num, String nickname, String comments) {
		this.comm_num = comm_num;
		this.nickname = nickname;
		this.comments = comments;
	}

	public int getComm_num() {
		return comm_num;
	}

	public void setComm_num(int comm_num) {
		this.comm_num = comm_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public int getParent_board() {
		return parent_board;
	}

	public void setParent_board(int parent_board) {
		this.parent_board = parent_board;
	}
}
