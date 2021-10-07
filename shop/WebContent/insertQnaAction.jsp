<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%
	request.setCharacterEncoding("utf-8");
	
	Member loginMember = (Member)session.getAttribute("loginMember");
	// or 연산자는 무조건 null 값 먼저
	if(loginMember == null) {
		System.out.println("비로그인 상태입니다.");
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		return;
	}
	
	String qnaTitle = request.getParameter("qnaTitle");
	String qnaCategory = request.getParameter("qnaCategory");
	String qnaSecret = request.getParameter("qnaSecret");
	int memberNo = Integer.parseInt(request.getParameter("memberNo"));
	String qnaContent = request.getParameter("qnaContent");
	
	System.out.println(qnaTitle);
	System.out.println(qnaCategory);
	System.out.println(qnaSecret);
	System.out.println(memberNo);
	System.out.println(qnaContent);
	
	Qna qna = new Qna();
	qna.setQnaTitle(qnaTitle);
	qna.setQnaCategory(qnaCategory);
	qna.setQnaSecret(qnaSecret);
	qna.setMemberNo(memberNo);
	qna.setQnaContent(qnaContent);
	
	QnaDao qnaDao = new QnaDao();
	qnaDao.insertQna(qna);
	
	response.sendRedirect(request.getContextPath() + "/selectQnaList.jsp");
%>