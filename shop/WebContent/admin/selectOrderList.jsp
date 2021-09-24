<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*"%>
<%@ page import="java.util.*" %>

<%
	request.setCharacterEncoding("utf-8");
	
	// 페이지 관리자가 아니면 들어올 수 없음
	Member loginMember = (Member)session.getAttribute("loginMember");
	// or 연산자는 무조건 null 값 먼저
	if(loginMember == null || loginMember.getMemberLevel() < 1) {
		System.out.println("비로그인 상태이거나, 관리자 계정이 아닙니다.");
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		return;
	}
	
	//페이징
	int currentPage = 1;
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));	
	}
		
	final int ROW_PER_PAGE = 10;
	int beginRow = (currentPage-1)*ROW_PER_PAGE;
	
	OrderDao orderDao = new OrderDao();
	ArrayList<OrderEbookMember> list = orderDao.selectOrderList(beginRow, ROW_PER_PAGE);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order List</title>
</head>
<body>
<!-- 관리자 상단 메뉴 -->
	<div style="text-align:center">
		<jsp:include page="/partial/adminMenu.jsp"></jsp:include>
	</div>
	<br>
	<h1 style="text-align:center">주문 목록</h1>
	<br>
	<table style="text-align:center" class="table table-striped">
		<thead>
			<tr>
				<th>Order No.</th>
				<th>Title</th>
				<th>Price</th>
				<th>Create Date</th>
				<th>Member Id</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody>
			<%
			for(OrderEbookMember oem : list) {
			%>
				<tr>
					<td><%=oem.getOrder().getOrderNo()%></td>
					<td><%=oem.getEbook().getEbookTitle()%></td>
					<td><%=oem.getOrder().getOrderPrice()%></td>
					<td><%=oem.getOrder().getCreateDate()%></td>
					<td><%=oem.getMember().getMemberId()%></td>
					<td><a href="">상세 보기</a></td>
				</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<br>
	<div style="text-align:center">
		<a href="" class="btn btn-outline-dark">이전</a>
		<a href="" class="btn btn-outline-dark">다음</a>
	</div>
</body>
</html>













