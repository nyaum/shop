<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*"%>
<%@ page import="java.util.*" %>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	// or 연산자는 무조건 null 값 먼저
	if(loginMember == null) {
		System.out.println("비로그인 상태입니다.");
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		return;
	}
	
	OrderDao orderDao = new OrderDao();
	
	ArrayList<OrderEbookMember> list = orderDao.selectOrderListByMember(loginMember.getMemberNo());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Order List</title>
</head>
<body>
	<!-- start submenu include -->
	<div>
		<jsp:include page="/partial/mainMenu.jsp"></jsp:include>
	</div>
	<br>
	<div style="text-align:center">
		<h1>My Order List</h1>
	<br>
	<table style="text-align:center" class="table table-striped">
		<thead>
			<tr>
				<th>Order No.</th>
				<th>Title</th>
				<th>Price</th>
				<th>Create Date</th>
				<th>Member ID</th>
				<th>상세보기</th>
				<th>리뷰</th>
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
					<td>
						<a href="">상세 보기</a>
					</td>
					<td>
						<a href="<%=request.getContextPath()%>/insertOrderCommentForm.jsp?orderNo=<%=oem.getOrder().getOrderNo()%>&ebookNo=<%=oem.getEbook().getEbookNo()%>">리뷰</a>
					</td>
				</tr>
			<%
			}
			%>
		</tbody>
	</table>
	</div>
</body>
</html>