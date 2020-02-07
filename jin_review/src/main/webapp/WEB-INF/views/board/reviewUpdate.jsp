<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<h1>리뷰 수정</h1>
<h1>모달수정?</h1>
							<div id="updateDiv">
							<span id="up_rate">
					 	
							</span> 
					<br> 
						
					<input type="text" class="form-control" id="up_rev_subject" name="rev_subject" autocomplete="off" placeholder="한줄 요약을 해주세요"><br>
					<textarea placeholder="리뷰는 도움이 됩니다." class="form-control" rows="5"
						name="content" id="up_replytext"></textarea>
					
						</div>
						<div align="right">
							<button id="replyModBtn" class="btn btn-outline-primary">수정</button>
							<button id="replyDelBtn" class="btn btn-outline-danger">삭제</button>
							<button id="closeBtn" class="btn btn-outline-dark">닫기</button>
						</div>
</body>
</html>