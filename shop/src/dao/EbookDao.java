package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import vo.*;
import commons.*;

public class EbookDao {
	
	
	//인기 상품 목록
	public ArrayList<Ebook> selectPopularEbookList() throws ClassNotFoundException, SQLException {
		ArrayList<Ebook> list = new ArrayList<>();
		/*
		 * SELECT t.ebook_no ebookNo, e.ebook_title ebookTitle, e.ebook_img ebookImg, e.ebook_price ebookPrice FROM ebook e INNER JOIN (SELECT ebook_no, COUNT(ebook_no) cnt FROM orders GROUP BY ebook_no ORDER BY COUNT(ebook_no) DESC LIMIT 0, 5) t ON e.ebook_no = t.ebook_no
		 */
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECT t.ebook_no ebookNo, e.ebook_title ebookTitle, e.ebook_img ebookImg, e.ebook_price ebookPrice FROM ebook e INNER JOIN (SELECT ebook_no, COUNT(ebook_no) cnt FROM orders GROUP BY ebook_no ORDER BY COUNT(ebook_no) DESC LIMIT 0, 5) t ON e.ebook_no = t.ebook_no";
		PreparedStatement stmt = conn.prepareStatement(sql);

		ResultSet rs = stmt.executeQuery();

		System.out.println("EbookDao.selectEbookList stmt : " + stmt);
		System.out.println("EbookDao.selectEbookList rs : " + rs);


		while (rs.next()) {
			Ebook e = new Ebook();

			// 정보은닉되어있는 필드값 직접 쓰기 불가
			// 캡슐화 메서드(setter)를 통해 쓰기
			e.setEbookNo(rs.getInt("ebookNo"));
			e.setEbookTitle(rs.getString("ebookTitle"));
			e.setEbookImg(rs.getString("ebookImg"));
			e.setEbookPrice(rs.getInt("ebookPrice"));

			list.add(e);
		}

		rs.close();
		stmt.close();
		conn.close();

		return list;
		
	}
	
