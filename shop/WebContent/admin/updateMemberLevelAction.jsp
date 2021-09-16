<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	MemberDao memberDao = new MemberDao();	

	int memberNo = Integer.parseInt(request.getParameter("memberNo"));
	int memberNewLevel = Integer.parseInt(request.getParameter("memberLevel"));
	
	//디버그
	System.out.println(memberNo);
	System.out.println(memberNewLevel);
	
	Member paramMember = new Member();
	paramMember.setMemberNo(memberNo);
	
	memberDao.updateMemberLevelByAdmin(paramMember, memberNewLevel);
	//완료 후 selectMemberList로 이동
	response.sendRedirect(request.getContextPath()+"/admin/selectMemberList.jsp");
%>
