<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*"%>
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
<title>Insert Notice Form</title>
</head>
<body>
	<div>
		<jsp:include page="/partial/adminMenu.jsp"></jsp:include>
	</div>
	<br>
	<h1 style="text-align:center">공지사항 추가</h1>
	<br>
	<form method="post" action="<%=request.getContextPath()%>/admin/insertNoticeAction.jsp">
	<div style="text-align:center">
	<input type="text" name="memberNo" readonly>
	<h5>Notice Title :</h5>
		<input type="text" name="noticeTitle" style="width:750px; font-size:16px">
		<br><br>
	<h5>Notice Content :</h5>
		<textarea name="noticeContent" style="width:750px; height:500px; font-size:16px"></textarea>
		<br><br>
		<button type="submit" class="btn btn-outline-dark">작성</button>&nbsp;
		<button type="reset" class="btn btn-outline-danger">초기화</button>&nbsp;
		<a href="<%=request.getContextPath()%>/selectNoticeList.jsp" class="btn btn-outline-dark">이전 페이지</a>
	</div>
	</form>
</body>
</html>