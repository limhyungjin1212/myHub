<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/join.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="../resources/js/join.js?ver=44"></script>
</head>
<body>
	<h1 align="center">회 원 가 입</h1>
	<p align="center">
		JinsReview는 고객님의 소중한 개인정보를 보호하기위해 주민번호를 수집하지 않습니다.<br>요청하시면 안내메일을
		보내드립니다
	</p>

	<form method="post" action="join">
		<table align="center">
			<tr>
				<td>닉네임(필수)</td>
				<td><input type="text" id="uname" name="uname" required>
				</td>
			</tr>
			<tr>
				<td>아이디(필수)</td>
				<td><input type="text" id="uid" name="uid" onkeydown="idcheck()"
					required> <span id="idcheck">id는 8자이상 12자 이하로 입력하셔야
						합니다</span></td>
			</tr>
			<tr>
				<td>비밀번호(필수)</td>
				<td><input type="password" id="upw" name="upw" required>
					<span id="pwcheck"></span></td>
			</tr>
			<tr>
				<td>비밀번호확인(필수)</td>
				<td><input type="password" id="pwchk" onblur="pwequalscheck()"
					required> <span id="pwequals"></span></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" id="email"> @ <input type="text"
					id="email2"> 
					<select id="emailselect" onchange="selectEmail()">
						<option value="1">직접입력</option>
						<option value="naver.com">네이버</option>
						<option value="daum.net">다음</option>
						<option value="google.com">구글</option>
				</select>
				<input type="hidden" name="umail" value="">
				
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="radio" name="gender" value="남"> 남자
					<input type="radio" name="gender" value="여"> 여자</td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><select>
						<option>010</option>
						<option>011</option>
						<option>012</option>
						<option>013</option>
				</select> <input type="text" maxlength="4" onblur="key()" id="firstNum">
					- <input type="text" id="secondNum"> <input type="button"
					id="btn" onclick="sendNum()" value="인증 번호 발송">
					<input type="hidden" name="uphone" value="010-123-456" >
					</td>
					
			</tr>
			<tr>
				<td>인증번호 입력</td>
				<td><input type="text" id="receiveNum"> <input
					type="button" id="btn2" onclick="equalsNum()" value="확인"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" id="submit" value="회원가입"> <input type="button"
					onclick="location.href='../'" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>