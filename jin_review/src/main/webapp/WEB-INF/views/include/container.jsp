<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- Jumbotron Header -->
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

<div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  
  <!-- The slideshow -->
  <div class="carousel-inner">
  
    <div class="carousel-item active">
      <img src='displayFile?fileName=${list.get(0).fn}' alt="Los Angeles" width="300" height="200">
    </div>
    <c:forEach items="${list }" var="boardVO">
    <div class="carousel-item">
      <img src='displayFile?fileName=${boardVO.fn}' alt="Chicago" width="300" height="200">
    </div>
    </c:forEach>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>

<!-- Page Features -->

<div class="row text-center">
	<c:forEach items="${list }" var="boardVO">
	<div class="col-lg-3 col-md-6 mb-4">
		<div class="card h-100" id="attach">
			<img class="card-img-top"  src='displayFile?fileName=${boardVO.fn }' alt="not image">
			<div class="card-body">
				<h4 class="card-title">${boardVO.pname }</h4>
				<p class="card-text">${boardVO.pinfo }</p>
			</div>
			<div class="card-footer">
				<a href="detail?pno=${boardVO.pno }&pageNum=${page.cri.pageNum}&keyword=${page.cri.keyword}">리뷰</a>
			</div>
			
			<div>
			</div>
		</div>
	</div>
</c:forEach>
				<c:if test="${page.prev }">
								<a	href="?pageNum=${page.startPage-1 }&keyword=${page.cri.keyword}">[이전]</a>
							</c:if> <c:forEach begin="${page.startPage }" end="${page.endPage}"
								var="num">
								<%-- <a href="list?pageNum=${num }">${num }</a> --%>
								<c:choose>
									<c:when test="${page.cri.pageNum == num }">
										<b><a
											href="?pageNum=${num }&keyword=${page.cri.keyword}"
											class="w3-bar-item w3-button w3-green">${num }</a></b>
									</c:when>
									<c:otherwise>
										<a href="?pageNum=${num }&keyword=${page.cri.keyword}"
											class="w3-bar-item w3-button">${num }</a>
									</c:otherwise>
								</c:choose>
							</c:forEach> <c:if test="${page.next }">
								<a href="?pageNum=${page.endPage +1 }&keyword=${page.cri.keyword}">[다ㅁ음]</a>
							</c:if>

</div>
<!-- /.row -->