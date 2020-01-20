<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#map {
	width: 100%;
	height: 400px;
	background-color: grey;
}

#reply {
	background-color: grey;
}
</style>
<div>
	<script>
	var result = "${msg}";

	if (result == 'wsuccess') {
		alert('글 등록 완료');
	} else if (result == 'dsuccess') {
		alert('글 삭제 완료');
	} else if (result =='fail'){
		alert('로그인 실패');
	}
	
		var str = "";
		var pno = $
		{
			detail.pno
		};
		$.getJSON("detailJSON?pno=" + pno, function(data) {
			console.log(data);
			$(data).each(function() {
				str = "<img src='displayFile?fileName=" + data + "'/>";
			});

			$(".attach").append(str);

		});
		// This example requires the Places library. Include the libraries=places
		// parameter when you first load the API. For example:
		// <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

		var map;
		var service;
		var infowindow;

		function initMap() {
			var sydney = new google.maps.LatLng(35.907801, 127.767662);

			infowindow = new google.maps.InfoWindow();

			map = new google.maps.Map(document.getElementById('map'), {
				center : sydney,
				zoom : 17
			});

			var request = {
				query : '${detail.place}',
				fields : [ 'name', 'geometry' ],
			};

			service = new google.maps.places.PlacesService(map);

			service.findPlaceFromQuery(request, function(results, status) {
				if (status === google.maps.places.PlacesServiceStatus.OK) {
					for (var i = 0; i < results.length; i++) {
						createMarker(results[i]);
					}

					map.setCenter(results[0].geometry.location);
				}
			});
		}

		function createMarker(place) {
			var marker = new google.maps.Marker({
				map : map,
				position : place.geometry.location
			});

			google.maps.event.addListener(marker, 'click', function() {
				infowindow.setContent(place.name);
				infowindow.open(map, this);
			});
		}
	</script>


	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBggZ8qinjU9aNYY_vCqfzv_C7PBA5v680&libraries=places&callback=initMap"
		async defer></script>
	<div id="map"></div>
	<div class="attach"></div>
	<div class="row text-center">
		<table class="w3-table-all" border="1">
			<tr>
				<td>분류 : ${detail.pcate }</td>
				<td>이름 : ${detail.pname }</td>
			</tr>
			<tr>
				<td>연락처 :${detail.ptel }</td>
				<td>등록일 :${detail.regdate }</td>
			</tr>
		</table>

		<div>
			<textarea>설명 : ${detail.pinfo }</textarea>

			<c:if test="${login.uid eq 'admin' }">
				<button class="btn-primary"
					onclick="location.href='update?pno=${detail.pno}'">수정</button>
				<button onclick="location.href='delete?pno=${detail.pno}'">삭제</button>
			</c:if>
			<button onclick="location.href='main'">목록</button>

		</div>
		<br>


	</div>


	<ul id="replies"></ul>

	<br> <input type="hidden" id="newPno" value="${detail.pno }">

	<c:choose>
		<c:when test="${!empty login }">
			<div>
				<input type="hidden" id="newWriter" value="${login.uname}">
				댓글 내용 :
				<textarea name="replytext" id="newReplyText"></textarea>
				<button id="replyAddBtn">댓글 추가g</button>
			</div>
		</c:when>
		<c:otherwise>
			<div>
				<h5>
					리뷰 등록을 원하시면 로그인을 해주세요<a href="user/login?uri=">로그인하러가기</a>
				</h5>
			</div>

			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#myModal">로그인하러가기</button>

			<!-- The Modal -->
			<div class="modal" id="myModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">Modal Heading</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
						<div class="modal-body">
							<form action="user/loginPost" method="post">
							<input type="hidden" name="uri" value='detail?pno=${detail.pno}&pageNum=1&keyword='>
								<input class="w3-input w3-border" type="text" name="uid" placeholder="아이디">
								<input class="w3-input w3-border" type="password" name="upw" placeholder="비밀번호" >
								<input class="w3-input w3-border" type="submit" value="로그인">
							</form>
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						</div>

					</div>
				</div>
			</div>


		</c:otherwise>
	</c:choose>
</div>

<div id="modDiv">
	<div class="modal-title"></div>
	<div>
		<input type="text" id="replytext">
	</div>
	<div>
		<button id="replyModBtn">수정</button>
		<button id="replyDelBtn">삭제</button>
		<button id="closeBtn">닫기</button>
	</div>
</div>

<script>
	
</script>


<script type="text/javascript" src="resources/js/reply.js?ver=65"></script>

