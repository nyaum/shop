package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import commons.DBUtil;
import vo.Member;
 
public class MemberDao {
// [관리자코드]
	//회원 아이디 검색(목록)
	public ArrayList<Member> selectMemberListAllBySearchMemberId(int beginRow, int rowPerPage, String searchMemberId) throws ClassNotFoundException, SQLException{
		//회원 목록 출력
		ArrayList<Member> list = new ArrayList<Member>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();

		/*
		 * SELECT
		 * 	member_no memberNo,
		 * 	member_id memberId,
		 * 	member_level memberLevel,
		 * 	member_name memberName,
		 * 	member_age memberAge,
		 * 	member_gender memberGender,
		 * 	update_date updateDate,
		 * 	create_date createDate,
		 * FROM member
		 * WHERE member_id LIKE ?
		 * ORDER BY create_date DESC
		 * LIMIT ?, ?
		 */
		
		String sql = "SELECT"
				+ " member_no memberNo,"
				+ " member_id memberId,"
				+ " member_level memberLevel,"
				+ " member_name memberName,"
				+ " member_age memberAge,"
				+ " member_gender memberGender,"
				+ " update_date updateDate,"
				+ " create_date createDate"
				+ " FROM member"
				+ " WHERE member_id LIKE ?"
				+ " ORDER BY create_date DESC"
				+ " LIMIT ?, ?";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, "%"+searchMemberId+"%");
		stmt.setInt(2, beginRow);
		stmt.setInt(3, rowPerPage);
		
		System.out.println(stmt);
		System.out.println(beginRow);
		System.out.println(rowPerPage);
		
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Member member = new Member();
			member.setMemberNo(rs.getInt("member_no"));
			member.setMemberId(rs.getString("member_id"));
			member.setMemberLevel(rs.getInt("member_level"));
			member.setMemberName(rs.getString("member_name"));
			member.setMemberAge(rs.getInt("member_age"));
			member.setMemberGender(rs.getString("member_gender"));
			member.setUpdateDate(rs.getString("update_date"));
			member.setCreateDate(rs.getString("create_date"));
			
			list.add(member);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return list;
	}
	
	
	public ArrayList<Member> selectMemberListAllByPage(int beginRow, int rowPerPage) throws ClassNotFoundException, SQLException{
		//회원 목록 출력
		ArrayList<Member> list = new ArrayList<Member>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();

		/*
		 * SELECT
		 * 	member_no memberNo,
		 * 	member_id memberId,
		 * 	member_level memberLevel,
		 * 	member_name memberName,
		 * 	member_age memberAge,
		 * 	member_gender memberGender,
		 * 	update_date updateDate,
		 * 	create_date createDate,
		 * FROM member
		 * ORDER BY create_date DESC
		 * LIMIT ?, ?
		 */
		
		String sql = "SELECT"
				+ " member_no memberNo,"
				+ " member_id memberId,"
				+ " member_level memberLevel,"
				+ " member_name memberName,"
				+ " member_age memberAge,"
				+ " member_gender memberGender,"
				+ " update_date updateDate,"
				+ " create_date createDate"
				+ " FROM member"
				+ " ORDER BY create_date DESC"
				+ " LIMIT ?, ?";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		
		System.out.println(stmt);
		System.out.println(beginRow);
		System.out.println(rowPerPage);
		
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Member member = new Member();
			member.setMemberNo(rs.getInt("member_no"));
			member.setMemberLevel(rs.getInt("member_level"));
			member.setMemberId(rs.getString("member_id"));
			member.setMemberName(rs.getString("member_name"));
			member.setMemberAge(rs.getInt("member_age"));
			member.setMemberGender(rs.getString("member_gender"));
			member.setUpdateDate(rs.getString("update_date"));
			member.setCreateDate(rs.getString("create_date"));
			
			list.add(member);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return list;
	}
	
	//총 멤버 수
	public int totalMemberCount(String searchMemberId) throws ClassNotFoundException, SQLException {
		int totalCount = 0 ;
		//db접속 메소드 호출
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		//쿼리생성, 실행
		String sql = "SELECT count(*) FROM member WHERE member_id LIKE ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%"+searchMemberId+"%");
		ResultSet rs= stmt.executeQuery();
		while(rs.next()) {
			totalCount = rs.getInt("COUNT(*)");
		}
		
		return totalCount;
	}
	
// [회원 코드]
	public int insertMember(Member member) throws ClassNotFoundException, SQLException {
		//회원 가입 코드
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();

		/*
		 * INSERT INTO member (
		 * 	 member_id, 
		 *   member_pw, 
		 *   member_level, 
		 *   member_name, 
		 *   member_age, 
		 *   member_gender, 
		 *   update_date, 
		 *   create_date
		 * ) VALUES (
		 *   ?, PASSWORD(?), 0, ?, ?, NOW(), NOW()
		 * )
		 * 
		 */
		
		String sql = "INSERT INTO member (member_id, member_pw, member_level, member_name, member_age, member_gender, update_date, create_date) VALUES (?, PASSWORD(?), 0, ?, ?, ?, NOW(), NOW())";		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setString(2, member.getMemberPw());
		stmt.setString(3, member.getMemberName());
		stmt.setInt(4, member.getMemberAge());
		stmt.setString(5, member.getMemberGender());
		System.out.println(stmt);
		
		int row = stmt.executeUpdate();
		stmt.close();
		conn.close();
		
		return row;
		
	}
	public Member login(Member member) throws ClassNotFoundException, SQLException {
		
		System.out.println(member.getMemberId());
		System.out.println(member.getMemberPw());
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		/*
		 * SELECT 
		 *  member_no memberNo, 
		 *  member_id memberId, 
		 *  member_level memberLevel
		 * FROM
		 *  member
		 * WHERE
		 *  member_id=? AND member_pw=PASSWORD(?)
		 *  
		 */
		
		String sql=
				"SELECT "
				+ " member_no memberNo, "
				+ " member_id memberId, "
				+ " member_name memberName, "
				+ " member_level memberLevel "
				+ "FROM "
				+ " member "
				+ "WHERE "
				+ " member_id=? AND member_pw=PASSWORD(?)";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setString(2, member.getMemberPw());
		System.out.println(stmt);
		
		ResultSet rs = stmt.executeQuery();
		
		if (rs.next()) {
			Member returnMember = new Member();
			returnMember.setMemberNo(rs.getInt("memberNo"));
			returnMember.setMemberId(rs.getString("memberId"));
			returnMember.setMemberName(rs.getString("memberName"));
			returnMember.setMemberLevel(rs.getInt("memberLevel"));
			return returnMember;
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return null;
	}
}
