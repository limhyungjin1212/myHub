<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/474aec6043.js" crossorigin="anonymous"></script>
</head>
<body>
<h1>리뷰 수정</h1>
<h1>모달수정?</h1>


	<form id="rev_up_form">
<input type="hidden" name="rno" id="rno" value="${rv.rno }">

					<div id="updateDiv">
					
					<span id="up_rate">
					 	<c:forEach begin="1" end="${rv.rate }"
							var="rateAvg">
							<i class='fas fa-star' style='color: #99ccff;'></i>
						</c:forEach> 
					<c:choose>
							<c:when test="${(rv.rate *2) % 2 eq 1}">
								<i class="fas fa-star-half-alt" style='color: #99ccff;'></i>
								<c:forEach begin="${rv.rate+1 }" end="4">
									<i class='far fa-star' style='color: #99ccff;'></i>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach begin="${rv.rate }" end="4">
									<i class='far fa-star' style='color: #99ccff;'></i>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</span> 
					<input type="hidden" id="rate" name="rate" value="1">
					<br> 
					<input type="text" class="form-control" id="up_rev_subject" name="rev_subject" autocomplete="off" placeholder="한줄 요약을 해주세요" value="${rv.rev_subject }"><br>
					<textarea placeholder="리뷰는 도움이 됩니다." class="form-control" rows="5" name="content" id="up_replytext">${rv.content }</textarea>
					
					<div id="rev_up_file">
						<h1>${rvd.pno }</h1>
							<c:forEach items="${rfd}" var="rfd">
							<div>
							<img alt="" style="width:150px; height:150px;" src="displayFile?fileName=${rfd.fn }">
							<small data-src="${rfd.fn }">X</small>
							</div>
							</c:forEach>
					
					<div>
						<input type="file" name="file" id="files" multiple="multiple">
						<div id="rv_update_upload">
						
						</div>
					</div>
					</div>
						</div>
					</form>
						<div align="right">
							<button type="button" id="replyModBtn" class="btn btn-outline-primary">수정</button>
							<button type="button" id="replyDelBtn" class="btn btn-outline-danger">삭제</button>
							<button type="button" id="closeBtn" class="btn btn-outline-dark">닫기</button>
						</div>
				
				<script>
				
				
				$("#up_rate i").on("click", function() {
					var thisrate = $(this);
					$("#up_rate i").css("color", "");

					$(this).css("color", "#99ccff").prevAll().css("color", "#99ccff");
					var j = $(this).index();
					alert(j + 1);
					$("#rate").val(j + 1);

				});		
				
				
				$("#rev_up_file").on("click","small",function(event){
					var that = $(this);
					var filedel = confirm("파일을 삭제하면 완전히 사라집니다.");
					if(filedel){
						$.ajax({
							url:"deleteFile",
							type:"post",
							data: {
								fileName:$(this).attr("data-src")
								},
							dataType:"text",
							success:function(result){
								if(result == 'deleted'){
									alert("deleted");
									that.parent("div").remove();
								}
							}
						})
					}else{
					    alert("파일삭제취소");
					}
					
				}); //small click end
				
				
				
				$("#files").change(function(event) {
					// var files =
						// event.originalEvent.dataTransfer.files;
						// //?
						var file = $("#files")[0].files[0]; // ?
						var formData = new FormData(); // FormData는
														// 가상의
														// form태그
														// .
						formData.append("file", file); // 파일을
														// 추가.
														// 드래그앤드랍된
														// 파일을
														// 담는다.

						$.ajax({
									url : "uploadAjax",
									data : formData,
									dataType : 'text',
									processData : false,
									contentType : false,
									type : "POST",

									success : function(data) {
										// console.log(data);
										// alert(data);
										// alert(checkImageType(data));
										var str = "";
										str = "<div>"+
													+ "<a href=displayFile?fileName="
													+ data
													+ "><img src='displayFile?fileName="
													+ data
													+ "'/>"
													+ "</a><small data-src="
													+ data
													+ ">X</small>"
													+ "</div>";

										$("#rv_update_upload").append(str);
									}
								});

					});
				
				
				
				
				
				$("#replyModBtn").on("click", function() {
					var rno = $("#rno").val();
					var content = $("#up_replytext").val();
					var rev_subject = $("#up_rev_subject").val();
					
					alert("rno"+rno);
					alert("content"+content);
					alert("rev_subject"+rev_subject);
					
					var str ="";
					$("#rev_up_file small").each(function(index){
						str +="<input type='hidden' id='files' name='files["+index+"]' value='"+$(this).attr("data-src")+"' >";
					});
					$("#rev_updateForm").append(str);
					
					var formData = $("#rev_up_form").serialize();
					alert(formData);
					
					
					$.ajax({
						type : 'put',
						url : 'replies/' + rno,
						contentType : "application/json;charset=utf-8",
						data : JSON.stringify(formData),
						dataType : "text",
						success : function(data) {
							if (data == 'success') {
								alert("수정 정상처리 됨");
								getPageList(replyPage);
								$("#modDiv").hide("slow");
							}
						},
						error : function(err) {
							alert("수정 실패!!")
						}
					});
				});
				
				
				
				</script>
				
</body>
</html>