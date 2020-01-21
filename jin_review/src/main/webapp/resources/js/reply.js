/**


 * 
 */

		

	 
	//	
$(document).ready(function(){
	
	

	var pct = $(".pcate").text();
	console.log(pct);
	if(pct == '제품'){
		$("#map").hide();
	}
	/*//이미지 사이즈 조정
	
	$('.thumbnail').each(function() {
			    var maxWidth = 500; // Max width for the image
			    var maxHeight = 300;    // Max height for the image
			    var ratio = 0;  // Used for aspect ratio
			    var width = $(this).width();    // Current image width
			    var height = $(this).height();  // Current image height
			  
			    // Check if the current width is larger than the max
			    if(width > maxWidth){
			        ratio = maxWidth / width;   // get ratio for scaling image
			        $(this).css("width", maxWidth); // Set new width
			        $(this).css("height", height * ratio);  // Scale height based on ratio
			        height = height * ratio;    // Reset height to match scaled image
			    }
			  
			    var width = $(this).width();    // Current image width
			    var height = $(this).height();  // Current image height
			  
			    // Check if current height is larger than max
			    if(height > maxHeight){
			        ratio = maxHeight / height; // get ratio for scaling image
			        $(this).css("height", maxHeight);   // Set new height
			        $(this).css("width", width * ratio);    // Scale width based on ratio
			        width = width * ratio;    // Reset width to match scaled image
			    }
	});*/
	
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
