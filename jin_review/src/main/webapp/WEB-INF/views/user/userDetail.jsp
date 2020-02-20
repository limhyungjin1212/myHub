<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <script type="text/javascript" src="resources/js/userDetail.js"></script> -->
<div class="container">
	<div class="row">
		<div class='row p-2 my-3 border'>
			<div class='col-md-2'>
				<div class='card'>
				
					<img class='rounded-circle' src='resources/image/coffee1.jpg' alt='Card image' style='width:100%'>
						<div class='card-body'>
							<h4 class='card-title'>${user.uname }</h4>
						</div>
				</div>
			</div>
			<div class="col">
				<h5>이사람의 리뷰 갯수</h5>
				<h5>친구가 몇명인가 or 팔로우 수?</h5>
				<h5>자기소개글</h5>
			</div>
		</div>
		
		
		
	</div>
</div>

<div class="row">
	<div class="col">

		<h1>${uri }</h1>
		<h1>유저 디테일</h1>
		<h1>유저의 id :${user.uid }</h1>
		<h1></h1>
		<h1>로그인아이디 :${login.uid }</h1>
		<h1>
		</h1>
		
		<c:choose>
			<c:when test="${not empty followerList }">
					<c:forEach items="${followerList }" var="fl">
						<span class="flwl" id="${fl.follower }">${fl.follower }</span>			
					</c:forEach>
			</c:when>
			<c:otherwise>
				<span class="flwl">팔로워가 없습니다.</span>
			</c:otherwise>
		</c:choose>
	
		<div id="fbtn"></div>
	</div>
	<script>
	$(document).ready(function(){
	
	function flwlChk(){
		$(".flwl").each(function(index){
			var str = "";
			var flwl = $(this).text();
			console.log(flwl);
			if(flwl == "${login.uid}"){
				str += "<button type='button' id='followDisBtn' class='btn btn-primary'>팔로우해제</button>";
				
			} else{
				str += "<button type='button' id='followBtn' class='btn btn-primary'>팔로우</button>";
			}
			$("#fbtn").html(str);
			
		});
	}
	flwlChk();
	
		$(document).on("click","#followBtn", function() {

			//유저의 정보
			var uid = "${user.uid}";
			//로그인한 유저의 정보
			var myid = "${login.uid}";

			//유저의 정보가 없으면 로그인.
			if (myid == "") {
				alert("로그인이 필요합니다");
				location.href = "login";
				return false;
			} else {
				$.ajax({
					url : "follow",
					type : "post",
					data : {
						uid : uid,
						myid : myid
					},
					dataType : "text",
					success : function(data) {
						console.log(data);
						if (data == "success") {
							alert("팔로우 성공");
							$("#fbtn").append("<span class='flwl' id='"+myid+"'>"+myid+"</span>");
							flwlChk();
						}
					},
					error : function(err) {
						alert("팔로우 실패");
					}

				});

			}

		});
		
		
		$(document).on("click","#followDisBtn", function() {
			//유저의 정보
			var uid = "${user.uid}";
			//로그인한 유저의 정보
			var myid = "${login.uid}";

			//유저의 정보가 없으면 로그인.
			if (myid == "") {
				alert("로그인이 필요합니다");
				location.href = "login";
				return false;
			} else {
				$.ajax({
					url : "unfollow",
					type : "post",
					data : {
						uid : uid,
						myid : myid
					},
					dataType : "text",
					success : function(data) {
						console.log(data);
						if (data == "success") {
							alert("팔로우 해제");
							$("#"+myid+"").remove();
							flwlChk();
						}
					},
					error : function(err) {
						alert("팔로우 실패");
					}

				});

			}

		});
		
	});
	</script>





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

		<table  class="table table-bordered" id="revTable">
		<tr>
			<th scope="col-3"></th>
			<th scope="col"></th>
		</tr>
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
					<td><c:forEach items="${revMyFile }" var="rmf">

							<c:if test="${rmf.rno eq reviewVO.rno}">
								<img class='img-thumbnail' src='displayFile?fileName=${rmf.fn }' />
							</c:if>
						</c:forEach></td>
						<td>${reviewVO.content }</td>
				</tr>
				
				<tr>
					<td colspan="2">${reviewVO.regdate }</td>
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

	<div class="col"></div>

</div>
