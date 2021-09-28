<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null) {
		System.out.println("비로그인 상태입니다.");
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		return;
	}
	
	int orderNo = Integer.parseInt(request.getParameter("orderNo"));
	int ebookNo = Integer.parseInt(request.getParameter("ebookNo"));
	String orderCommentContent = request.getParameter("orderCommentContent");
	int orderScore = Integer.parseInt(request.getParameter("orderScore"));
	
	System.out.println(orderNo);
	System.out.println(ebookNo);
	System.out.println(orderCommentContent);
	System.out.println(orderScore);
	
	Comment comment = new Comment();
	comment.setOrderNo(orderNo);
	comment.setEbookNo(ebookNo);
	comment.setOrderCommentContent(orderCommentContent);
	comment.setOrderScore(orderScore);
	
	CommentDao commentDao = new CommentDao();
	commentDao.insertOrderComment(comment);
	
	response.sendRedirect(request.getContextPath()+"/insertOrderCommentForm.jsp?orderNo="+orderNo+"&ebookNo="+ebookNo);
%>