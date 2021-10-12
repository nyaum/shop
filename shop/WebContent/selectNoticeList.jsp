<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	Notice notice = new Notice();
	NoticeDao noticeDao = new NoticeDao();
	ArrayList<Notice> noticeList = null;
	
	int currentPage = 1;
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	final int ROW_PER_PAGE = 10;
	int beginRow = (currentPage-1)*ROW_PER_PAGE;
	int totalCount = 0;
	
	noticeList = noticeDao.selectNoticeListByPage(beginRow, ROW_PER_PAGE);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Page</title>
</head>
<body>
	<!-- start submenu include -->
	<div>
		<jsp:include page="/partial/mainMenu.jsp"></jsp:include>
	</div>
	<br>
	<!-- end submenu include -->
	<h1 style="text-align:center">공지 사항</h1>
	<div style="text-align:right">
	<%
			Member loginMember = (Member)session.getAttribute("loginMember");
			if(loginMember == null) {		
	%>
				로그인 후에 이용 가능합니다.
	<%	
			} else if (loginMember.getMemberLevel() > 0) {
	%>
				<a href="<%=request.getContextPath()%>/admin/insertNoticeForm.jsp?memberNo=<%=loginMember.getMemberNo()%>" class="btn btn-outline-dark">글 작성</a>
	<%
			} else {
	%>
				관리자 권한이 없습니다.
	<%
			}
	%>
	</div>
	<br>
	<table style="text-align:center" class="table table-striped">
		<thead>
			<tr>
				<th>NoticeNo</th>
				<th>Title</th>
				<th>CreateDate</th>
				<th>UpdateDate</th>
			</tr>
		</thead>
		<tbody>
		<%
			for(Notice n : noticeList) {
		%>	
				<tr>
					<td style="width:5%"><%=n.getNoticeNo()%></td>
					<td style="width:55%">
					<a href="<%=request.getContextPath()%>/selectNoticeOne.jsp?noticeNo=<%=n.getNoticeNo()%>"><%=n.getNoticeTitle()%></a>
					</td>
					<td style="width:20%"><%=n.getCreateDate()%></td>
					<td style="width:20%"><%=n.getUpdateDate()%></td>
				</tr>
		<%
			}
		%>
		</tbody>
		<tfoot>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tfoot>
	</table>
	<div style="text-align:center">
	<%
		if (beginRow >= 1) {
	%>
			<a href="<%=request.getContextPath()%>/selectNoticeList?currentPage=<%=currentPage-1%>" class="btn btn-outline-dark">이전</a>
	<%	
		}
		int lastPage = totalCount / ROW_PER_PAGE;
		
		if(totalCount % ROW_PER_PAGE != 0) {
			lastPage++;
		}
		
		if(currentPage < lastPage) {
	%>
			<a href="<%=request.getContextPath()%>/selectNoticeList?currentPage=<%=currentPage+1%>" class="btn btn-outline-dark">다음</a>
	<%
		}
	%>
	</div>
</body>
</html>















