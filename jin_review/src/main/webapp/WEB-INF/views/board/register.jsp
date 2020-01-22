<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	#map{
		width: 800px;
		height: 300px;
		
	}
</style>
<div>
글쓰기 하기 위한 폼 입니다.
<h1> <%=request.getRequestURI().substring(request.getContextPath().length())%></h1>
<form id = "registerForm" action="register" method="post" enctype="multipart/form-data">
	<select id="selectBox" name="pcate">
		<option value="병원">병원</option>
		<option value="음식">음식</option>
		<option value="제품">제품</option>
		<option value="헬스장">헬스장</option>
		<option value="세탁소">세탁소</option>
	</select>
	제목 : <input type="text" name="pname" required> <br>
	
  <div id="pac-container">
        <input id="pac-input" name="place" type="text"
            placeholder="Enter a location">
      </div>
    
    <div id="map"></div>
      <div id="infowindow-content">
      <img src="" width="16" height="16" id="place-icon">
      <span id="place-name"  class="title"></span><br>
      <span id="place-address"></span>
    </div>
	<br>
	내용 : <textarea class="form-control" rows="10" cols="20" name="pinfo"></textarea> <br>
	연락처 : <input type="text" name="ptel"> <br>
	 파일 : <input type="file" name="filename">
	 
	<input type="submit" value="글쓰기">
	<input type="button" onclick="location.href='main'" value="목록" >
	<div class="fileDrop">파일을 드래그앤 드랍</div>
	<div class="uploadedList"></div>
</form>
</div>
<script type="text/javascript" src="resources/js/upload.js?ver=11"></script>
 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBggZ8qinjU9aNYY_vCqfzv_C7PBA5v680&libraries=places&callback=initMap"
        async defer></script>
