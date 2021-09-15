<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 로그인을 하지 않은 상태에서만 로그인 가능
	
	if(session.getAttribute("loginMember") != null) {
		System.out.println("이미 로그인 되어 있습니다.");
		response.sendRedirect("/shop/index.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Login Form</title>
</head>
<body>
		<!-- start submenu include -->
	<div>
		<jsp:include page="/partial/mainMenu.jsp"></jsp:include>
	</div>
	<br>
	<h1>Project Login Page</h1>
	<form method="post" action="<%=request.getContextPath()%>/loginAction.jsp">
		<div class="form-group">Member ID
			<input type="text" name="memberId" class="form-control" style="width:350px; font-size:20px">
		</div>
		<div class="form-group">Member PW
			<input type="password" name="memberPw" class="form-control" style="width:350px; font-size:20px">
		</div>
		<button type="submit" class="btn btn-outline-dark">로그인</button>
	</form>
</body>
</html>