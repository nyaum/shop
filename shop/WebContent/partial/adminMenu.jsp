<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<nav class="navbar navbar-expand-sm bg-dark navbar-dark" style="font-size:20px;">
	<ul class="navbar-nav">
		<li class="nav-item">	
			<a href="<%=request.getContextPath()%>/index.jsp" class="nav-link">홈으로 </a>
		</li>
		<!-- 회원 목록, 등급 수정, 비밀번호 수정, 강제퇴장 -->
		<li class="nav-item">
			<a href="<%=request.getContextPath()%>/admin/selectMemberList.jsp" class="nav-link">회원관리 </a>
		</li>
		<!--
			전자책 카테고리 목록, 추가, 사용 유무 수정
			Category.java, CategoryDao, 
			selectCategoryList, insertCategoryForm, 
			insertCategoryAction, selectCategoryNameCheckAction 
			updateCategoryStateAction
		 -->
		<li class="nav-item">
			<a href="<%=request.getContextPath()%>/admin/selectCategoryList.jsp" class="nav-link">전자책 카테고리 관리 </a>
		</li>
		<!-- 전자책 목록, 추가(이미지 관리), 수정, 삭제 -->
		<li class="nav-item">	
			<a href="<%=request.getContextPath()%>/admin/selectEbookList.jsp" class="nav-link">전자책 관리 </a>
		</li>
		<li class="nav-item">	
			<a href="<%=request.getContextPath()%>/admin/selectOrderList.jsp" class="nav-link">주문 관리 </a>
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
