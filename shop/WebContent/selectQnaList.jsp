<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");

	Qna qna = new Qna();
	QnaDao qnaDao = new QnaDao();
	
	ArrayList<Qna> qnaList = null;
	qnaList = qnaDao.selectQnaList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA List</title>
</head>
<body>
	<!-- start submenu include -->
	<div>
		<jsp:include page="/partial/mainMenu.jsp"></jsp:include>
	</div>
	<br>
	<!-- end submenu include -->
	<div style="text-align:center">
	<div style="text-align:right">
	<%
		if(loginMember == null) {
	%>
		<a href="<%=request.getContextPath()%>/loginForm.jsp">로그인</a> 후에 글 작성이 가능합니다.&nbsp;&nbsp;&nbsp;&nbsp;
	<%
		} else {
	%>
		<a href="<%=request.getContextPath()%>/insertQnaForm.jsp?memberNo=<%=loginMember.getMemberNo()%>" class="btn btn-outline-dark">글 작성</a>
	<%
		}
	%>
	</div>
	<h1>QnA</h1>
	<br>
	<table style="text-align:center" class="table table-striped">
		<thead>
			<tr>
				<th>No</th>
				<th>Title</th>
				<th>MemberNo</th>
				<th>CreateDate</th>
				<th>UpdateDate</th>
			</tr>
		</thead>
		<tbody>
		<%
			for(Qna q : qnaList) {
		%>
			<tr>
				<td style="width:10%"><%=q.getQnaNo()%></td>
				<td>
					<a href="<%=request.getContextPath()%>/selectQnaOne.jsp?qnaNo=<%=q.getQnaNo()%>"><%=q.getQnaTitle()%></a>
				</td>
				<td style="width:10%"><%=q.getMemberNo()%></td>
				<td style="width:15%"><%=q.getCreateDate()%></td>
				<td style="width:15%"><%=q.getUpdateDate()%></td>
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
				<td></td>
			</tr>
		</tfoot>
	</table>
	</div>
</body>
</html>