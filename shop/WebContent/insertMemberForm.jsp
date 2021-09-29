<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
	<form id="signin" method="post" action="<%=request.getContextPath()%>/insertMemberAction.jsp">
		<div class="form-group" style="font-weight:bold">ID
			<input id="memberId" type="text" name="memberId" class="form-control" style="width:350px; font-size:20px" value="<%=memberIdCheck%>" readonly>
		</div>
		<div class="form-group" style="font-weight:bold">PWD
			<input id="memberPw" type="password" name="memberPw" class="form-control" style="width:350px; font-size:20px">
		</div>
		<div class="form-group" style="font-weight:bold">Name
			<input id="memberName" type="text" name="memberName" class="form-control" style="width:350px; font-size:20px">
		</div>
		<div class="form-group" style="font-weight:bold">Age
			<input id="memberAge" type="text" name="memberAge" class="form-control" style="width:100px; font-size:20px">
		</div>
		<div class="form-group" style="font-weight:bold">Gender
			<br>
			<input type="radio" name="memberGender" class="memberGender" value="남">남
			<input type="radio" name="memberGender" class="memberGender" value="여">여
		</div>
		<button id="btn" type="button" class="btn btn-outline-dark">회원가입</button>
	</form>
	
	<script>
		$('#btn').click(function(){
			if($('#memberId').val() == '') {
				alert('아이디를 입력하세요.')
				return;
			}
			
			if($('#memberPw').val() == '') {
				alert('비밀번호를 입력하세요.')
				return;
			}
			
			if($('#memberName').val() == '') {
				alert('이름을 입력하세요.')
				return;
			}
			
			if($('#memberAge').val() == '') {
				alert('나이를 입력하세요.')
				return;
			}
			
			// . 클래스 속성으로 부르면 리턴값은 배열
			let memberGender = $('.memberGender:checked');
			if(memberGender.length == 0) {
				alert('성별을 선택하세요.')
				return;
			}
			
			$('#signin').submit();
		})
	</script>
	
</body>
</html>






