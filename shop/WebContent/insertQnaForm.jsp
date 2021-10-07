<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");

	Member loginMember = (Member)session.getAttribute("loginMember");
	// or 연산자는 무조건 null 값 먼저
	if(loginMember == null) {
		System.out.println("비로그인 상태입니다.");
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		return;
	}
	
	QnaDao qnaDao = new QnaDao();
	
	int memberNo = Integer.parseInt(request.getParameter("memberNo"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert QnA Form</title>
</head>
<body>
	<!-- start submenu include -->
	<div>
		<jsp:include page="/partial/mainMenu.jsp"></jsp:include>
	</div>
	<br>
	<!-- end submenu include -->
	<h1 style="text-align:center">QnA 작성</h1>
	<br>
	<form method="post" action="<%=request.getContextPath()%>/insertQnaAction.jsp">
	<div style="text-align:center">
	<h5>QnA Title</h5>
		<input type="text" name="qnaTitle" style="width:750px; font-size:16px">
		<br><br>
	<div style="font-weight:bold">
	Category: 
	<select name="qnaCategory">
		<option>전자책 관련</option>
		<option>회원정보 관련</option>
		<option>주문 관련</option>
		<option>버그 신고</option>
		<option>기타</option>
	</select>
	&emsp;&emsp;&emsp;&emsp;
	비밀글: 
	<input type="radio" name="qnaSecret" value="Y">예 
	<input type="radio" name="qnaSecret" value="N">아니오
	<input type="hidden" name="memberNo" value="<%=memberNo%>">
	</div>
	<br>
	<h5>QnA Content</h5>
		<textarea name="qnaContent" style="width:750px; height:500px; font-size:16px"></textarea>
		<br><br>
		<button type="submit" class="btn btn-outline-dark">작성</button>&nbsp;
		<button type="reset" class="btn btn-outline-danger">초기화</button>&nbsp;
		<a href="<%=request.getContextPath()%>/selectQnAList.jsp" class="btn btn-outline-dark">이전 페이지</a>
	</div>
	</form>
</body>
</html>