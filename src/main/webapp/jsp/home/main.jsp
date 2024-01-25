<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
</head>
<body>

	<h1>MAIN</h1>
	<%
	String id = (String) session.getAttribute("id");
	%>
	<%=id %> 님이 로그인하였습니다.


	


	<ul>
		<li><a href="../member/join">회원가입으로 이동</a></li>
		<li><a href="../member/login">로그인으로 이동</a></li>
		<li><a href="../article/list">리스트로 이동</a></li>
	</ul>

</body>
</html>