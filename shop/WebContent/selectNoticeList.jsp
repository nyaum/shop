<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	Notice notice = new Notice();
	NoticeDao noticeDao = new NoticeDao();
	ArrayList<Notice> noticeList = null;
	
	noticeList = noticeDao.selectNoticeList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Page</title>
</head>
<body>
	<!-- start submenu include -->
	<div>
		<jsp:include page="/partial/mainMenu.jsp"></jsp:include>
	</div>
	<br>
	<!-- end submenu include -->
	<h1 style="text-align:center">공지 사항</h1>
	<div style="text-align:right">
	<%
			Member loginMember = (Member)session.getAttribute("loginMember");
			if (loginMember.getMemberLevel() > 0) {
	%>
				<a href="<%=request.getContextPath()%>/admin/insertNoticeForm.jsp?memberNo=<%=loginMember.getMemberNo()%>" class="btn btn-outline-dark">글 작성</a>
	<%
			}
	%>
	</div>
	<br>
	<table style="text-align:center" class="table table-striped">
		<thead>
			<tr>
				<th>NoticeNo</th>
				<th>Title</th>
				<th>CreateDate</th>
				<th>UpdateDate</th>
			</tr>
		</thead>
		<tbody>
		<%
			for(Notice n : noticeList) {
		%>	
				<tr>
					<td style="width:5%"><%=n.getNoticeNo()%></td>
					<td style="width:55%">
					<a href="<%=request.getContextPath()%>/selectNoticeOne.jsp?noticeNo=<%=n.getNoticeNo()%>"><%=n.getNoticeTitle()%></a>
					</td>
					<td style="width:20%"><%=n.getCreateDate()%></td>
					<td style="width:20%"><%=n.getUpdateDate()%></td>
				</tr>
		<%
			}
		%>
		</tbody>
		<tfoot>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tfoot>
	</table>
</body>
</html>