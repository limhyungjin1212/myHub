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
    
    <div>
    	<table id="replies" >
    		<tr>
    			<td>번호</td>
    			<td>제목</td>
    			<td>내용</td>
    		</tr>
    		  
    	</table>
    	<button id="btn">등록</button>
    	리스트
    </div>
  
    <script>
    var pno=1;
    var str ="";
    var p =0;
    $("#btn").on("click" , function(){
    	
    	
    	
    	 $.getJSON("detailajax?pno="+pno , function(data){
    	    	$(data).each(
    	    		function(){
    	    			if(this.pno == p ){
    	    				alert("aa");
    	    			}
    	    			str = "<tr><td data-pno='"+this.pno+"'>"+this.pno+"</td>"
    	    				+"<td>"+this.pname+"</td>"
    	    				+"<td>"+this.pinfo+"</td></tr>"
    	    			/*+"<input type='button' value='수정'></li>";*/
    	    				+"<button>수정</button></li>";
    	    		});
    	    	
    	    	$("#replies").append(str);
    	    	
    	    });
    	 
    	 p = $(this).parent().children("td").attr("data-pno");
     	
     	console.log(p);
    	 
    	 
    	 
    });
    	
    </script>
    
  </body>
</html>