<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*" %>
<!-- 관리자 페이지 방어 코드 -->
<%
	request.setCharacterEncoding("utf-8");

	Member loginMember = (Member)session.getAttribute("loginMember");
	// or 연산자는 무조건 null 값 먼저
	if(loginMember == null || loginMember.getMemberLevel() < 1) {
		System.out.println("비로그인 상태이거나, 관리자 계정이 아닙니다.");
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		return;
	}
	
	//검색어
	String searchMemberId = "";
	if(request.getParameter("searchMemberId") != null) {
		searchMemberId = request.getParameter("searchMemberId");	
	}
	System.out.println(searchMemberId + "Search Keyword");
	
	//페이징
	int currentPage = 1;
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));	
	}
	
	//rowPerPage 변수는 항상 10으로 고정되는 수 > 절대 변하지 않음 >> 상수
	final int ROW_PER_PAGE = 10;
	int beginRow = (currentPage-1)*ROW_PER_PAGE;
	
	MemberDao memberDao = new MemberDao();
	ArrayList<Member> memberList = null;
	int totalCount = 0;
	if(searchMemberId.equals("")) { //검색어가 없을때
		memberList = memberDao.selectMemberListAllByPage(beginRow, ROW_PER_PAGE);
		totalCount = memberDao.totalMemberCount("");
	} else {
		memberList = memberDao.selectMemberListAllBySearchMemberId(beginRow, ROW_PER_PAGE,searchMemberId);
		totalCount = memberDao.totalMemberCount(searchMemberId);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
</head>
<body>
	
	<!-- 관리자 메뉴 include -->
	<div>
		<jsp:include page="/partial/adminMenu.jsp"></jsp:include>
	</div>
	<br>
	<h1 style="text-align:center">Member List</h1>
	<br>
	<table style="text-align:center" class="table table-striped">
		<thead>
			<tr>
				<th>No.</th>
				<th>ID</th>
				<th>Level</th>
				<th>Name</th>
				<th>Age</th>
				<th>Gender</th>
				<th>Update Date</th>
				<th>Create Date</th>
				<th>등급 수정</th>
				<th>비밀번호 수정</th>
				<th>강제 탈퇴</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Member m : memberList) {
			%>
					<tr>
						<td><%=m.getMemberNo()%></td>
						<td><%=m.getMemberId()%></td>
						<td>
							<%
								if(m.getMemberLevel() == 0) {
							%>
									<span>일반 회원</span>
							<%
								} else if (m.getMemberLevel() == 1) {
							%>
									<span>관리자</span>
							<%
								}
							%>
						</td>
						<td><%=m.getMemberName()%></td>
						<td><%=m.getMemberAge()%></td>
						<td><%=m.getMemberGender()%></td>
						<td><%=m.getUpdateDate()%></td>
						<td><%=m.getCreateDate()%></td>
						<td>
						<!-- 특정 회원 등급 수정 -->
							<a href="<%=request.getContextPath()%>/admin/updateMemberLevelForm.jsp?memberNo=<%=m.getMemberNo()%>" class="btn btn-light" style="font-weight:bold;">등급 수정</a>
						</td>
						<td>
						<!-- 특정 회원 비밀번호 수정 -->
							<a href="<%=request.getContextPath()%>/admin/updateMemberPwForm.jsp?memberNo=<%=m.getMemberNo()%>" class="btn btn-light" style="font-weight:bold;">비밀번호 수정</a>
						</td>
						<td>
						<!-- 특정 회원 삭제 -->
							<a href="<%=request.getContextPath()%>/admin/deleteMemberAction.jsp?memberNo=<%=m.getMemberNo()%>" class="btn btn-danger" style="font-weight:bold;">강제 탈퇴</a>
						</td>
					</tr>
			<%		
				}
			%>
		</tbody>
	</table>
	<br>
	<div style="text-align:center">
	<%
		if (beginRow >= 1) {
	%>
			<a class="btn btn-outline-dark" href="<%=request.getContextPath()%>/admin/selectMemberList.jsp?currentPage=<%=currentPage-1%>&searchMemberId=<%=searchMemberId%>">이전</a>
	<%
		}
		int lastPage = totalCount / ROW_PER_PAGE;
		
		if (totalCount % ROW_PER_PAGE != 0) {
			lastPage += 1;
		}
		
		if (currentPage < lastPage) {
	%>	
			<a class="btn btn-outline-dark" href="<%=request.getContextPath()%>/admin/selectMemberList.jsp?currentPage=<%=currentPage+1%>&searchMemberId=<%=searchMemberId%>">다음</a>
	<%
		}
	%>
	</div>
	<br>
	<!-- memberID 검색 바 -->
	<div>
		<form method="get" action="<%=request.getContextPath()%>/admin/selectMemberList.jsp" class="form-inline">
			<input type="text" name="searchMemberId" class="form-control mr-sm-2" style="width:350px">
			<button type="submit" class="btn btn-outline-dark">Search</button>
		</form>
	</div>
</body>
</html>
















