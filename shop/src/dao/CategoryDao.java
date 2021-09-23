package dao;

import java.sql.*;
import java.util.*;

import commons.DBUtil;
import vo.Category;

public class CategoryDao {
	
	// 카테고리 리스트 출력
	public ArrayList<Category> selectCategoryListAll() throws ClassNotFoundException, SQLException {
		ArrayList<Category> list = new ArrayList<Category>();
		
		// db연결, 쿼리 작성 후 실행
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT "
				+ "category_name categoryName, "
				+ "update_date updateDate, "
				+ "create_date createDate, "
				+ "category_state categoryState "
				+ "FROM category "
				+ "ORDER BY create_date DESC";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		// 디버그
		System.out.println(stmt);
		
		ResultSet rs = stmt.executeQuery();
		
		// 리스트 생성
		while(rs.next()) {
			Category category = new Category();
			category.setCategoryName(rs.getString("category_name"));
			category.setUpdateDate(rs.getString("update_date"));
			category.setCreateDate(rs.getString("create_date"));
			category.setCategoryState(rs.getString("category_state"));
			
			list.add(category);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return list;
	}
	
	// 카테고리 생성
	public int insertCategory(Category category) throws ClassNotFoundException, SQLException {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "INSERT INTO category (category_name, update_date, create_date, category_state) VALUE (?, NOW(), NOW(), ?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, category.getCategoryName());
		stmt.setString(2, category.getCategoryState());
		
		// 디버그
		System.out.println(stmt);
		
		int row = stmt.executeUpdate();
		stmt.close();
		conn.close();
		
		return row;
	}
	
	//카테고리 중복 확인
	public String selectCategoryName(String categoryNameCheck) throws ClassNotFoundException, SQLException {
		String categoryName = null;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		// 쿼리 작성 및 실행
		String sql = "SELECT category_name FROM category WHERE category_name=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, categoryNameCheck);
		
		//디버그
		System.out.println(stmt);
		
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			categoryName = rs.getString("categoryName");
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return categoryName;
	}

}
