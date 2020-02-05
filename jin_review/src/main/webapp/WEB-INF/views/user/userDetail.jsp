<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<h1>${uri }</h1>
<h1>유저 디테일</h1>
<h1>
	<button type="button" id="followBtn" class="btn btn-primary">팔로우 신청</button>
</h1>

<script>
	
	$("#followBtn").on("click",function(){
		
		var uname = "${user.uname}";
		var myname = "${login.uname}";
		console.log(uname);
		
		$.ajax({
			
			url : "follow",
			data : uname,
			type : "post",
			success: function(data){
				$(location).attr("href","login");
			}
			
			
			
			
		});
		
		
		
		
	});
	
	
	
	
	
	
	

</script>



<div class="container" id="myContent">
	<div class="row">
	<div class="col">
	
	</div>
		<div class="col-md-6">
			<table>
				<tr>
					<td>${user.uid }</td>
				</tr>
			</table>
			<h4>리뷰</h4>
			<c:if test="${myRevList.size() == 0 }">
				<h3>등록한 리뷰가 없습니다.</h3>
			</c:if>
			<table class="w3-table w3-striped w3-border" id="revTable">
				<c:forEach items="${myRevList }" var="reviewVO">
					<tr>
						<td width="30%"><a href="detail?pno=${reviewVO.pno }">${reviewVO.pname }</a></td>
							
						<td width="70%"><c:forEach begin="1" end="${reviewVO.rate }"
								var="rateAvg">
								<i class='fas fa-star' style='color: #99ccff;'></i>
							</c:forEach> <c:choose>
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
							</c:choose></td>
					</tr>
					<tr>
						<td width="70%">${reviewVO.content }</td>
						<td width="30%"></td>
					</tr>
					<tr>
						<td>멋져요</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4"><c:if test="${page.prev }">
							<a
								href="mypage?pageNum=${page.startPage-1 }&keyword=${page.cri.keyword}&writer=${login.uname}">[이전]</a>
						</c:if> <c:forEach begin="${page.startPage }" end="${page.endPage}"
							var="num">
							<%-- <a href="list?pageNum=${num }">${num }</a> --%>
							<c:choose>
								<c:when test="${page.cri.pageNum == num }">
									<b><a
										href="mypage?pageNum=${num }&keyword=${page.cri.keyword}&writer=${login.uname}"
										class="w3-bar-item w3-button w3-green">${num }</a></b>
								</c:when>
								<c:otherwise>
									<a
										href="mypage?pageNum=${num }&keyword=${page.cri.keyword}&writer=${login.uname}"
										class="w3-bar-item w3-button">${num }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach> <c:if test="${page.next }">
							<a
								href="mypage?pageNum=${page.endPage +1 }&keyword=${page.cri.keyword}&writer=${login.uname}">[다ㅁ음]</a>
						</c:if></td>
				</tr>
			</table>
		</div>
		
		<div class="col">
			
		</div>
		
	</div>
</div>
