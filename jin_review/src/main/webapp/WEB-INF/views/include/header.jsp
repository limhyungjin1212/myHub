<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#navbar a {
	color: #99ccff;
	margin-top: 30px;
}
#navbar {
	background-image: url("resources/image/coffee1.jpg");
	background-size: cover;
	
}
.uinfo {
	color: white;
}

#searchform{
	margin-top : 100px;
	margin-left : 300px;
	margin-right : 300px;
}
</style>
<!-- Navigation -->
	<nav id="navbar"
		class="navbar navbar-expand-lg navbar-dark bg-light fixed-top">
		<div class="container-fluid">
		<a class="navbar-brand" href="main">SemoRE</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="row text-center"  id="searchform" >
			<!-- Topbar -->
			<!-- Sidebar Toggle (Topbar) -->
			<button id="sidebarToggleTop"
				class="btn btn-link d-md-none rounded-circle mr-3">
				<i class="fa fa-bars"></i>
			</button>
			<form id="sform" action="productSearch" method="get"
				class="d-none d-sm-inline-block form-inline navbar-search">
				<div class="input-group">
					<input type="hidden" name="pageNum" value="1">
						
					<input type="text" size="70px" height="70px" id="category" name="keyword" class="form-control col-md-6"
						list="cate" placeholder="Search for..." aria-label="Search"
						aria-describedby="basic-addon2" value="">
					<datalist id="cate">
						<option value="병원">병원</option>
						<option value="음식">음식</option>
						<option value="카페">카페 & 디저트</option>
						<option value="제품">제품</option>
						<option value="헬스장">헬스장</option>
						<option value="세탁소">세탁소</option>
						<option value="호텔">호텔</option>
						<option value="pc방">pc방</option>
					</datalist>
					<input type="text" name="place" id="placekeyword" class="form-control"
						placeholder="Search for..." aria-label="Search"
						aria-describedby="basic-addon2" value="울산광역시">
					<div class="input-group-append">
						<input class="btn btn-primary" type="submit" value="검색">
					</div>
				</div>
			</form>
		</div>
		
		
		
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="main">Home
						<span class="sr-only">(current)</span>
				</a></li>

				<c:choose>
					<c:when test="${login ne null }">
						<label class="uinfo">${login.uname } 님 환영합니다!</label>
						<a href="mypage?writer=${login.uname }">마이페이지</a>
						<li class="nav-item active"><a class="nav-link"
							href="logout">로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item active"><a class="nav-link"
							href="join">회원가입</a></li>
						<li class="nav-item active"><a class="nav-link"
							href="login">로그인</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
	
	</nav>
	
