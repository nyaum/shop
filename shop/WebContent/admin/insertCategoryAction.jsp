<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%
	request.setCharacterEncoding("utf-8");

	if(request.getParameter("categoryName") == null || request.getParameter("categoryState") == null) {
		response.sendRedirect(request.getContextPath() + "/admin/insertCategoryForm.jsp");
		return;
	}
	
	if(request.getParameter("categoryName").equals("") || request.getParameter("categoryState").equals("")){
		response.sendRedirect(request.getContextPath() + "/admin/insertCategoryForm.jsp");
		return;
	}
	
	String categoryName = request.getParameter("categoryName");
	String categoryState = request.getParameter("categoryState");
	
	Category category = new Category();
	category.setCategoryName(categoryName);
	category.setCategoryState(categoryState);
	
	//디버그
	System.out.println(categoryName);
	System.out.println(categoryState);
	
	CategoryDao categoryDao = new CategoryDao();
	int row = categoryDao.insertCategory(category);
	
	// 디버그 후 리다이렉트
	if(row == 1) {
		System.out.println("올바른 값 입력");
		response.sendRedirect(request.getContextPath() + "/admin/selectCategoryList.jsp");
	} else {
		System.out.println("잘못 된 값 입력");
		response.sendRedirect(request.getContextPath() + "/admin/insertCategoryForm.jsp");
	}
%>