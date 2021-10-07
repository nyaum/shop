package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import commons.DBUtil;
import vo.*;

public class QnaDao {
	public ArrayList<Qna> selectQnaList() throws ClassNotFoundException, SQLException {
		ArrayList<Qna> list = new ArrayList<>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT"
				+ " qna_no qnaNo,"
				+ " qna_category qnaCategory,"
				+ " qna_title qnaTitle,"
				+ " qna_secret qnaSecret,"
				+ " member_no memberNo,"
				+ " create_date createDate,"
				+ " update_date updateDate "
				+ "FROM qna "
				+ "ORDER BY create_date DESC";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		System.out.println(stmt);
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Qna q = new Qna();
			
			q.setQnaNo(rs.getInt("qnaNo"));
			q.setQnaCategory(rs.getString("qnaCategory"));
			q.setQnaTitle(rs.getString("qnaTitle"));
			q.setQnaSecret(rs.getString("qnaSecret"));
			q.setMemberNo(rs.getInt("memberNo"));
			q.setCreateDate(rs.getString("createDate"));
			q.setUpdateDate(rs.getString("updateDate"));
			
			list.add(q);	
		}
		return list;
	}
	
	public Qna selectQnaOne(int qnaNo) throws ClassNotFoundException, SQLException {
		Qna qna = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT"
				+ " qna_title qnaTitle,"
				+ " qna_category qnaCategory,"
				+ " member_no memberNo,"
				+ " qna_content qnaContent,"
				+ " create_date createDate,"
				+ " update_date updateDate "
				+ "FROM qna "
				+ "WHERE qna_no=?";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, qnaNo);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			qna = new Qna();
			
			qna.setQnaTitle(rs.getString("qnaTitle"));
			qna.setQnaCategory(rs.getString("qnaCategory"));
			qna.setMemberNo(rs.getInt("memberNo"));
			qna.setQnaContent(rs.getString("qnaContent"));
			qna.setCreateDate(rs.getString("createDate"));
			qna.setUpdateDate(rs.getString("updateDate"));
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return qna;
	}
	
	public void insertQna(Qna qna) throws ClassNotFoundException, SQLException {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "INSERT INTO qna"
				+ "(qna_title,"
				+ " qna_category,"
				+ " qna_secret,"
				+ " member_no,"
				+ " qna_content,"
				+ " create_date,"
				+ " update_date) "
				+ "VALUE (?, ?, ?, ?, ?, NOW(), NOW())";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, qna.getQnaTitle());
		stmt.setString(2, qna.getQnaCategory());
		stmt.setString(3, qna.getQnaSecret());
		stmt.setInt(4, qna.getMemberNo());
		stmt.setString(5, qna.getQnaContent());
		
		ResultSet rs = stmt.executeQuery();
		
		rs.close();
		stmt.close();
		conn.close();
	}
}










