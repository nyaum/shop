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
	
	int ebookNo = Integer.parseInt(request.getParameter("ebookNo"));
	int memberNo = Integer.parseInt(request.getParameter("memberNo"));
	int orderPrice = Integer.parseInt(request.getParameter("orderPrice"));
	
	System.out.println(ebookNo);
	System.out.println(memberNo);
	System.out.println(orderPrice);
	
	OrderDao orderDao = new OrderDao();
	Order order = new Order();
	
	order.setEbookNo(ebookNo);
	order.setMemberNo(memberNo);
	order.setOrderPrice(orderPrice);
	
	orderDao.insertOrderByMember(order);
	
	response.sendRedirect(request.getContextPath() + "/index.jsp");
	
%>