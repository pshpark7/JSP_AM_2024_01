<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
List<Map<String, Object>> articleRows = (List<Map<String, Object>>) request.getAttribute("articleRows");
int cPage = (int) request.getAttribute("page");
int totalPage = (int) request.getAttribute("totalPage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"">
<title>게시물 목록</title>
</head>
<body>
	<div>
		<a href="../home/main">메인으로 이동</a>
	</div>
	<div>
		<a href="write">글쓰기</a>
	</div>

	<h2>게시물 목록</h2>

	<table style="border-collapse: collapse; border-color: green"
		border="1px">
		<thead>
			<tr>
				<th>번호</th>
				<th>작성날짜</th>
				<th>제목</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Map<String, Object> articleRow : articleRows) {
			%>
			<tr style="text-align: center;">
				<td><%=articleRow.get("id")%></td>
				<td><%=articleRow.get("regDate")%></td>
				<td><a href="detail?id=<%=articleRow.get("id")%>"><%=articleRow.get("title")%></a></td>
				<td><a href="modify?id=<%=articleRow.get("id")%>">수정</a></td>
				<td><a href="doDelete?id=<%=articleRow.get("id")%>">del</a></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>

	<style type="text/css">
.page {
	font-size: 1.4rem;
}

.page>a {
	color: black;
	text-decoration: none;
}

.page>a.cPage {
	color: red;
	text-decoration: underline;
}
</style>

	<div class="page">
		<%
		int pageBlock = 10;
		int startPage = ((cPage - 1) / pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		%>
		<%
		if (cPage > 1) {
		%>
		<a href="list?page=1">◀◀</a>
		<%
		}
		%>
		
		<%
		if (startPage > pageBlock) {
		%>
		<a href="list?page=<%=startPage - pageBlock%>">◁</a>
		<%
		}
		%>
		<%
		for (int i = startPage; i < endPage + 1; i++) {
		%>
		<a href="list?page=<%=i%>"><%=i%></a>
		<%
		}
		%>
		<%
		if (endPage < totalPage) {
		%>
		<a href="list?page=<%=startPage + pageBlock%>">▷</a>
		<%
		}
		%>
		<%
		if (cPage < totalPage) {
		%>
		<a href="list?page=<%=totalPage%>">▶▶</a>
		<%
		}
		%>
	</div>




</body>
</html>