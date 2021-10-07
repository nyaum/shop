package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import commons.DBUtil;
import vo.QnaComment;

public class QnaCommentDao {
	public ArrayList<QnaComment> qnaCommentList(int qnaNo) throws ClassNotFoundException, SQLException {
		ArrayList<QnaComment> list = new ArrayList<>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql ="SELECT"
				+ " qna_comment_content qnaCommentContent,"
				+ " member_no memberNo,"
				+ " create_date createDate "
				+ "FROM qna_comment "
				+ "WHERE qna_no=? "
				+ "ORDER BY create_date DESC";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, qnaNo);
		
		System.out.println(stmt + " << stmt");
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			QnaComment qc = new QnaComment();
			
			qc.setQnaCommentContent(rs.getString("qnaCommentContent"));
			qc.setMemberNo(rs.getInt("memberNo"));
			qc.setCreateDate(rs.getString("createDate"));
			
			list.add(qc);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return list;
	}
}










