package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import commons.DBUtil;
import vo.Comment;


public class CommentDao {
	public void insertOrderComment(Comment comment) throws ClassNotFoundException, SQLException {
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "INSERT INTO order_comment(order_no, ebook_no, order_score, order_comment_content, create_date, update_date) VALUES (?, ?, ?, ?, NOW(), NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, comment.getOrderNo());
		stmt.setInt(2, comment.getEbookNo());
		stmt.setInt(3, comment.getOrderScore());
		stmt.setString(4, comment.getOrderCommentContent());

		int row = stmt.executeUpdate();
		
		if(row == 1) {
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}
		
		stmt.close();
		conn.close();
		
		return;
	}
}
