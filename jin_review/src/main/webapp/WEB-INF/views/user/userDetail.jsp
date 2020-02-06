<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<h1>${uri }</h1>
<h1>유저 디테일</h1>
<h1>팔로워 :${user.follower }</h1>
<h1>로그인아이디 :${login.uid }</h1>
<h1>
<c:if test="${user.follower }">
	<button type="button" id="followBtn" class="btn btn-primary">팔로우 신청</button>
	</c:if>
</h1>

<script>
	
	$("#followBtn").on("click",function(){
		
		//유저의 정보
		var uid = "${user.uid}"; 
		//로그인한 유저의 정보
		var myid = "${login.uid}";

		//유저의 정보가 없으면 로그인.
		if(myid == ""){
			alert("로그인이 필요합니다");
			location.href="login";
			return false;
		} else{
			$.ajax({
				
				url : "follow",
				type : "post",
				data : {
					uid : uid,
					myid : myid
				},
				dataType:"text",
				success: function(data){
					console.log(data);
					if(data =="success"){
						alert("팔로우 성공");	
					}
				},error : function(err) {
					alert("팔로우 실패");
				}
				
				
			});
			
		}
		
		
	});
	
	
	
	
	
	
	

</script>



<div class="container" id="myContent">
	<div class="row">
	<div class="col">
	
	</div>
		<div class="col-md-6">
			<table>
				<tr>
					<td>${user.uname }</td>
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
								href="userDetail?pageNum=${page.startPage-1 }&keyword=${page.cri.keyword}&uname=${user.uname}">[이전]</a>
						</c:if> <c:forEach begin="${page.startPage }" end="${page.endPage}"
							var="num">
							<%-- <a href="list?pageNum=${num }">${num }</a> --%>
							<c:choose>
								<c:when test="${page.cri.pageNum == num }">
									<b><a
										href="userDetail?pageNum=${num }&keyword=${page.cri.keyword}&uname=${user.uname}"
										class="w3-bar-item w3-button w3-green">${num }</a></b>
								</c:when>
								<c:otherwise>
									<a
										href="userDetail?pageNum=${num }&keyword=${page.cri.keyword}&uname=${user.uname}"
										class="w3-bar-item w3-button">${num }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach> <c:if test="${page.next }">
							<a
								href="userDetail?pageNum=${page.endPage +1 }&keyword=${page.cri.keyword}&uname=${user.uname}">[다ㅁ음]</a>
						</c:if></td>
				</tr>
			</table>
		</div>
		
		<div class="col">
			
		</div>
		
	</div>
</div>
