<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

 <style>
      #map {
        width: 100%;
        height: 400px;
        background-color: grey;
      }
    </style>
<div>
	<div id="map"></div>
	 <script>
// Initialize and add the map
function initMap() {
  // The location of Uluru
  var uluru = {lat: -25.344, lng: 131.036};
  // The map, centered at Uluru
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 10, center: uluru});
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({position: uluru, map: map});
}
    </script>
    
    
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBggZ8qinjU9aNYY_vCqfzv_C7PBA5v680&callback=initMap">
    </script>
    

	<table border="1">
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
		
		<button class="btn-primary" onclick="location.href='update?pno=${detail.pno}'">수정</button>
		<button onclick="location.href='delete?pno=${detail.pno}'">삭제</button>
		<button onclick="location.href='list'">목록</button>
	</div>
	
	
</div>
