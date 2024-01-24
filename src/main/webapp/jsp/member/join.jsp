<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>

	<h2>회원가입 페이지</h2>

	<form method="POST" action="doJoin">
		<div>
			로그인 아이디 : <input type="text" placeholder="아이디를 입력해주세요" name="loginId" />
		</div>
		<div>
			로그인 비밀번호 :
			<input type="password" placeholder="비밀번호을 입력해주세요" name="loginPw"/>
		</div>
		<div>
			비밀번호 확인 : <input type="password" placeholder="비밀번호를 다시 입력해주세요." name="ConfirmLoginPw" />
		</div>
		<div>
			이&nbsp;&nbsp;름 :
			<input type="text" placeholder="이름을 입력해주세요" name="name"/>
		</div>
		<button type="submit">작성</button>
	</form>



</body>
</html>