<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import="vo.*" %>
<%
	request.setCharacterEncoding("utf-8");

	// 객체 생성
	NoticeDao noticeDao = new NoticeDao();
	
	// 관리자가 아닐경우 입장 제한
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null || loginMember.getMemberLevel() < 1){
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
	
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	
	System.out.println(noticeNo + " < noticeNo");
	
	noticeDao.deleteNotice(noticeNo);
	
	response.sendRedirect(request.getContextPath() + "/selectNoticeList.jsp");
%>