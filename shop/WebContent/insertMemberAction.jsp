<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	//입력값 검사
	if (request.getParameter("memberId") == null	|| 
		request.getParameter("memberPw") == null	|| 
		request.getParameter("memberName") == null	|| 
		request.getParameter("memberAge") == null	|| 
		request.getParameter("memberGender") == null) {
		
		//입력값이 올바르지 않을 경우
		response.sendRedirect("/shop/insertMemberForm.jsp");
		return;
	}

	if (request.getParameter("memberId").equals("")		|| 
		request.getParameter("memberPw").equals("")		|| 
		request.getParameter("memberName").equals("")	|| 
		request.getParameter("memberAge").equals("")	|| 
		request.getParameter("memberGender").equals("")) {
		
		//입력값이 올바르지 않을 경우
		response.sendRedirect("/shop/insertMemberForm.jsp");
		return;
	}
	
	String memberId = request.getParameter("memberId");
	String memberPw = request.getParameter("memberPw");
	String memberName = request.getParameter("memberName");
	int memberAge = Integer.parseInt(request.getParameter("memberAge"));
	String memberGender = request.getParameter("memberGender");
	
	Member member = new Member();
	member.setMemberId(memberId);
	member.setMemberPw(memberPw);
	member.setMemberName(memberName);
	member.setMemberAge(memberAge);
	member.setMemberGender(memberGender);
	
	//Debug
	System.out.println(memberId);
	System.out.println(memberPw);
	System.out.println(memberName);
	System.out.println(memberAge);
	System.out.println(memberGender);
	
	MemberDao memberDao = new MemberDao();
	int row = memberDao.insertMember(member);
	
	if(row == 1) {
		System.out.println("올바른 값 입력");
		response.sendRedirect("/shop/loginForm.jsp");
	} else {
		System.out.println("잘못 된 값 입력");
		response.sendRedirect("/shop/insertMemberForm.jsp");
	}
	
%>
