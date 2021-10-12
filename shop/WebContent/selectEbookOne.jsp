<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	int ebookNo = Integer.parseInt(request.getParameter("ebookNo"));
	
	CategoryDao categoryDao = new CategoryDao();
	ArrayList<Category> categoryList = categoryDao.selectCategoryList();
	
	CommentDao commentDao = new CommentDao();
	double avgScore = commentDao.selectOrderScoreAvg(ebookNo);
	ArrayList<Comment> commentList = commentDao.commentList(ebookNo);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 보기</title>
</head>
<body>
	<!-- start submenu include -->
	<div>
		<jsp:include page="/partial/mainMenu.jsp"></jsp:include>
	</div>
	<br>
	<!-- end submenu include -->
	<div style="text-align:center">
	<h1>상품 상세 보기</h1>
		<!-- 상품 상세 출력 -->
		<%
			EbookDao ebookDao = new EbookDao();
			Ebook ebook = ebookDao.selectEbookOne(ebookNo);
		%>
	</div>
	<div>
		<!-- 주문 입력 폼 -->
		
		<%
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
		%>
			<div style="text-align:center">로그인 후에 주문이 가능합니다.<a href="<%=request.getContextPath()%>/loginForm.jsp">로그인</a></div>
			<br>
		<%
		} else {
		%>
		<br>
		<form method="post" action="<%=request.getContextPath()%>/insertOrderAction.jsp">
			<input type="hidden" name="ebookNo" value="<%=ebookNo%>">
			<input type="hidden" name="memberNo" value="<%=loginMember.getMemberNo()%>">
			<input type="hidden" name="ebookPrice" value="<%=ebook.getEbookPrice()%>">
			<button type="submit">주문완료</button>
		</form>
		<%
		}
		%>
	</div>
	<div style="text-align:center">
		<h2>상품 후기</h2>
		<!-- 상품 평점 평균 -->
		<!-- SELECT AVG(order_score) FROM order_comment where ebook_no=? ORDER BY ebook_no -->
		<div>
			평점 : <%=avgScore%>
		</div>
		<br>
		<div>
		<!-- 이 상품의 후기(페이징) -->
		<!-- SELECT * FROM order_comment WHERE ebook_no=? limit ?, ? -->
			<h2>후기 목록</h2>
			<br>
			<table style="text-align:center" class="table table-striped">
				<thead>
					<tr>
						<th>OrderScore</th>
						<th>Comment</th>
						<th>CreateDate</th>		
					</tr>
				</thead>
				<tbody>					
					<%
					for(Comment c : commentList) {
					%>
					<tr>
						<td><%=c.getOrderScore()%> 점</td>
						<td><%=c.getOrderCommentContent()%></td>
						<td><%=c.getCreateDate()%></td>
					</tr>
					<%
					}
					%>					
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>









