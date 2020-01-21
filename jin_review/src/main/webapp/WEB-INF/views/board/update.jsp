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
		var str = "";
		var pno = ${update.pno};
		$.getJSON("detailJSON?pno=" + pno, function(data) {
			$(data).each(function() {
				str = "<img src='displayFile?fileName=" + data + "'/>";
			});

			$(".attach").append(str);

		});
		
		//small 태그를 클릭
		$(".uploadedList").on("click","small",function(event){
			var that = $(this);
			$.ajax({
				url:"deleteFile",
				type:"post",
				data: {fileName:$(this).attr("data-src")},
				dataType:"text",
				success:function(result){
					if(result == 'deleted'){
						alert("deleted");
						that.parent("div").remove();
					}
				}
			})
			
			
		}); //small click end
		
		
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
			          query: '${update.place}',
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
			 
			        var input = document.getElementById('pac-input');

		        var autocomplete = new google.maps.places.Autocomplete(input);

		        // Bind the map's bounds (viewport) property to the autocomplete object,
		        // so that the autocomplete requests use the current map bounds for the
		        // bounds option in the request.
		        autocomplete.bindTo('bounds', map);

		        // Set the data fields to return when the user selects a place.
		        autocomplete.setFields(
		            ['address_components', 'geometry', 'icon', 'name']);

		        var infowindow = new google.maps.InfoWindow();
		        var infowindowContent = document.getElementById('infowindow-content');
		        infowindow.setContent(infowindowContent);
		        var marker = new google.maps.Marker({
		          map: map,
		          anchorPoint: new google.maps.Point(0, -29)
		        });

		        autocomplete.addListener('place_changed', function() {
		          infowindow.close();
		          marker.setVisible(false);
		          var place = autocomplete.getPlace();
		          if (!place.geometry) {
		            // User entered the name of a Place that was not suggested and
		            // pressed the Enter key, or the Place Details request failed.
		            window.alert("No details available for input: '" + place.name + "'");
		            return;
		          }

		          // If the place has a geometry, then present it on a map.
		          if (place.geometry.viewport) {
		            map.fitBounds(place.geometry.viewport);
		          } else {
		            map.setCenter(place.geometry.location);
		            map.setZoom(17);  // Why 17? Because it looks good.
		          }
		          marker.setPosition(place.geometry.location);
		          marker.setVisible(true);

		          var address = '';
		          if (place.address_components) {
		            address = [
		              (place.address_components[0] && place.address_components[0].short_name || ''),
		              (place.address_components[1] && place.address_components[1].short_name || ''),
		              (place.address_components[2] && place.address_components[2].short_name || '')
		            ].join(' ');
		          }

		          infowindowContent.children['place-icon'].src = place.icon;
		          infowindowContent.children['place-name'].textContent = place.name;
		          infowindowContent.children['place-address'].textContent = address;
		          infowindow.open(map, marker);
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


	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBggZ8qinjU9aNYY_vCqfzv_C7PBA5v680&libraries=places&callback=initMap"
		async defer></script>


	<div>
		<form action="update" method="post">
			<input type="hidden" name="pno" value="${update.pno }">
			<table border="1">
				<tr>
					<td><select name="pcate">
							<option>분류</option>
							<option value="병원">병원</option>
							<option value="음식점">음식점</option>
							<option value="제품">제품</option>
					</select></td>
					<td>이름 2: <input type="text" name="pname"
						value=" ${update.pname }"></td>
				</tr>
				<tr>
					<td>연락처 : <input type="text" name="ptel"
						value=" ${update.ptel }">
					</td>
					<td>등록일 : ${update.regdate }</td>
				</tr>
			</table>
			<div>
				<textarea name="pinfo">${update.pinfo }</textarea>

				<div id="pac-container">
					<input id="pac-input" name="place" type="text"
						placeholder="Enter a location" value="${update.place }">
				</div>

				<div id="map"></div>
				<div id="infowindow-content">
					<img src="" width="16" height="16" id="place-icon"> <span
						id="place-name" class="title"></span><br> <span
						id="place-address"></span>
				</div>
				
				
				<div class="attach"></div>


				<button class="btn-primary">수정</button>
				<button>취소</button>
			</div>

		</form>
	</div>
</div>