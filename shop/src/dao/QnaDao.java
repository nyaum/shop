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
}
