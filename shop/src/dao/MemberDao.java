package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import commons.DBUtil;
import vo.Member;

public class MemberDao {
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
