<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import="vo.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	// MemberDao 객체 생성
	MemberDao memberDao = new MemberDao();
	
	// 관리자가 아닐경우 입장 제한
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null || loginMember.getMemberLevel() < 1){
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}

	// request 값 저장
	int memberNo = Integer.parseInt(request.getParameter("memberNo"));
	//디버깅
	System.out.println(memberNo+" <-- memberNo");
	
	memberDao.deleteMemberByAdmin(memberNo);

	response.sendRedirect(request.getContextPath()+"/admin/selectMemberList.jsp");
	
%>