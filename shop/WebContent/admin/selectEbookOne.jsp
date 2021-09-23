<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");

	//adminPage의 방어코드
	// session에 저장된 loginMember를 받아옴
	Member loginMember = (Member)session.getAttribute("loginMember");
	// loginMember가 null이거나 memberLevel이 1이하 일 때 이 페이지를 들어올 수 없음
	// if문 순서 중요함! 순서가 틀리면 NullPointExeption 일어남
	if(loginMember == null || loginMember.getMemberLevel() < 1){
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
	
	int ebookNo = Integer.parseInt(request.getParameter("ebookNo"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- start: adminMenu include -->
	<div>
		<jsp:include page="/partial/adminMenu.jsp"></jsp:include>
	</div>
	<%
		EbookDao ebookDao = new EbookDao();
		Ebook ebook = ebookDao.selectEbookOne(ebookNo);
	%>
	<div>
		<%=ebook.getEbookNo()%>
	</div>
	<div>
		<img src="<%=request.getContextPath()%>/image/<%=ebook.getEbookImg()%>">
	</div>
	<div>
		<a href="<%=request.getContextPath()%>">삭제</a>
		<a href="<%=request.getContextPath()%>">가격 수정</a>
		<a href="<%=request.getContextPath()%>/admin/updateEbookImg.jsp?ebookNo=<%=ebook.getEbookNo()%>">이미지 수정</a>
	</div>
</body>
</html>