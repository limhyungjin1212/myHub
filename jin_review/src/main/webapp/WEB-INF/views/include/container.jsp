<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- Jumbotron Header -->
<div class="container">
<header class="jumbotron my-4">
	<h1 class="display-3">안녕하세요</h1>
	<p class="lead">세상의 모든 리뷰를 담다.</p>
	<a href="board/list">게시판</a> <a href="#" class="btn btn-primary btn-lg">Call
		to action!</a>
		
		<!-- Topbar Search -->
<form action="main" method="get"
	class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
	<div class="input-group">
		<%-- <input type="hidden" name="pageNum" value="${page.cri2.pageNum }"> --%>
		<select>
			<option></option>
			<option>음식점</option>
			<option>병원</option>
			<option>제품</option>
		</select> <input type="text" name="keyword"
			class="form-control"
			placeholder="Search for..." aria-label="Search"
			aria-describedby="basic-addon2">
		<div class="input-group-append">
			<input class="btn btn-primary" type="submit" value="검색">
		</div>
	</div>
</form>
</header>

  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>


<!-- Page Features -->

<div class="row text-center">
	<%-- <c:forEach items="${list }" var="reviewVO">
	<div class="col-lg-3 col-md-6 mb-4">
		<div class="card h-100" id="attach">
			<img class="card-img-top" width="200px;" height="150px;"  src='displayFile?fileName=${reviewVO.fn }' alt="not image">
			<div class="card-body">
				<h4 class="card-title">${reviewVO.pname }</h4>
				<p class="card-text">${boardVO.pinfo }</p>
			</div>
			<div class="card-footer">
				<a href="detail?pno=${boardVO.pno }&pageNum=${page.cri.pageNum}&keyword=${page.cri.keyword}">리뷰</a>
				<i class="far fa-heart"></i>
				<i class="far fa-bell"></i>
			</div>
		</div>
	</div>
</c:forEach> --%>
	<div>
		<button type="button" >더보기</button>				
	</div>
			

</div>
</div>
<!-- /.row -->