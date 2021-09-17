<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
	
	//관리자 페이지 방어 코드
	Member loginMember = (Member)session.getAttribute("loginMember");
	// or 연산자는 무조건 null 값 먼저
	if(loginMember == null || loginMember.getMemberLevel() < 1) {
		System.out.println("비로그인 상태이거나, 관리자 계정이 아닙니다.");
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		return;
	}
	
	// categoryDao 가져오기
	CategoryDao categoryDao = new CategoryDao();
	ArrayList<Category> categoryList = null;
	
	categoryList = categoryDao.selectCategoryListAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 리스트</title>
</head>
<body>
	<div>
		<jsp:include page="/partial/adminMenu.jsp"></jsp:include>
	</div>
	<br>
	<h1 style="text-align:center">Select Category List</h1>
	<br>
	<table style="text-align:center" class="table table-striped">
		<thead>
			<tr>
				<th>Category Name</th>
				<th>Update Date</th>
				<th>Create Date</th>
				<th>Current Category State</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Category c : categoryList) {
			%>
					<tr>
						<td><%=c.getCategoryName()%></td>
						<td><%=c.getUpdateDate()%></td>
						<td><%=c.getCreateDate()%></td>
						<td><%=c.getCategoryState()%></td>
						<td>
							<select>
								<option name="categoryState" value="Y">사용</option>
								<option name="categoryState" value="N">미사용</option>
							</select>
						</td>
					</tr>		
			<%		
				}
			%>
		</tbody>
	</table>
	<div style="text-align:center">
		<a href="<%=request.getContextPath()%>/admin/insertCategoryForm.jsp" class="btn btn-outline-dark">카테고리 생성</a>
 	</div>
</body>
</html>