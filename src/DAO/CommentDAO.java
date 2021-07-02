
	private CommentDAO() {}

	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int comInsert(String id, String nickname, String comments, int parent_board) throws Exception {
		String sql = "insert into pcomments values(comm_num_seq.nextval, ?, ?, ?, sysdate, ?)";
		try(
			Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
			){
			pstat.setString(1, id);
			pstat.setString(2, nickname);
			pstat.setString(3, comments);
			pstat.setInt(4, parent_board);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public List<CommentDTO> selectComment(int parent_board) throws Exception{
		String sql = "select * from pcomments where parent_board=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
			){
			pstat.setInt(1, parent_board);
			try(
				ResultSet rs = pstat.executeQuery();
				){
				List<CommentDTO> list = new ArrayList<>();
				while(rs.next()) {
					int comm_num = rs.getInt("comm_num");
					String id = rs.getNString("id");
					String nickname = rs.getNString("nickname");
					String comments = rs.getNString("comments");
					
					CommentDTO dto = new CommentDTO(comm_num, id, nickname, comments);
					list.add(dto);
				}
				return list;
			}
			
		}
	}
	
	public int deleteComment(int delComNum) throws Exception {
		String sql = "delete * from pcomments where comm_num=?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, delComNum);
			
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int modifyComment(CommentDTO dto)throws Exception{
		String sql = "update pcomments set comments=? where comm_num=?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setNString(1, dto.getComments());
			pstat.setInt(2, dto.getComm_num());
			
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
}
