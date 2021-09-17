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
	<br>
	
	<%
		String memberIdCheck = "";
		if(request.getParameter("memberIdCheck") != null) {
			memberIdCheck = request.getParameter("memberIdCheck");
		}
	%>
	
	<!-- 멤버 아이디가 사용 가능한지 확인하는 폼 -->
	<form method="post" action="<%=request.getContextPath()%>/selectMemberIdCheckAction.jsp">
		<div class="form-group" style="font-weight:bold">
			ID 중복 확인
			<input type="text" name="memberIdCheck" class="form-control" style="width:350px; font-size:20px">
			<div>
				<!-- idCheckResult 값에 따라 출력 -->
				<%
					if(request.getParameter("idCheckResult") == null) {
				%>
						사용 가능한 아이디입니다.
				<%
					} else {
				%>
						이미 존재하는 아이디입니다.
				<%		
					}
				%>
			</div>
			<br>
			<button type="submit" class="btn btn-outline-dark">중복확인</button>
		</div>
	</form>
	<br>
	<!-- 회원가입 폼 -->
	<form method="post" action="<%=request.getContextPath()%>/insertMemberAction.jsp">
		<div class="form-group" style="font-weight:bold">ID
			<input type="text" name="memberId" class="form-control" style="width:350px; font-size:20px" value="<%=memberIdCheck%>" readonly>
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