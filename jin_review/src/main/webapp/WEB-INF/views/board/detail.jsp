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

.replyLi{
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
	else if (result =='usuccess'){
		alert('수정 완료');
	}
	
		
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
				query :	'${detail.place}',
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


	<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBggZ8qinjU9aNYY_vCqfzv_C7PBA5v680&libraries=places&callback=initMap"	async defer></script>
	<div id="map"></div>
	<div class="attach"></div>
	<div class="row text-center">
		<table class="w3-table-all" border="1">
			<tr>
				<td class="pcate">${detail.pcate }</td>
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
		

		</div>
		<br>


	</div>

	<div class="reviewBox">
	<ul id="replies" class="w3-ul w3-border"></ul>
	</div>
	<br> 
	
	<ul class="pagination"></ul>
	
	<input type="hidden" id="loginfo" value="${login.uname}">
	
	
	
	<c:choose>
		<c:when test="${!empty login }">
			<div>
			<form id="rvWrite" name="rvWrite">
				<input type="hidden" name="writer" id="newWriter" value="${login.uname}">
				<input type="hidden" name="pno" id="newPno" value="${detail.pno }">
				리뷰
				<textarea placeholder="리뷰는 도움이 됩니다." class="form-control" rows="5" name="replytext" id="newReplyText"></textarea>
				<div class="fileDrop">
					<h1>여기다 파일을 끌어다 놓으세요.</h1>
				</div>
				<div class="rvUploadedlist">
					
				</div>
				<button id="replyAddBtn" class="btn btn-primary">리뷰 등록</button>
				</form>
				
			</div>
		</c:when>
		<c:otherwise>
			<div>
				<h5>
					리뷰 등록을 원하시면 로그인을 해주세요<a href="user/login?uri=">로그인하러가기</a>
				</h5>
			</div>

			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#myModal">로그인하러가기a</button>

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
	
	<script>
	  var str2="";
  	var pno = ${detail.pno};
  	var loginfo =document.getElementById("loginfo").value;
  	
  	function getPageList(page){
  		$.getJSON("replies/"+pno+"/"+page,function(data){
  			console.log(data.length);
  			var str2 = "";
  			$(data.list).each(function(){
  				str2 += "<li data-rno='"+this.rno+"' class='replyLi'>" 
					+this.writer + "<br>" +"<span>"+  this.content+"<br><i class='far fa-star'></i> </span>";
					
				if(loginfo == this.writer){
					str2+="<button>수정</button></li>";
					} else{
						str2+="</li>";
					}
  			});
  			$("#replies").html(str2);
  			
  			printPaging(data.page);
  			
  		});
  	}
  	
  	function printPaging(page){
  		
  		var str3="";
  		
  		if(page.prev){
  			str3 += "<li><a href='"+(page.startPage-1)+"' > [이전] </a></li> ";
  		}
  		
  		for(var i=page.startPage , len = page.endPage; i<=len; i++){
  			var strClass = page.cri.page == i ? 'class=active' : '';
  			str3 += "<li "+strClass+"><a class='page-link' href='"+i+"'>"+i+"</a></li>";
  		}
  		if(page.next){
  			str3 += "<li><a class='page-link' href='"+(page.endPage+1)+"' > [다음] </a></li> ";
  		}
  		$('.pagination').html(str3);
  	}
  	
  	var replyPage = 1;
  	$(".pagination").on("click", "li a",function(event){
  		event.preventDefault(); //<a href=""> 태그의 기본동작인 페이지 전환을 막는 역할을 한다. 
  		
  		replyPage = $(this).attr("href"); //이동을 막고 현재 클릭된 페이지의 번호를 얻어내고. 리스트 호출
  		
  		getPageList(replyPage);
  	});
  	
  	getPageList(1); //첫댓글은 1페이지.
  	
  	</script>
	
	
		<button onclick="location.href='main'">목록</button>
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
function checkImageType(fileName){
	var pattern = /jpg|gif|png|jpeg/i;
	var fn3 = new String(fileName);
	return fn3.match(pattern);
}

function getImageLink(fileName){
	if(!checkImageType(fileName)){
		return;
	} 
	var fn2 = new String(fileName);
	console.log(typeof(fileName));
	var front = fn2.substring(0,12); //   /2020/01/07/
	var end = fn2.substring(14);	//  7163ad49-a36d-4afe-bf82-e496526b4b40_coffee2.jpg 앞에 s_를 떼준다.
	
	
	//alert("front"+front);
	//alert("end"+end);
	
	return front+end;
}

function getOriginalName(fileName){
	 if(checkImageType(fileName)){ //이미지 파일이면 skip
         return;
     }
     
     var idx=fileName.indexOf("_")+1; //uuid를 제외한 파일이름을 리턴함
     return fileName.substr(idx);
	/*alert("fileName :" + fileName);
	return fileName;*/
}
	

var str = "";
var pno = ${detail.pno};
$.getJSON("detailJSON?pno=" + pno, function(data) {
	console.log(data.length);
	$(data).each(function(index,data) {
		//// 첫 번째 index는 배열의 인덱스 또는 객체의 키를 의미하고 
		// 두 번째 매개 변수 item은 해당 인덱스나 키가 가진 값을 의미합니다.
		str += "<a href='#'>"+data+"</a><img class ='thumbnail' width='1000px' height='500px' src='displayFile?fileName="+getImageLink(data)+"'/>";
		 	
	});

	$(".attach").append(str);

});
</script>


<script type="text/javascript" src="resources/js/reply.js?ver=64"></script>

