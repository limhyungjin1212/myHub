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
</header>
<div class="text-center">
<h1>주변 지역을 찾아보세요!</h1>  
</div>
<div class="row">
	<div class="col-md-4">
		<img alt="" src="resources/image/health.jpg" class="img-thumbnail" >
		<a href="productSearch?keyword=헬스&place=울산광역시">Gyms</a>
	</div>
	<div class="col-md-4">
		<img alt="" src="resources/image/hotelthumbnail.jpg" class="img-thumbnail">
		<a href="#">Hotels</a>
	</div>
	<div class="col-md-4">
		<img alt="" src="resources/image/coffee1.jpg" class="img-thumbnail">
		<a href="#">Coffee</a>
	</div>
</div>  

<div class="row text-center">
	<div class="col-md-12">
		<h1> Hot & new Businesses</h1>
	</div>
	
	<c:forEach items="${plist }" var="pVO">
		<div class="col-lg-3 col-md-6 mb-4">
		<div class="card h-100" id="attach">
			<a href="detail?pno=${pVO.pno }&pageNum=${page.cri.pageNum}&keyword=${page.cri.keyword}"><img class="img-thumbnail" src='displayFile?fileName=${pVO.fn }' height="" alt="not image"></a>
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
				등록한 날짜 : ${pVO.regdate }
			</div>
		</div>
	</div>
	</c:forEach>
	
	<div class="col-md-8 ">
	<p class="display-4 text-center">주간 리뷰 도움이 많이 된것.</p>
		<div class="container p-3 my-3 bg-primary text-white">
		<h1>${weekReview.rev_subject }</h1>
		<h1>${weekReview.writer }</h1>
		<div>
			${weekReview.content }
		</div>
		<div>
			<img src="displayFile?fileName=${weekReview.fn }">
		</div>
		</div>
	</div>
	
	<div class="col-md-4 ">
		<table>
			 
		</table>
		
	</div>
</div>
<!-- Page Features -->


	<p class="display-2 text-center">최근 리뷰</p>

<div id="revBox" class="row text-center">
	<div class="card-columns">
	<c:forEach items="${revlist }" var="reviewVO">
	<!-- <div class="col-lg-3 col-md-6 mb-4"> -->
	
		<div class="card" id="attach">
			<div class="card-header">
				<a href="userDetail?uname=${reviewVO.writer }">${reviewVO.writer }</a>
				<c:choose>
					<c:when test="${reviewVO.content eq null }">
						사진만나온것입니다
					</c:when>
					<c:otherwise>
						리뷰
					</c:otherwise>
				</c:choose>	
			</div>
			<c:if test="${reviewVO.fn != null }">
				<img class="img-thumbnail" src='displayFile?fileName=${reviewVO.fn }' alt="not image">
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
	<!-- </div> -->
</c:forEach>
	</div>
</div>
	<div>
		<button type="button" id="addRevList" class="btn btn-link btn-block">
		<i class=""></i>더보기</button>				
	</div>
</div>
<script>

var pageNum = ${page.cri.pageNum};

	
	$("#addRevList").on("click",function(){
		
		$.getJSON("addRevList?pageNum="+pageNum, function(data) {
			var str = "";
			$(data).each(function(index,data) {
				//// 첫 번째 index는 배열의 인덱스 또는 객체의 키를 의미하고 
				// 두 번째 매개 변수 item은 해당 인덱스나 키가 가진 값을 의미.
				if(index == data.length){
					return false;
				}
				str += "<div class='card' id='attach'>";
				str += "<div class='card-header'><a href='userDetail?uname="+data.writer+"'>"+data.writer+"</a>";
				  if(data.content == null){
					  str +="사진만 나온 것입니다";
				} else{
					str += "리뷰적은것</div>";
				} 
				if(data.fn != null){
					str += "<img class='img-thumbnail'  src='displayFile?fileName="+data.fn+"' alt='not image'>";
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
				str += "</div>";
				
			});
			if(data.length == 0){
				$("#addRevList").hide();
			}
			
			$(".card-columns").append(str);
			pageNum++;
		});
		
	});
	

</script>

<!-- /.row -->