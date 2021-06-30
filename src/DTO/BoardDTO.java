package DTO;

import java.sql.Date;

public class BoardDTO {

	private int board_num;
	private String id;
	private int category;
	private String title;
	private String contents;
	private String nickname;
	private Date write_date;
	private int view_count;
	private int report;
	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardDTO(int board_num, String id, int category, String title, String contents, String nickname,
			Date write_date, int view_count, int report) {
		super();
		this.board_num = board_num;
		this.id = id;
		this.category = category;
		this.title = title;
		this.contents = contents;
		this.nickname = nickname;
		this.write_date = write_date;
		this.view_count = view_count;
		this.report = report;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public int getReport() {
		return report;
	}
	public void setReport(int report) {
		this.report = report;
	}
	
	
}
