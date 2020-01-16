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
	  <script>
		  var str="";
		  var pno = ${detail.pno};
		  $.getJSON("detailJSON?pno="+pno , function(data){
		    	$(data).each(
		    		function(){
		    			str ="<img src='displayFile?fileName="+data+"'/>";
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

        map = new google.maps.Map(
            document.getElementById('map'), {center: sydney, zoom: 17});

        var request = {
          query: '${detail.place}',
          fields: ['name', 'geometry'],
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
          map: map,
          position: place.geometry.location
        });

        google.maps.event.addListener(marker, 'click', function() {
          infowindow.setContent(place.name);
          infowindow.open(map, this);
        });
      }
     
      
    </script>
    
    
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBggZ8qinjU9aNYY_vCqfzv_C7PBA5v680&libraries=places&callback=initMap" async defer></script>
    
<div id="map"></div>
<div class="attach"></div>
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
