package DTO;

public class ReportDTO {
	private String id;
	private int board_num;
	private String title;
	private String reason;
	public ReportDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReportDTO(String id, int board_num, String title, String reason) {
		super();
		this.id = id;
		this.board_num = board_num;
		this.title = title;
		this.reason = reason;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
}
