<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
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
	
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	String noticeContent = request.getParameter("noticeContent");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Notice Form</title>
</head>
<body>
	<form method="post" action="<%=request.getContextPath()%>/admin/updateNoticeAction.jsp?noticeNo=<%=noticeNo%>">
		<div>
			<h1>Update Notice</h1>
			<br>
			<input type="text" value="<%=noticeNo%>" readonly>
			<textarea><%=noticeContent%></textarea>
		</div>
	</form>
</body>
</html>