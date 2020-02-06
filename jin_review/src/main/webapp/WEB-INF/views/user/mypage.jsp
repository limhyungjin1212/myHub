<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<style>
#myContent {
	margin-top: 200px;
}
</style>


<script>
$(function() {
  $( "#datepicker1" ).datepicker({
    dateFormat: 'yy-mm-dd'
  });
});
</script>
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
					<li class="nav-item active"><a class="nav-link" href="main">Home
							<span class="sr-only">(current)</span>
					</a></li>

					<c:choose>
						<c:when test="${login ne null }">
							<label class="uinfo">${login.uname } 님 환영합니다!</label>
							<li class="nav-item active"><a class="nav-link"
								href="logout">로그아웃</a></li>
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>

	</nav>


	<div class="container" id="myContent">
		<div class="row">
			<div class="col">
				<h4>내가 등록한 리뷰</h4>
				<c:if test="${myRevList.size() == 0 }">
						<h3>등록한 리뷰가 없습니다.</h3>
				</c:if>
				<input type="text" id="datepicker1">
				<table class="table">
					<c:forEach items="${myRevList }" var="reviewVO">
						<tr>
							<td width="30%"><a href="../detail?pno=${reviewVO.pno }">${reviewVO.pname }</a></td>
							
							<td width="70%">
							<c:forEach begin="1" end="${reviewVO.rate }" var="rateAvg">
									<i class='fas fa-star' style='color: #99ccff;'></i>
							</c:forEach>
							 <c:choose>
									<c:when test="${(reviewVO.rate *2) % 2 eq 1}">
										<i class="fas fa-star-half-alt" style='color: #99ccff;'></i>
										<c:forEach begin="${reviewVO.rate+1 }" end="4">
											<i class='far fa-star' style='color: #99ccff;'></i>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<c:forEach begin="${reviewVO.rate }" end="4">
											<i class='far fa-star' style='color: #99ccff;'></i>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td>
								
								<c:if test="${(reviewVO.fn) ne null}">
								<img class ='img-thumbnail' src='displayFile?fileName=${reviewVO.fn }'/>
								</c:if>
													
							</td>
						</tr>
						<tr>
							<td width="70%"><strong>${reviewVO.rev_subject }</strong>${reviewVO.content }</td>
							<td width="30%"></td>
						</tr>
					</c:forEach>
				<tr>
					<td colspan="4">
						<c:if test="${page.prev }">
								<a href="mypage?pageNum=${page.startPage-1 }&keyword=${page.cri.keyword}&uid=${login.uid}&uname=${login.uname}">[이전]</a>
							</c:if> <c:forEach begin="${page.startPage }" end="${page.endPage}"
								var="num">
								<%-- <a href="list?pageNum=${num }">${num }</a> --%>
								<c:choose>
									<c:when test="${page.cri.pageNum == num }">
										<b><a
											href="mypage?pageNum=${num }&keyword=${page.cri.keyword}&uid=${login.uid}&uname=${login.uname}"
											class="w3-bar-item w3-button w3-green">${num }</a></b>
									</c:when>
									<c:otherwise>
										<a href="mypage?pageNum=${num }&keyword=${page.cri.keyword}&uid=${login.uid}&uname=${login.uname}"
											class="w3-bar-item w3-button">${num }</a>
									</c:otherwise>
								</c:choose>
							</c:forEach> <c:if test="${page.next }">
								<a href="mypage?pageNum=${page.endPage +1 }&keyword=${page.cri.keyword}&uid=${login.uid}&uname=${login.uname}">[다ㅁ음]</a>
							</c:if></td>
				</tr>
				</table>
				
				
			</div>


			<div class="col">
				<table class="table">
				
					<tr>
						<td>팔로우 목록</td>
					</tr>
					<c:forEach items="${followList }" var="follow">
					<tr>
						<td><a href="userDetail?uname=${follow.follow }">${follow.follow }</a></td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>

		<div>
			<table class="table">
				<tr>
					<td>팔로워 목록</td>
				</tr>
				<c:forEach items="${followerList }" var="follower">
					<tr>
						<td><a href="userDetail?uname=${follower.uname}">${follower.uid }</a></td>
					</tr>
					</c:forEach>
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