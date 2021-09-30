<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	System.out.println(noticeNo + " << noticeNo");
	
	NoticeDao noticeDao = new NoticeDao();
	
	Notice n = noticeDao.selectNoticeOne(noticeNo);	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Notice</title>
</head>
<body>
	<!-- start submenu include -->
	<div>
		<jsp:include page="/partial/mainMenu.jsp"></jsp:include>
	</div>
	<br>
	<!-- end submenu include -->
	<div style="text-align:center">
	<h1>공지사항</h1>
	</div>
	<br>
	<table style="text-align:center;" class="table table-striped">
		<tr>
			<td style="width:10%; font-weight:bold">Title</td>
			<td><%=n.getNoticeTitle()%></td>
			<td></td>
		</tr>
		<tr style="line-height:300px">
			<td style="width:10%; font-weight:bold">Contents</td>
			<td><%=n.getNoticeContent()%></td>
		</tr>
		<tr>
			<td style="width:10%; font-weight:bold">CreateDate</td>
			<td><%=n.getCreateDate()%></td>
			<td></td>
		</tr>
		<tr>
			<td style="width:10%; font-weight:bold">UpdateDate</td>
			<td><%=n.getUpdateDate()%></td>
			<td></td>
		</tr>
	<tfoot>
		<tr>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</tfoot>
	</table>
	<div style="text-align:center">
		<%
			Member loginMember = (Member)session.getAttribute("loginMember");
			if(loginMember.getMemberLevel() > 0) {
		%>
			<a href="<%=request.getContextPath()%>/admin/deleteNoticeAction.jsp?noticeNo=<%=noticeNo%>" class="btn btn-outline-danger" id="delete">삭제</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<!--
			<a href="<%=request.getContextPath()%>/admin/updateNoticeForm.jsp?noticeNo=<%=noticeNo%>" class="btn btn-outline-dark">수정</a>
			-->
		<%
			}
		%>
	</div>
</body>
</html>