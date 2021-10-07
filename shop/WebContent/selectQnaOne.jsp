<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%
	request.setCharacterEncoding("utf-8");

	int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
	System.out.println(qnaNo);
	
	QnaDao qnaDao = new QnaDao();
	
	Qna q = qnaDao.selectQnaOne(qnaNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View QnA</title>
</head>
<body>
	<!-- start submenu include -->
	<div>
		<jsp:include page="/partial/mainMenu.jsp"></jsp:include>
	</div>
	<br>
	<!-- end submenu include -->
	<div style="text-align:center">
	<h1>묻고 답하기</h1>
	</div>
	<br>
	<table style="text-align:center;" class="table table-striped">
	<thead>
		<tr>
			<th></th>
			<th>Title: <%=q.getQnaTitle()%></th>
			<th>Category: <%=q.getQnaCategory()%></th>
			<th>MemberNo: <%=q.getMemberNo()%></th>
		</tr>
	</thead>
	<tbody>
		<tr style="line-height:300px">
			<td style="width:10%; font-weight:bold">Content</td>
			<td colspan="3"><%=q.getQnaContent()%></td>
		</tr>
		<tr>
			<td style="width:10%; font-weight:bold">CreateDate</td>
			<td colspan="3"><%=q.getCreateDate()%></td>
		</tr>
		<tr>
			<td style="width:10%; font-weight:bold">UpdateDate</td>
			<td colspan="3"><%=q.getUpdateDate()%></td>
		</tr>
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