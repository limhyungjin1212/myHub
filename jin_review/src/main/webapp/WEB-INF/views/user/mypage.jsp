<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  
  <style>
  	#myContent{
  		margin-top:200px;
  	}
  
  </style>
</head>
<body>
	<!-- Navigation -->
	<nav id="navbar"
		class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container-fluid">
		<a class="navbar-brand" href="main">SemoRE</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		
		
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="../main">Home
						<span class="sr-only">(current)</span>
				</a></li>

				<c:choose>
					<c:when test="${login ne null }">
						<label class="uinfo">${login.uname } 님 환영합니다!</label>
						<a href="mypage">마이페이지</a>
						<li class="nav-item active"><a class="nav-link"
							href="logout">로그아웃</a></li>
					</c:when>
				</c:choose>
			</ul>
		</div>
	</div>
	
	</nav>
	
	
	<div class="container" id="myContent">
		<div>
		<table class="table">
			<tr>
				<td>내가 등록한 리뷰</td>
			</tr>
		</table>
		</div>
		
		
		<div>
		<table class="table">
			<tr>
				<td>팔로우 목록</td>
			</tr>
		</table>
		</div>
		
		
		<div>
		<table class="table">
			<tr>
				<td>팔로워 목록</td>
			</tr>
		</table>
		</div>
		<div>
		<table class="table">
			<tr>
				<td></td>
			</tr>
		</table>
		</div>
		
	</div>
	
	
</body>
</html>