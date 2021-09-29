<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<nav class="navbar navbar-expand-sm bg-dark navbar-dark" style="font-size:20px">
	<ul class="navbar-nav">
		<li class="nav-item">	
			<a href="<%=request.getContextPath()%>/index.jsp" class="nav-link">홈으로 </a>
		</li>
		<li class="nav-item">
			<a href="<%=request.getContextPath()%>/selectNoticeList.jsp" class="nav-link">공지사항 </a>
		</li>
		<li class="nav-item">
			<a href="<%=request.getContextPath()%>/selectQnaList.jsp" class="nav-link">QnA </a>
		</li>
		<li class="nav-item">
			<a href="" class="nav-link">3rd </a>
		</li>
		<li class="nav-item">
			<a href="" class="nav-link">4th </a>
		</li>
		<li class="nav-item">
			<a href="" class="nav-link">5th</a>
		</li>
	</ul>
</nav>