<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <div class="row">
<div class="col-md-6">
	<c:forEach items="${searchList }" var="pVO"	>
	<div class="row p-3 my-3 border">	
	<div class="col-md-4">
		<img class="img-thumbnail" src='displayFile?fileName=${pVO.fn }' alt="not image">
	</div>
	<div class="col-md-8">
	<table class="table table-borderless">
		<tr>
			<td><h4><a href="detail?pno=${pVO.pno }&pageNum=${page.cri.pageNum}&keyword=${page.cri.keyword}">${pVO.pname }</a></h4>
			</td>
			<td>${pVO.ptel }</td>
		</tr>
	<tr>
		<td>
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
		</td>
		<td>${pVO.place }</td>
	</tr>
	<tr>
		<td><p>${pVO.pcate }</p></td>
		
	</tr>
	<tr>
		<td colspan="2">
		<p>
				"${pVO.pinfo }"
				</p>
		</td>
	</tr>
	</table>
	</div>
	</div>
	</c:forEach>	
<c:if test="${page.prev }">
			<a	href="productSearch?pageNum=${page.startPage-1 }&keyword=${page.cri.keyword}&place=${page.cri.place}">[이전]</a>
		</c:if>
		 <c:forEach begin="${page.startPage }" end="${page.endPage}" var="num">
				<c:choose>
					<c:when test="${page.cri.pageNum == num }">
						<b><a href="productSearch?pageNum=${num }&keyword=${page.cri.keyword}&place=${page.cri.place}"
											class="w3-bar-item w3-button w3-green">${num }</a></b>
					</c:when>
					<c:otherwise>
						<a href="productSearch?pageNum=${num }&keyword=${page.cri.keyword}&place=${page.cri.place}"
											class="w3-bar-item w3-button">${num }</a>
					</c:otherwise>
				</c:choose>
				</c:forEach> 
				
		<c:if test="${page.next }">
			<a href="productSearch?pageNum=${page.endPage +1 }&keyword=${page.cri.keyword}&place=${page.cri.place}">[다ㅁ음]</a>
		</c:if> 

</div>
<div class="col-md-6" >
<h1>지도</h1>
<div id="mapDiv">
	<div id="map"></div>
	</div>
</div>		
</div>
<script>
			
		var keyword ="${page.cri.keyword}";
		var place="${page.cri.place}";
		
		$("#category").val(keyword);
		$("#placekeyword").val(place);
		
		$("#category").on("click",function(){
			$(this).val("");
		});
		// This example requires the Places library. Include the libraries=places
		// parameter when you first load the API. For example:
		// <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

		/*  var locations = [
      ['삼익사이버 아파트', 37.0211403, 127.0971617, 28],
      ['국립축산과학원 축산자원개발부', 36.93309333, 127.10487485, 10]
    ]; */
/* 
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 8,
      center: new google.maps.LatLng(37, 127.1),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow();

    var marker, i;

    for (i = 0; i < locations.length; i++) { 
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map
      });

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(locations[i][0]);
          infowindow.open(map, marker);
        }
      })(marker, i));
    }
     */
    
    
    
    var map;
	var service;
	var infowindow;


	function initMap() {
		var sydney = new google.maps.LatLng(35.907801, 127.767662);

		infowindow = new google.maps.InfoWindow();

		map = new google.maps.Map(document.getElementById('map'), {
			center : sydney,
			zoom : 15
		});

		var request = {
				
			query : 
				'${searchList[0].place}'
				,
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
    
    
    var wh = $(window).height();
    $("#map").css("height",wh);
    
	</script>
	asdfasfkdl
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBggZ8qinjU9aNYY_vCqfzv_C7PBA5v680&libraries=places&callback=initMap"
		async defer></script>
		
		
		
