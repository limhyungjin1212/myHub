<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <title>Place Searches</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
    
  </head>
  <body>
    
    <div id="tt">
    	<div id="replies">
    	<div id="gg"></div>
    	</div>
    	<textarea rows="" cols="" id="newReplyText">
    	</textarea>
    	<button id="btn">fdccbba목록</button>
    	<button id="replyAddBtn">등록</button>
    	리스트
    </div>
  
    <script>

	 var pno=27;
	    var str2 ="";
	    var p =0;
	    function getAllList(){
	    	$("#gg").html(str2);
	    	$.getJSON("replies/all/"+pno , function(data){
	  			console.log(data.length);
	  			$(data).each(
	  				function(){
	  					str2 += "<li data-pno='"+this.pno+"' class='replyLi'>" 
	  						+this.pno + ":" +"<span>"+  this.content+"</span>"
	  					/*+"<input type='button' value='수정'></li>";*/
	  						+"<button>수정</button></li>";
	  				});
	  			
	  			$("#gg").html(str2);
	  			str2 = "";
	  		});
	    }
    $(document).ready(function(){
    	    
    	    getAllList();
    	    $("#btn").on("click" , function(){
    	    	getAllList();
    	    });
    	    	
    	  //댓글쓰기 버튼 클릭 start
    		$("#replyAddBtn").on("click",function(){
    			var pno = 27
    			var writer = "그린이";
    			var content = $("#newReplyText").val();
    			
    			$.ajax({
    				type : 'post',
    				url : 'replies',
    				contentType : "application/json",
    				dataType : 'text',
    				data : JSON.stringify({
    					pno:pno , 
    					writer:writer, 
    					content : content
    					}),
    				success:function(result){
    					if(result =='success'){
    		    	    	getAllList();
    						$("#newReplyText").val("");
    					}
    				},
    				error : function(err){
    					alert("실패!!")
    				}
    			});
    		}); //댓글쓰기 버튼 end
    	    
    });
    
   
    </script>
    
  </body>
</html>