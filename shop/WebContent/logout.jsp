<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//사용자의 세션을 새로운 세션으로 갱신시킴
	session.invalidate();
	response.sendRedirect("/shop/index.jsp");
%>