<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JinsReview</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>

<h1>JinsReview</h1>
<form action="loginPost" method="post">
			<input class="w3-input w3-border" type="text" name="uid" placeholder="아이디">
			<input class="w3-input w3-border" type="password" name="upw" placeholder="비밀번호" >
			<input class="w3-input w3-border" type="submit" value="로그인">
			<input class="w3-input w3-border" type="button" onclick="location.href='join'" value="회원가입">
</form>
</body>
</html>