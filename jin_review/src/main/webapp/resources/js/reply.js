/**
 * 
 */



var str="";
	var pno = document.getElementById("newPno").value;
	var pageNum=1;


	function getAllList(){
		$.getJSON("replies/all/"+pno , function(data){
			console.log(data.length);
			$(data).each(
				function(){
					str += "<li data-pno='"+this.pno+"' class='replyLi'>" 
						+this.pno + ":" +"<span>"+  this.content+"</span>"
					/*+"<input type='button' value='수정'></li>";*/
						+"<button>수정</button></li>";
				});
			
			$("#replies").html(str);
			
		});
	}	
	
$(document).ready(function(){

	
	//댓글 수정 버튼 클릭
	$("#replies").on("click",".replyLi button",function(){
		var reply = $(this).parent().children("span");
		console.log(reply);
		var rno = reply.parent().attr("data-rno");
		var replytext = reply.text();
		
		
		$(".modal-title").html(rno);
		$("#replytext").val(replytext);
		$("#modDiv").show("slow");
	});
	
	$("#modDiv").hide();
	//댓글쓰기 버튼 클릭 start
	$("#replyAddBtn").on("click",function(){
		var pno = $("#newPno").val();
		var writer = $("#newWriter").val();
		var content = $("#newReplyText").val();
		
		$.ajax({
			
			type : 'post',
			url : 'replies',
			contentType : "application/json;charset=utf-8",
			dataType : 'text',
			data : JSON.stringify({
				pno:pno , 
				writer:writer, 
				content : content
				}),
			success:function(data){
				alert("등록 정상처리 됨");
				
				getAllList();
				
			},
			error : function(err){
				alert("실패!!")
			}
		});
	}); //댓글쓰기 버튼 end
	
	
	
	
		
	$("#replyModBtn").on("click",function(){
		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();
		
		$.ajax({
			type : 'put',
			url : '../replies/'+rno ,
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify({
				replytext:replytext
				
			}),
			dataTpye : "text",
			success:function(data){
				
				if(data == 'success'){alert("수정 정상처리 됨");
				$("#modDiv").hide("slow");
				}
			},
			error : function(err){
				alert("실패!!")
			}
		});
	});
	$("#replyDelBtn").on("click",function(){
		var rno = $(".modal-title").html();
		
		$.ajax({
			type : 'delete',
			url : '../replies/'+rno ,
			contentType : "application/json;charset=utf-8",
			dataTpye : "text",
			success:function(data){
				
				if(data == 'success'){
					alert("삭제 정상처리 됨");
					$("#modDiv").hide("slow");
				}
			},
			error : function(err){
				alert("실패!!")
			}
		});
	});
	
});
