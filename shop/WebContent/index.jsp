<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Index</title>
</head>
<body>
	<!-- start submenu include -->
	<div>
		<jsp:include page="/partial/mainMenu.jsp"></jsp:include>
	</div>
	<br>
	<!-- end submenu include -->
	<div style="text-align:center">
	<h1>Project Main Page</h1>
	<br>
	<%
		if(session.getAttribute("loginMember") == null) {
	%>		
			<!-- 로그인을 하지 않았을 경우 로그인과 회원가입 버튼 출력 -->
			<div>
				<div class="btn btn-outline-dark">
					<a href="<%=request.getContextPath()%>/loginForm.jsp">로그인</a>
				</div>
				<div class="btn btn-outline-dark">
					<a href="<%=request.getContextPath()%>/insertMemberForm.jsp">회원가입</a>
				</div>
			</div>
			<!-- 로그인을 했을 경우 이름과 로그아웃 버튼 출력 -->
	<%
		} else {
			Member loginMember = (Member)session.getAttribute("loginMember");	
	%>
			<div>
				<%=loginMember.getMemberName()%>, 로그인!<br><br>
				<a href="<%=request.getContextPath()%>/logout.jsp" class="btn btn-outline-dark">로그아웃</a>&nbsp;
				<a href="<%=request.getContextPath()%>" class="btn btn-outline-dark">회원정보</a>&nbsp;
				<a href="<%=request.getContextPath()%>/selectOrderListByMember.jsp" class="btn btn-outline-dark">주문목록</a>
	<%
				if(loginMember.getMemberLevel() > 0) {
	%>
						<a href="<%=request.getContextPath()%>/admin/adminIndex.jsp" class="btn btn-outline-dark">관리자 메뉴</a>
			</div>
	<%
				}
		}
		EbookDao ebookDao = new EbookDao();
		
	//인기목록 5개 출력
	ArrayList<Ebook> popularEbookList = ebookDao.selectPopularEbookList();
	
	//신규 상품 5개 출력

	%>
	<br><br>
	<!-- 신규 상품 5개 출력 -->
	<h2>신규 상품 목록</h2>

	<br>
	<!-- 인기 상품 5개 출력 -->
	<h2>인기 상품 목록</h2>
	<div>
		<table style="text-align:center" class="table table-striped">
			<tr>
			<%
				for(Ebook e : popularEbookList){
			%>
						<td>
						<div>
							<a href="">
								<img src="<%=request.getContextPath()%>/image/<%=e.getEbookImg()%>" width="200px" height="200px">
							</a>
						</div>
						<div style="font-weight:bold"><a href=""><%=e.getEbookTitle()%></a></div>
						<div><%=e.getEbookPrice()%> ₩</div>
					</td>
			<%
				}
			%>
			</tr>
		</table>
	</div>
	<br>
	<h2>전체 상품 목록</h2>
	<!-- 상품 목록 출력 -->
	<%
		//페이징
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));	
		}
	
		//rowPerPage 변수는 항상 10으로 고정되는 수 > 절대 변하지 않음 >> 상수
		final int ROW_PER_PAGE = 20;
		int beginRow = (currentPage-1)*ROW_PER_PAGE;
		
		ArrayList<Ebook> ebookList = ebookDao.selectEbookList(beginRow, ROW_PER_PAGE);
	%>
	<table style="text-align:center" class="table table-striped">
		<tr>
		<%
			int i = 0;
			for(Ebook e : ebookList) {
		%>
					<td>
						<div>
							<a href="">
								<img src="<%=request.getContextPath()%>/image/<%=e.getEbookImg()%>" width="200px" height="200px">
							</a>
						</div>
						<div style="font-weight:bold"><a href=""><%=e.getEbookTitle()%></a></div>
						<div><%=e.getEbookPrice()%> ₩</div>
					</td>
		<%
				i += 1; // for 문이 끝날때마다 i가 1씩 증가함
				if(i%5 == 0) {
		%>
					</tr><tr>
		<%
				}
			}
		%>
		</tr>
	</table>
	<div>
		
	</div>
	</div>
</body>
</html>