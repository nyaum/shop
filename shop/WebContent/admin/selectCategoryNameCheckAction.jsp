<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%
	request.setCharacterEncoding("utf-8");
	// categoryNameCheck 값이 null 인지 확인
	if(request.getParameter("categoryNameCheck") == null || request.getParameter("categoryNameCheck").equals("")){
		response.sendRedirect(request.getContextPath() + "/admin/insertCategoryForm.jsp");
		return;
	}

	String categoryNameCheck = request.getParameter("categoryNameCheck");
	
	//categoryDao 에서 selectCategoryName 가져오기
	CategoryDao categoryDao = new CategoryDao();
	String result = categoryDao.selectCategoryName(categoryNameCheck);
	
	// 디버그
	System.out.println(categoryNameCheck);
	
	if(result == null) {
		response.sendRedirect(request.getContextPath() + "/admin/insertCategoryForm.jsp?categoryNameCheck="+categoryNameCheck);
	} else {
		response.sendRedirect(request.getContextPath() + "/admin/insertCategoryForm.jsp?categoryNameCheckResult=exist_category_name");
	}
%>