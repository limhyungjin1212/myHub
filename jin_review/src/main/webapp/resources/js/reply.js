/**


 * 
 */

		

	   var str2="";
  	var pno = document.getElementById("newPno").value;
  	function getAllList(){
  		$.getJSON("replies/all/"+pno , function(data){
  			console.log(data.length);
  			$(data).each(
  				function(){
  					str2 += "<li data-rno='"+this.rno+"' class='replyLi'>" 
  						+this.pno + ":" +"<span>"+  this.content+"</span>"
  					/*+"<input type='button' value='수정'></li>";*/
  						/*+"<c:if test = '"${login.uname eq admin }"'>"*/ 
  						+"<button>수정</button></li>" +
  								"</c:if>";
  				});
  			
  			$("#replies").html(str2);
  			str2="";
  		});
  	}
	//	
$(document).ready(function(){
	getAllList();

	//댓글쓰기 버튼 클릭 start
	$("#replyAddBtn").on("click",function(){
		var pno = $("#newPno").val();
		var writer = $("#newWriter").val();
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
				alert("등록 실패!!");
			}
		});
	}); //댓글쓰기 버튼 end
	
	
	//댓글 수정 버튼 클릭
	$("#replies").on("click",".replyLi button",function(){
		var reply = $(this).parent().children("span");
		
		var rno = reply.parent().attr("data-rno");
		console.log(rno);
		var replytext = reply.text();
		
		
		$(".modal-title").html(rno);
		$("#replytext").val(replytext);
		$("#modDiv").show("slow");
	});
	
	$("#modDiv").hide();
	
	
	
	
	
		
	$("#replyModBtn").on("click",function(){
		var rno = $(".modal-title").html();
		var content = $("#replytext").val();
		
		$.ajax({
			type : 'put',
			url : 'replies/'+rno ,
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify({
				content:content
			}),
			dataTpye : "text",
			success:function(data){
				if(data == 'success'){
					alert("수정 정상처리 됨");
					getAllList();
				$("#modDiv").hide("slow");
				}
			},
			error : function(err){
				alert("수정 실패!!")
			}
		});
	});
	$("#replyDelBtn").on("click",function(){
		var rno = $(".modal-title").html();
		
		$.ajax({
			type : 'delete',
			url : 'replies/'+rno ,
			contentType : "application/json;charset=utf-8",
			dataTpye : "text",
			success:function(data){
				
				if(data == 'success'){
					alert("삭제 정상처리 됨");
					getAllList();
					$("#modDiv").hide("slow");
				}
			},
			error : function(err){
				alert("실패!!")
			}
		});
	});
	
});
