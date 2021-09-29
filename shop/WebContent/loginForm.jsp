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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
	
	<form id="loginForm" method="post" action="<%=request.getContextPath()%>/loginAction.jsp">
		<div class="form-group">Member ID
			<input type="text" id="memberId" name="memberId" class="form-control" style="width:350px; font-size:20px" placeholder="Enter ID">
		</div>
		<div class="form-group">Member PW
			<input type="password" id="memberPw" name="memberPw" class="form-control" style="width:350px; font-size:20px" placeholder="Enter Password">
		</div>
		<button id="loginBtn" type="button" class="btn btn-outline-dark">로그인</button>
	</form>
	
	<script>	
		$('#loginBtn').click(function(){
			//버튼 클릭시
			if($('#memberId').val() == ''){ //id 가 공백일 경우 X
				alert('아이디를 입력하세요')
				return;
			} else if($('#memberPw').val() == ''){ //password 가 공백일 경우 X
				alert('비밀번호를 입력하세요')
			} else {
			$('#loginForm').submit()
			}
		});
	</script>
</body>
</html>









