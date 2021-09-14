<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String memberId = request.getParameter("memberId");
	String memberPw = request.getParameter("memberPw");
	
	//Debug
	System.out.println(memberId + " << memberId");
	System.out.println(memberPw + " << memberPw");
	
	MemberDao memberDao = new MemberDao();
	Member paramMember = new Member();
	
	paramMember.setMemberId(memberId);
	paramMember.setMemberPw(memberPw);
	
	//로그인 성공시에는 ID와 이름 출력
	//로그인 실패시에는 null 값 출력
	Member returnMember = memberDao.login(paramMember);
	//Debug
	if(returnMember == null) {
		System.out.println("로그인 실패");
		response.sendRedirect("/shop/loginForm.jsp");
		return;
	} else {
		System.out.println("로그인 성공");
		System.out.println(returnMember.getMemberId());
		System.out.println(returnMember.getMemberName());
		
		//session 생성
		session.setAttribute("loginMember", returnMember);
		response.sendRedirect("/shop/index.jsp");
	}
%>
