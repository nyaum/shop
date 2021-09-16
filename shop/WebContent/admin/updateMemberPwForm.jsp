<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	int memberNo = Integer.parseInt(request.getParameter("memberNo"));
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Update Member Password</title>
</head>
<body>
	<!-- 관리자 메뉴 include -->
	<div>
		<jsp:include page="/partial/adminMenu.jsp"></jsp:include>
	</div>
	<div>
		<br>
		<h1>비밀번호 변경 페이지</h1>
		<br>
		<form method="post" action="<%=request.getContextPath()%>/admin/updateMemberPwAction.jsp">
			<div style="font-weight:bold;">
				변경될 회원 번호 : <%=memberNo%>
				<br><br>
				<input type="hidden" name="memberNo" value="<%=memberNo%>" readonly>
				New Password :
				<input type="password" name="memberPw" class="form-control" style="width:350px; font-size:20px">
			</div>
			<br>
			<button type="submit" class="btn btn-outline-dark">완료</button>
		</form>
	</div>
</body>
</html>