	//책 이미지 수정
	public void updateEbookImg(Ebook ebook) throws ClassNotFoundException, SQLException {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "UPDATE ebook SET ebook_img=? WHERE ebook_no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ebook.getEbookImg());
		stmt.setInt(2, ebook.getEbookNo());
		stmt.executeUpdate();
		stmt.close();
		conn.close();
	}
	//책 정보
	public Ebook selectEbookOne(int ebookNo) throws ClassNotFoundException, SQLException {
		Ebook ebook = null;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECT ebook_no ebookNo, ebook_img ebookImg FROM ebook WHERE ebook_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, ebookNo);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			ebook = new Ebook();
			ebook.setEbookNo(rs.getInt("ebookNo"));
			ebook.setEbookImg(rs.getString("ebookImg"));
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return ebook;
	}
	
	// [전자책 관리 & 고객 전자책 출력] 전자책 목록을 출력하는 메서드
	// SELECT 한 값을 자료구조화 하여 list 생성 후 리턴
	public ArrayList<Ebook> selectEbookList(int beginRow, int rowPerPage) throws ClassNotFoundException, SQLException {
		ArrayList<Ebook> list = new ArrayList<>();
		/*
		 * SELECT ebook_no ebookNo, ebook_title ebookTitle, category_name categoryName,
		 * ebook_state ebookState FROM ebook ORDER BY create_date DESC LIMIT ?, ?
		 */
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECT ebook_no ebookNo, ebook_title ebookTitle, ebook_img ebookImg, ebook_price ebookPrice, category_name categoryName, ebook_state ebookState FROM ebook ORDER BY create_date DESC LIMIT ?, ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();

		System.out.println("[Debug] EbookDao.selectEbookList stmt : " + stmt);
		System.out.println("[Debug] EbookDao.selectEbookList rs : " + rs);


		while (rs.next()) {
			Ebook e = new Ebook();

			// 정보은닉되어있는 필드값 직접 쓰기 불가
			// 캡슐화 메서드(setter)를 통해 쓰기
			e.setEbookNo(rs.getInt("ebookNo"));
			e.setEbookTitle(rs.getString("ebookTitle"));
			e.setEbookImg(rs.getString("ebookImg"));
			e.setEbookPrice(rs.getInt("ebookPrice"));
			e.setCategoryName(rs.getString("categoryName"));
			e.setEbookState(rs.getString("ebookState"));

			list.add(e);
		}

		rs.close();
		stmt.close();
		conn.close();

		return list;
	}
	
	// [전자책 관리] 선택된 카테고리가 있을 때 전자책 목록을 출력하는 메서드
	// SELECT 한 값을 자료구조화 하여 list 생성 후 리턴
	public ArrayList<Ebook> selectEbookListByCategory(int beginRow, int rowPerPage, String category)
			throws ClassNotFoundException, SQLException {
		ArrayList<Ebook> list = new ArrayList<>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECT ebook_no ebookNo, ebook_title ebookTitle, category_name categoryName, ebook_state ebookState FROM ebook WHERE category_name LIKE ? ORDER BY create_date DESC LIMIT ?, ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%" + category + "%");
		stmt.setInt(2, beginRow);
		stmt.setInt(3, rowPerPage);
		ResultSet rs = stmt.executeQuery();

		System.out.println("[Debug] EbookDao.selectEbookList stmt : " + stmt);
		System.out.println("[Debug] EbookDao.selectEbookList rs : " + rs);

		while (rs.next()) {
			Ebook e = new Ebook();

			// 정보은닉되어있는 필드값 직접 쓰기 불가
			// 캡슐화 메서드(setter)를 통해 쓰기
			e.setEbookNo(rs.getInt("ebookNo"));
			e.setEbookTitle(rs.getString("ebookTitle"));
			e.setCategoryName(rs.getString("categoryName"));
			e.setEbookState(rs.getString("ebookState"));

			list.add(e);
		}

		rs.close();
		stmt.close();
		conn.close();

		return list;
	}
	
	// [전자책 관리] 전자책 관리 페이지의 마지막 페이지를 구하는 메서드
	// totalCount(전체 행)의 값을 구해서 마지막 페이지의 값을 리턴해줌
	// ROW_PER_PAGE : 한 페이지에 보여줄 행의 값
	public int selectEbookLastPage(int rowPerPage, String category) throws ClassNotFoundException, SQLException {
		int lastPage = 0;
		// 마리아db 연결 메소드 호출
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "";
		if (category.equals("") == true) {
			sql = "SELECT COUNT(*) from ebook";
		} else {
			sql = "SELECT COUNT(*) from ebook WHERE category_name LIKE '%" + category + "%'";
		}

		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		int totalRowCount = 0;

		System.out.println("[Debug] selectebookLastPage stmt : " + stmt);
		System.out.println("[Debug] selectebookLastPage rs : " + rs);

		if (rs.next()) {
			totalRowCount = rs.getInt("COUNT(*)");
		}
		lastPage = totalRowCount / rowPerPage;
		if (totalRowCount % rowPerPage != 0) {
			lastPage++;
		}

		rs.close();
		stmt.close();
		conn.close();

		return lastPage;
	}

	// [전자책 관리] 전자책 관리 페이지의 선택된 카테고리가 있을 시 마지막 페이지를 구하는 메서드
	// totalCount(전체 행)의 값을 구해서 마지막 페이지의 값을 리턴해줌
	// ROW_PER_PAGE : 한 페이지에 보여줄 행의 값
	public int selectEbookListByCategoryLastPage(int ROW_PER_PAGE, String categoryName) throws ClassNotFoundException, SQLException{
		int totalCount = 0;
		int lastPage = 0;
		
		// dbUtil 객체 생성
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECT count(*) FROM ebook WHERE category_name LIKE ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, categoryName);
		
		ResultSet rs = stmt.executeQuery();
		// 디버깅 : 쿼리내용과 표현식의 파라미터값 확인가능
		System.out.println("총 행의 개수 stmt : "+stmt);
		
		// totalCount 저장
		if(rs.next()) {
			totalCount = rs.getInt("count(*)");
		}
		System.out.println("totalCounnt(총 행의 개수) : "+totalCount);
				
		// 마지막 페이지
		// lastPage를 전체 행의 수와 한 페이지에 보여질 행의 수(rowPerPage)를 이용하여 구한다
		lastPage = totalCount / ROW_PER_PAGE;
		if(totalCount % ROW_PER_PAGE != 0) {
			lastPage+=1;
			}
		System.out.println("lastPage(마지막 페이지 번호) : "+lastPage);
				
		rs.close();
		stmt.close();
		conn.close();
				
		return lastPage;
	}
}