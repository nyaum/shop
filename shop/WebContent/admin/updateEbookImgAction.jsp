<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<!-- request 대신 사용하는 import -->
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<!-- 파일 이름 중복을 피할 수 있게 만들어 줌 -->
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%
	request.setCharacterEncoding("utf-8");

	//adminPage의 방어코드
	// session에 저장된 loginMember를 받아옴
	Member loginMember = (Member)session.getAttribute("loginMember");
	// loginMember가 null이거나 memberLevel이 1이하 일 때 이 페이지를 들어올 수 없음
	if(loginMember == null || loginMember.getMemberLevel() < 1){
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
	
	// multipart/form-data로 넘겨졌기 때문에 request.getParameter("ebookNo"); 사용 불가능
	
	MultipartRequest mr = new MultipartRequest(request,"C:/Users/uphau/OneDrive/바탕 화면/git-shop/shop/WebContent/image" , 1024*1024*1024, "utf-8", new DefaultFileRenamePolicy());

	int ebookNo = Integer.parseInt(mr.getParameter("ebookNo"));
	String ebookImg = mr.getFilesystemName("ebookImg");
	
	Ebook ebook = new Ebook();
	ebook.setEbookNo(ebookNo);
	ebook.setEbookImg(ebookImg);
	
	EbookDao ebookDao = new EbookDao();
	ebookDao.updateEbookImg(ebook);
	response.sendRedirect(request.getContextPath() + "/admin/selectEbookOne.jsp?ebookNo="+ebookNo);
%>