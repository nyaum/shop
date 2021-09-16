<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%
	int memberNo = Integer.parseInt(request.getParameter("memberNo"));
	String memberPwNew = request.getParameter("memberPw");

	System.out.println(memberNo);
	System.out.println(memberPwNew);
	
	Member member = new Member();
	member.setMemberNo(memberNo);
	member.setMemberPw(memberPwNew);
	
	MemberDao memberDao = new MemberDao();
	int row = memberDao.updateMemberPwByAdmin(member, memberPwNew);

	if(row == 1) {
		System.out.println("입력 성공");
		response.sendRedirect("./selectMemberList.jsp");
	}
%>
