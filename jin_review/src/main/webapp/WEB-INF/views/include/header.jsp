<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	#navbar a{
		color: #99ccff;
		
	}
	.uinfo{
		color: white;
	}
</style>
<!-- Navigation -->
<nav id="navbar" class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="main">SemoRE</a>
		
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<!-- Topbar -->

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

		
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="main">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active" ><a class="nav-link" href="#">About</a></li>

				<c:choose>
					<c:when test="${login ne null }">
					<li class="nav-item active" >
					<label class="uinfo">${login.uname } 님 환영합니다.</label><a class="nav-link" href="user/logout">로그아웃</a></li>
					</c:when>
					<c:otherwise>
					<li class="nav-item active"><a class="nav-link" href="user/join">회원가입</a>	</li>
						<li class="nav-item active"><a class="nav-link" href="user/login">로그인</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>