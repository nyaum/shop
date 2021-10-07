package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import commons.DBUtil;
import vo.Comment;


public class CommentDao {
	public double selectOrderScoreAvg(int ebookNo) throws ClassNotFoundException, SQLException {
		double avgScore = 0;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql ="SELECT AVG(order_score) av FROM order_comment where ebook_no=? ORDER BY ebook_no";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, ebookNo);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			avgScore = rs.getDouble("av");
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return avgScore;
	}
	
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
	
	public ArrayList<Comment> commentList(int ebookNo) throws ClassNotFoundException, SQLException{
		ArrayList<Comment> list = new ArrayList<>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT"
				+ " order_score orderScore,"
				+ " order_comment_content orderCommentContent,"
				+ " create_date createDate "
				+ "FROM order_comment "
				+ "WHERE ebook_no=? "
				+ "ORDER BY create_date DESC";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, ebookNo);
		
		System.out.println(stmt + " << commentList");
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Comment c = new Comment();
			
			c.setOrderScore(rs.getInt("orderScore"));
			c.setOrderCommentContent(rs.getString("orderCommentContent"));
			c.setCreateDate(rs.getString("createDate"));
			
			list.add(c);
						
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return list;
	}
}
