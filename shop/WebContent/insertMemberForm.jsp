<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Insert Member Page</title>
</head>
<body>
	<div>
		<jsp:include page="/partial/mainMenu.jsp"></jsp:include>
	</div>
	<br>
	<h1>Insert Member Page</h1>
	<form method="post" action="<%=request.getContextPath()%>/insertMemberAction.jsp">
		<div class="form-group" style="font-weight:bold">ID
			<input type="text" name="memberId" class="form-control" style="width:350px; font-size:20px">
		</div>
		<div class="form-group" style="font-weight:bold">PWD
			<input type="password" name="memberPw" class="form-control" style="width:350px; font-size:20px">
		</div>
		<div class="form-group" style="font-weight:bold">Name
			<input type="text" name="memberName" class="form-control" style="width:350px; font-size:20px">
		</div>
		<div class="form-group" style="font-weight:bold">Age
			<input type="text" name="memberAge" class="form-control" style="width:100px; font-size:20px">
		</div>
		<div class="form-group" style="font-weight:bold">Gender
			<br>
			<input type="radio" name="memberGender" value="남">남
			<input type="radio" name="memberGender" value="여">여
		</div>
		<button type="submit" class="btn btn-outline-dark">회원가입</button>
	</form>
</body>
</html>