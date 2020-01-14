<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>

<link rel="stylesheet" href="../resources/css/upload.css" >
</head>
<body>
글쓰기 하기 위한 폼 입니다.
<h1> <%=request.getRequestURI().substring(request.getContextPath().length())%></h1>
<form id = "registerForm" action="register" method="post" enctype="multipart/form-data">
	<select name="pcate">
		<option value="병원">병원</option>
		<option value="음식">음식</option>
		<option value="제품">제품</option>
	</select>
	제목 : <input type="text" name="pname"> <br>
	내용 : <textarea rows="10" cols="20" name="pinfo"></textarea> <br>
	연락처 : <input type="text" name="ptel"> <br>
	 파일 : <input type="file" name="filename">
	<input type="submit" value="글쓰기">
	<div class="fileDrop">파일을 드래그앤 드랍</div>
	<div class="uploadedList"></div>
	
</form>

<script type="text/javascript" src="../resources/js/uploadwrite.js?ver=5"></script>
</body>
</html>