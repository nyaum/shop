<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	// or 연산자는 무조건 null 값 먼저
	if(loginMember == null || loginMember.getMemberLevel() < 1) {
		System.out.println("비로그인 상태이거나, 관리자 계정이 아닙니다.");
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		return;
	}
	
	int memberNo = Integer.parseInt(request.getParameter("memberNo"));
	System.out.println(memberNo);
	
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Update Member Level</title>
</head>
<body>
	<!-- 관리자 메뉴 include -->
	<div>
		<jsp:include page="/partial/adminMenu.jsp"></jsp:include>
	</div>
	<div style="text-align:center">
		<br>
		<h1>회원 등급 수정 페이지</h1>
		<br>
		<form method="post" action="<%=request.getContextPath()%>/admin/updateMemberLevelAction.jsp">
			<div>현재 멤버 번호 : <%=memberNo%></div>
			<input type="hidden" name="memberNo" value="<%=memberNo%>">
			<br>
			<div>
				<select name="memberLevel" class="custom-select" style="width:auto; font-align:center">
					<option value="0">일반 회원</option>
					<option value="1">관리자</option>
				</select>
			</div>
			<br>
			<button type="submit" class="btn btn-outline-dark">수정 완료</button>
		</form>
	</div>
</body>
</html>