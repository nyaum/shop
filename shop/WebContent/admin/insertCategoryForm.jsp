<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	// 페이지 관리자가 아니면 들어올 수 없음
	Member loginMember = (Member)session.getAttribute("loginMember");
	// or 연산자는 무조건 null 값 먼저
	if(loginMember == null || loginMember.getMemberLevel() < 1) {
		System.out.println("비로그인 상태이거나, 관리자 계정이 아닙니다.");
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Category Form</title>
</head>
<body>
	<%
	String categoryCheckResult = "";
	if(request.getParameter("categoryCheckResult") != null){
		categoryCheckResult = request.getParameter("categoryCheckResult");
	}
	
	String categoryNameCheck = "";
	if(request.getParameter("categoryNameCheck") != null){
		categoryNameCheck = request.getParameter("categoryNameCheck");
	}
	%>
	<div>
		<jsp:include page="/partial/adminMenu.jsp"></jsp:include>
	</div>
	<br>
	<h1>카테고리 추가 페이지</h1>
	<br>
	<form method="post" action="<%=request.getContextPath()%>/admin/selectCategoryNameCheckAction.jsp">
		<div>
			카테고리 이름 중복 확인
			<input type="text" name="categoryNameCheck" class="form-control" style="width:350px; font-size:20px">
			<div>
				<!-- categoryCheckResult 값에 따라 출력 -->
				<%
				if(!categoryCheckResult.equals("")){
				%>
					<%=request.getParameter("categoryCheckResult") %>
				<%
				}
				%>
			</div>
		</div>
		<br>
		<button type="submit" class="btn btn-outline-dark">중복확인</button>
	</form>
	<br>
	<!-- 카테고리 추가 폼 -->
	<form method="post" action="<%=request.getContextPath()%>/admin/insertCategoryAction.jsp">
		<div>추가 할 카테고리 이름</div>
		<br>
		<div>
			<input type="text" name="categoryName" value="<%=categoryNameCheck%>" class="form-control" style="width:350px; font-size:20px" readonly>
		</div>
		<br><br>
		<button type="submit" class="btn btn-outline-dark">추가</button>
	</form>
</body>
</html>