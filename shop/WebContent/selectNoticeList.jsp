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
	<div>
	<%
		if(session.getAttribute("loginMember") == null) {
	%>
			<div style="text-align:right">
				<a href="<%=request.getContextPath()%>/loginForm.jsp" class="btn btn-outline-dark">로그인 </a>
				<a href="<%=request.getContextPath()%>/insertMemberForm.jsp" class="btn btn-outline-dark"> 회원가입</a>
			</div>
	<%
		} else {
			Member loginMember = (Member)session.getAttribute("loginMember");
	%>
			<div style="text-align:right">
				<a href="<%=request.getContextPath()%>/logout.jsp" class="btn btn-outline-dark" >로그아웃</a>
	<%
			if (loginMember.getMemberLevel() > 0) {
	%>
				<a href="<%=request.getContextPath()%>/admin/insertNoticeForm.jsp" class="btn btn-outline-dark">글 작성</a>
			</div>
	<%
			}
		}
	%>
	</div>
	<h1 style="text-align:center">공지 사항</h1>
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
					<td><%=n.getNoticeNo()%></td>
					<td>
					<a href="<%=request.getContextPath()%>/selectNoticeOne.jsp?noticeNo=<%=n.getNoticeNo()%>"><%=n.getNoticeTitle()%></a>
					</td>
					<td><%=n.getCreateDate()%></td>
					<td><%=n.getUpdateDate()%></td>
				</tr>
		<%
			}
		%>
		</tbody>
	</table>
</body>
</html>