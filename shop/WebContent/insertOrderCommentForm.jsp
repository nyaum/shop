<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*"%>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	Member loginMember = (Member)session.getAttribute("loginMember");
	
	if(loginMember == null) {
		System.out.println("비로그인 상태입니다.");
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		return;
	}
	
	EbookDao ebookDao = new EbookDao();
	
	int ebookNo = Integer.parseInt(request.getParameter("ebookNo"));
	int orderNo = Integer.parseInt(request.getParameter("orderNo"));
	String ebookName = request.getParameter("ebookName");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Review Form</title>
</head>
<body>
	<!-- start submenu include -->
	<div>
		<jsp:include page="/partial/mainMenu.jsp"></jsp:include>
	</div>
	<br>
	<div style="text-align:center">
		<h1>Review Page</h1>
		<h3><%=ebookName%></h3>
	<br>
	<table style="text-align:center" class="table table-striped">
		<thead>
			<tr>
				<th>MemberId</th>
				<th>Comment</th>
				<th>OrderScore</th>
				<th>CreateDate</th>
				<th>UpdateDate</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			</tr>
		</tbody>
	</table>
	</div>
	<br>
	<div>
	<form method="post" action="<%=request.getContextPath()%>/insertOrderCommentAction.jsp?orderNo=<%=orderNo%>&ebookNo=<%=ebookNo%>">
		<input type="hidden" name="orderNo" value="<%=orderNo%>">
		<input type="hidden" name="ebookNo" value="<%=ebookNo%>">
		<span style="font-weight:bold">
		Comment
		</span>	
			<br><textarea rows="5" cols="155" name="orderCommentContent"></textarea>
		<span style="font-weight:bold">
		Score : 
		</span>
			<input type="text" name="orderScore" style="width:30px"> / 10
		<button type="submit" class="btn btn-outline-dark">작성</button>	
	</form>
	</div>
</body>
</html>