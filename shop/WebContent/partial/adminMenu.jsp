<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<nav class="navbar navbar-expand-sm bg-dark navbar-dark" style="font-size:20px;">
	<ul class="navbar-nav">
		<li class="nav-item">	
			<a href="<%=request.getContextPath()%>/index.jsp" class="nav-link">홈으로 </a>
		</li>
		<li class="nav-item">
			<a href="<%=request.getContextPath()%>/admin/selectMemberList.jsp" class="nav-link">회원관리 </a>
		</li>
		<li class="nav-item">
			<a href="<%=request.getContextPath()%>/admin/" class="nav-link">전자책 카테고리 관리 </a>
		</li>
		<li class="nav-item">	
			<a href="<%=request.getContextPath()%>/admin/" class="nav-link">전자책 관리 </a>
		</li>
		<li class="nav-item">	
			<a href="<%=request.getContextPath()%>/admin/" class="nav-link">주문 관리 </a>
		</li>
		<li class="nav-item">	
			<a href="<%=request.getContextPath()%>/admin/" class="nav-link">상품평 관리 </a>
		</li>
		<li class="nav-item">	
			<a href="<%=request.getContextPath()%>/admin/" class="nav-link">공지게시판 관리 </a>
		</li>
		<li class="nav-item">	
			<a href="<%=request.getContextPath()%>/admin/" class="nav-link">QnA게시판 관리</a>
		</li>
	</ul>
</nav>
