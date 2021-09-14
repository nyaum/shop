<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Index</title>
</head>
<body>
	<!-- start submenu include -->
	<div>
		<jsp:include page="/partial/submenu.jsp"></jsp:include>
	</div>
	<!-- end submenu include -->
	<h1>메인 페이지</h1>
	<%
		if(session.getAttribute("loginMember") == null) {
	%>		
			<!-- 로그인을 하지 않았을 경우 로그인과 회원가입 버튼 출력 -->
			<div>
				<div class="btn btn-outline-dark">
					<a href="<%=request.getContextPath()%>/loginForm.jsp">로그인</a>
				</div>
				<div class="btn btn-outline-dark">
					<a href="<%=request.getContextPath()%>/insertMemberForm.jsp">회원가입</a>
				</div>
			</div>
			<!-- 로그인을 했을 경우 이름과 로그아웃 버튼 출력 -->
	<%
		} else {
			Member loginMember = (Member)session.getAttribute("loginMember");	
	%>
			<div>
				<%=loginMember.getMemberName()%>, 로그인! &nbsp;
				<a href="<%=request.getContextPath()%>/logout.jsp" class="btn btn-outline-dark">로그아웃</a>
			</div>
	<% 
		}
	%>
</body>
</html>