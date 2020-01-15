/**


 * 
 */


function checkImageType(fileName){
	var pattern = /jpg|gif|png|jpeg/i;
	return fileName.match(pattern);
}

function getImageLink(fileName){
	if(!checkImageType(fileName)){
		return;
	}
	var front = fileName.substr(0,12); //   /2020/01/07/
	var end = fileName.substr(14);	//  7163ad49-a36d-4afe-bf82-e496526b4b40_coffee2.jpg 앞에 s_를 떼준다.
	
	
	//alert("front"+front);
	//alert("end"+end);
	
	return front + end;
}

function getOriginalName(fileName){
	 if(checkImageType(fileName)){ //이미지 파일이면 skip
         return;
     }
     
     var idx=fileName.indexOf("_")+1; //uuid를 제외한 파일이름을 리턴함
     return fileName.substr(idx);
	/*alert("fileName :" + fileName);
	return fileName;*/
}

$(".fileDrop").on("dragenter dragover",function(event){
		event.preventDefault();
	});
	
	$(".fileDrop").on("drop",function(event){
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		var file = files[0];
		//console.log(file);
		
		var formData = new FormData(); //FormData는 가상의 form태그 . 
		
		formData.append("file",file); //파일을 추가. 드래그앤드랍된 파일을 담는다.
		
		
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
						+"<img src='displayFile?fileName="+getImageLink(data)+"'/>"
						+ "<small data-src="+data+">X</small>" +"</div>";
				} else {
					str = "<div><a href='displayFile?fileName="+data+"'>"
						+getOriginalName(data) +"</a>" +
						"<small data-src="+data+">X</small></div>";
				}
				
				$(".uploadedList").append(str);
			}
		});
		});	//drop end
	
	
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
	
$("#registerForm").submit(function(event){
	event.preventDefault();
	
	var that = $(this);
	
	var str = "";
	
	$(".uploadedList small").each(function(index){
		str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("data-src")+"' > ";
	});
	
	that.append(str);
	that.get(0).submit();
	
	
});
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	