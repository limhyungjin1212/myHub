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
	
	 $("#files").change(function(event){
		 
		//var files = event.originalEvent.dataTransfer.files; //?
		var file = $("#files")[0].files[0]; //?
		alert($("#files")[0].files[0]);
	   	var formData = new FormData(); //FormData는 가상의 form태그 . 
		formData.append("file",file); //파일을 추가. 드래그앤드랍된 파일을 담는다.  
		alert(file);
		
		$.ajax({
			url:"uploadAjax",
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			type : "POST",
			
			success : function(data){
				//console.log(data);
				//alert(data);
				//alert(checkImageType(data));
				var str = "";
				console.log(checkImageType(data));
				if(checkImageType(data)){
					str="<div>"
						+"<a href=displayFile?fileName="+getImageLink(data)+"><img src='displayFile?fileName="+getImageLink(data)+"'/>"
						+ "</a><small data-src="+data+">X</small>" +"</div>";
				} else {
					str = "<div><a href='displayFile?fileName="+data+"'>"
						+getOriginalName(data) +"</a>" +
						"<small data-src="+data+">X</small></div>";
				}
				
				$(".rvUploadedlist").append(str);
			}
		});
		       
    });
	
	//댓글쓰기 버튼 클릭 start
	 $("#rvWrite").submit(function(event){
			event.preventDefault();
			var that = $(this);
			
			var str = "";
			
			$(".rvUploadedlist small").each(function(index){
				str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("data-src")+"' > ";
			});
			
			that.append(str);
			that.get(0).submit();
			
			
		});
	$("#replyAddBtn").on("click",function(event){
		//var pno = $("#newPno").val();
		//var writer = $("#newWriter").val();
		//var content = $("#newReplyText").val();
		/*				JSON.stringify({
		pno:pno , 
		writer:writer, 
		content : content,
		})
*/	
		event.preventDefault();
		
		var str = "";
		var formData = new FormData($("#rvWrite")[0]);
		
		$.ajax({
			type : 'post',
			url : 'replies',
			contentType : false, //FormData를 사용할때는 false로
			processData : false, //FormData를 사용할때는 false로
			dataType : 'text',
			data : formData,
			success:function(result){
				if(result =='success'){
					getPageList(replyPage);
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
					getPageList(replyPage);
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
					getPageList(replyPage);
					$("#modDiv").hide("slow");
				}
			},
			error : function(err){
				alert("실패!!")
			}
		});
	});
	
});
