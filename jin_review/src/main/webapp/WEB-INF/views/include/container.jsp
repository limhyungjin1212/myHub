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

  
  

<div class="row text-center">
	<div class="col-md-12">
		<h1> Hot & new Businesses</h1>
	</div>
	
	<c:forEach items="${plist }" var="pVO">
		<div class="col-lg-3 col-md-6 mb-4">
		<div class="card h-100" id="attach">
			<img class="card-img-top" width="200px;" height="150px;"  src='displayFile?fileName=${pVO.fn }' alt="not image">
			<div class="card-body">
				<h4 class="card-title"><a href="detail?pno=${pVO.pno }&pageNum=${page.cri.pageNum}&keyword=${page.cri.keyword}">${pVO.pname }</a></h4>
				<c:forEach  begin="1" end="${pVO.rate }" var="rateAvg">
				<i class='fas fa-star' style='color :#99ccff;' ></i>
			</c:forEach>
			<c:choose>
				<c:when test="${(pVO.rate *2) % 2 eq 1}">
					<i class="fas fa-star-half-alt" style='color :#99ccff;'></i>
					<c:forEach begin="${pVO.rate+1 }" end="4">
						<i class='far fa-star' style='color :#99ccff;' ></i>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach begin="${pVO.rate }" end="4">
						<i class='far fa-star' style='color :#99ccff;' ></i>
					</c:forEach>	
				</c:otherwise>
			</c:choose>
			<p class="card-text">${pVO.rcnt } reviews</p>
			</div>
			<div class="card-footer">
				언제 오픈을 했는감?
			</div>
		</div>
	</div>
	</c:forEach>
	
	<div class="col-md-8 ">
		<h1>왼쪽 오늘의 리뷰 핫한것</h1>
		<h1>왼쪽 오늘의 리뷰 핫한것</h1>
		<h1>왼쪽 오늘의 리뷰 핫한것</h1>
		<h1>왼쪽 오늘의 리뷰 핫한것</h1>
		<h1>왼쪽 오늘의 리뷰 핫한것</h1>
	</div>
	
	<div class="col-md-4 ">
		<h1>오른쪽 뭘 넣을까</h1>
		<h1>오른쪽 뭘 넣을까</h1>
		<h1>오른쪽 뭘 넣을까</h1>
		<h1>오른쪽 뭘 넣을까</h1>
		
	</div>
</div>
<!-- Page Features -->
<div id="revBox" class="row text-center">
	
	<c:forEach items="${revlist }" var="reviewVO">
	<div class="col-lg-3 col-md-6 mb-4">
		<div class="card h-100" id="attach">
			<div class="card-header">
				${reviewVO.writer }
				<c:choose>
					<c:when test="${reviewVO.content eq null }">
						사진만나온것입니다
					</c:when>
					<c:otherwise>
						리뷰적은것
					</c:otherwise>
				</c:choose>	
			</div>
			<c:if test="${reviewVO.fn != null }">
				<img class="card-img-top" width="200px;" height="150px;"  src='displayFile?fileName=${reviewVO.fn }' alt="not image">
			</c:if>
			<div class="card-body">
				<h4 class="card-title">${reviewVO.pname }</h4>
				<c:forEach  begin="1" end="${reviewVO.rate }" var="rateAvg">
				<i class='fas fa-star' style='color :#99ccff;' ></i>
			</c:forEach>
			<c:choose>
				<c:when test="${(reviewVO.rate *2) % 2 eq 1}">
					<i class="fas fa-star-half-alt" style='color :#99ccff;'></i>
					<c:forEach begin="${reviewVO.rate+1 }" end="4">
						<i class='far fa-star' style='color :#99ccff;' ></i>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach begin="${reviewVO.rate }" end="4">
						<i class='far fa-star' style='color :#99ccff;' ></i>
					</c:forEach>	
				</c:otherwise>
			</c:choose>
				<p class="card-text">${reviewVO.content }</p>
			</div>
			<div class="card-footer">
				<a href="detail?pno=${reviewVO.pno }&pageNum=${rpage.cri.pageNum}&keyword=${rpage.cri.keyword}">리뷰</a>
				<i class="far fa-heart"></i>
				<i class="far fa-bell"></i>
			</div>
		</div>
	</div>
</c:forEach>
</div>
	<div>
		<button type="button" id="addRevList" class="btn btn-link btn-block">
		<i class=""></i>더보기</button>				
	</div>
</div>
<script>

var pageNum = ${page.cri.pageNum};

	
	$("#addRevList").on("click",function(){
		console.log(pageNum);
		
		$.getJSON("addRevList?pageNum="+pageNum, function(data) {
			console.log(data.length);
			var str = "";
			$(data).each(function(index,data) {
				//// 첫 번째 index는 배열의 인덱스 또는 객체의 키를 의미하고 
				// 두 번째 매개 변수 item은 해당 인덱스나 키가 가진 값을 의미.
				if(index == data.length){
					return false;
				}
				str += "<div class='col-lg-3 col-md-6 mb-4'><div class='card h-100' id='attach'>";
				str += "<div class='card-header'>"+data.writer;
				  if(data.content == null){
					  str +="사진만 나온 것입니다";
				} else{
					str += "리뷰적은것</div>";
				} 
				if(data.fn != null){
					str += "<img class='card-img-top' width='200px;' height='150px;'  src='displayFile?fileName="+data.fn+"' alt='not image'>";
				}		
				str += "<div class='card-body'><h4 class='card-title'>"+data.pname+"</h4>";
				for(var i =1; i<=data.rate;i++){
					str+="<i class='fas fa-star' style='color :#99ccff;' ></i>"
				}
				if((data.rate*2) % 2 == 1 ){
					str += "<i class='fas fa-star-half-alt' style='color :#99ccff;'></i>";
					for(var i = data.rate+1;i<=4;i++){
						str += "<i class='far fa-star' style='color :#99ccff;' ></i>";
					}
				} else{
					for(var i = data.rate;i<=4;i++){
						str += "<i class='far fa-star' style='color :#99ccff;' ></i>";
					}
				}
				str += "<p class='card-text'>"+data.content+"</p></div>";
				str += "<div class='card-footer'><a href='detail?pno="+data.pno+"&pageNum=${rpage.cri.pageNum}&keyword=${rpage.cri.keyword}'>리뷰</a>";
				str += "<i class='far fa-heart'></i><i class='far fa-bell'></i></div>" ;
				str += "</div></div>";
				
			});
			console.log(str);
			if(data.length == 0){
				$("#addRevList").hide();
			}
			
			$("#revBox").append(str);
			pageNum++;
		});
		
	});

</script>

<!-- /.row -->