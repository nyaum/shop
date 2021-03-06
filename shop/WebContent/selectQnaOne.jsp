<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");

	int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
	System.out.println(qnaNo);
	
	QnaDao qnaDao = new QnaDao();
	QnaCommentDao qnaCommentDao = new QnaCommentDao();
	
	Qna q = qnaDao.selectQnaOne(qnaNo);
	
	int currentPage = 1;
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));	
	}
	
	final int ROW_PER_PAGE = 5;
	int beginRow = (currentPage-1)*ROW_PER_PAGE;
	int totalCount = 0;
	
	ArrayList<QnaComment> qnaCommentList = qnaCommentDao.qnaCommentListByPage(qnaNo, beginRow, ROW_PER_PAGE);
	
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null) {
		return;
	}
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
			<th style="width:20%; text-align:left"><%=q.getQnaTitle()%></th>
			<th><%=q.getQnaCategory()%></th>
			<th><%=q.getMemberNo()%></th>
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
	<br>
	<div style="text-align:center">
		<h2>답변</h2>
	</div>
	<br>
	<table style="text-align:center;" class="table table-striped">
		<thead>
			<tr>
				<th style="width:25%">MeberNo</th>
				<th>Comment</th>
				<th style="width:25%">Date</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(QnaComment qc : qnaCommentList) {
			%>
			<tr>
				<td><%=qc.getMemberNo()%></td>
				<td><%=qc.getQnaCommentContent()%></td>
				<td><%=qc.getCreateDate()%></td>
			</tr>
			<%
				}
			%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="3"></td>
			</tr>
		</tfoot>
	</table>
	<div style="text-align:center">
	<%
		if (beginRow >= 1) {
	%>
			<a href="<%=request.getContextPath()%>/selectQnaOne.jsp?qnaNo=<%=qnaNo%>&currentPage=<%=currentPage-1%>" class="btn btn-outline-dark">이전</a>
	<%
		}
		int lastPage = totalCount / ROW_PER_PAGE;
		
		if(totalCount % ROW_PER_PAGE != 0) {
			lastPage += 1;
		}
		
		if (currentPage < lastPage) {
	%>	
			<a href="<%=request.getContextPath()%>/selectQnaOne.jsp?qnaNo=<%=qnaNo%>&currentPage=<%=currentPage+1%>" class="btn btn-outline-dark">다음</a>
	<%
		}
	%>
	</div>
</body>
</html>









