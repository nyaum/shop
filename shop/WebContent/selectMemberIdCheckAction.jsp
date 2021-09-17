<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%
	// memberIdCheck 값이 null 값인지 확인
	if(request.getParameter("memberIdCheck") == null || request.getParameter("memberIdCheck").equals("")) {
		response.sendRedirect(request.getContextPath() + "/insertMemberForm.jsp");
		return;
	}

	String memberIdCheck = request.getParameter("memberIdCheck");
	
	// memberDao 에서 selectMemberId 가져오기
	MemberDao memberDao = new MemberDao();
	String result = memberDao.selectMemberId(memberIdCheck);
	
	// 디버그
	System.out.println(memberIdCheck);
	
	if(result == null) {
		response.sendRedirect(request.getContextPath() + "/insertMemberForm.jsp?memberIdCheck="+memberIdCheck);
	} else {
		response.sendRedirect(request.getContextPath() + "/insertMemberForm.jsp?idCheckResult=already_exist_id");
	}
%>