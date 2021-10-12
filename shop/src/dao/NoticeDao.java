package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import commons.DBUtil;
import vo.*;

public class NoticeDao {
	public ArrayList<Notice> selectNoticeListByPage(int beginRow, int rowPerPage) throws ClassNotFoundException, SQLException {
		ArrayList<Notice> list = new ArrayList<>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT"
				+ " notice_no noticeNo,"
				+ " notice_title noticeTitle,"
				+ " member_no memberNo,"
				+ " create_date createDate,"
				+ " update_date updateDate"
				+ " FROM notice"
				+ " ORDER BY create_date DESC"
				+ " LIMIT ?, ?";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		
		System.out.println(stmt + " << noticeList stmt");
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Notice n = new Notice();
			
			n.setNoticeNo(rs.getInt("noticeNo"));
			n.setNoticeTitle(rs.getString("noticeTitle"));
			n.setMemberNo(rs.getInt("memberNo"));
			n.setCreateDate(rs.getString("createDate"));
			n.setUpdateDate(rs.getString("updateDate"));
			
			list.add(n);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return list;
	}
	
	public ArrayList<Notice> selectNoticeListIndex(int indexBeginRow, int indexRowPerPage) throws ClassNotFoundException, SQLException {
		ArrayList<Notice> list = new ArrayList<>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT"
				+ " notice_no noticeNo,"
				+ " notice_title noticeTitle,"
				+ " member_no memberNo,"
				+ " create_date createDate,"
				+ " update_date updateDate"
				+ " FROM notice"
				+ " ORDER BY create_date DESC"
				+ " LIMIT ?, ?";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, indexBeginRow);
		stmt.setInt(2, indexRowPerPage);
		
		System.out.println(stmt + " << noticeList stmt");
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Notice n = new Notice();
			
			n.setNoticeNo(rs.getInt("noticeNo"));
			n.setNoticeTitle(rs.getString("noticeTitle"));
			n.setMemberNo(rs.getInt("memberNo"));
			n.setCreateDate(rs.getString("createDate"));
			n.setUpdateDate(rs.getString("updateDate"));
			
			list.add(n);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return list;
	}
	
	public void insertNotice(Notice notice) throws ClassNotFoundException, SQLException {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "INSERT INTO notice"
				+ "(notice_title,"
				+ " notice_content,"
				+ " member_no,"
				+ " create_date,"
				+ " update_date) "
				+ "VALUES (?,?,?,NOW(),NOW())";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, notice.getNoticeTitle());
		stmt.setString(2, notice.getNoticeContent());
		stmt.setInt(3, notice.getMemberNo());
		
		ResultSet rs = stmt.executeQuery();
		
		rs.close();
		stmt.close();
		conn.close();
	}
	
	public Notice selectNoticeOne(int noticeNo) throws ClassNotFoundException, SQLException {
		Notice notice = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECT"
				+ " notice_title noticeTitle,"
				+ " notice_content noticeContent,"
				+ " create_date createDate,"
				+ " update_date updateDate"
				+ " FROM notice"
				+ " WHERE notice_no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, noticeNo);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			notice = new Notice();
			
			notice.setNoticeTitle(rs.getString("noticeTitle"));
			notice.setNoticeContent(rs.getString("noticeContent"));
			notice.setCreateDate(rs.getString("createDate"));
			notice.setUpdateDate(rs.getString("updateDate"));
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return notice;
	}
	
	public void deleteNotice(int noticeNo) throws ClassNotFoundException, SQLException {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "DELETE FROM notice WHERE notice_no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, noticeNo);
		
		ResultSet rs = stmt.executeQuery();
		
		rs.close();
		stmt.close();
		conn.close();
		
		return;
	}
}













