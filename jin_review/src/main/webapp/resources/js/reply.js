/**
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 */

//	









$("#replyAddBtn").on(
		"click",
		function(event) {

			/*
			 * FormData 인터페이스는 XMLHttpRequest.send()로 쉽게 보내질 수 있는 폼 field와 그 값들로
			 * 나타나는 key/value쌍들을 쉽게 만들 수 있는 방법을 제공한다. 만약에 인코딩 타입이
			 * "multipart/form-data"로 설정이 되어 있으면 폼이 사용하는 것과 같은 포맷으로 사용한다.
			 */

			var pno = $("#newPno").val();
			var writer = $("#newWriter").val();
			var content = $("#newReplyText").val();

			var str5 = "";
			$(".rvUploadedlist small").each(
					function(index) {
						str5 += "<input type='hidden' name='files[" + index
								+ "]' value='" + $(this).attr("data-src")
								+ "' > ";
					});

			$("#rvWrite").append(str5);

			var rvForm = document.getElementById("rvWrite");
			var formData2 = new FormData(rvForm);
			console.log(formData2);

			$.ajax({
				type : 'post',
				url : 'replies',
				contentType : false,
				processData : false,
				dataType : 'text',
				data : formData2,
				success : function(result) {
					if (result == 'success') {
						getPageList(replyPage);
						$("#newReplyText").val("");
					}
				},
				error : function(err) {
					alert("등록 실패!!");
				}
			});

			/*
			 * JSON.stringify({ pno:pno , writer:writer, content : content, })
			 */

		}); // 댓글쓰기 버튼 end

$(document).ready(
				function() {

					var pct = $(".pcate").text();
					console.log(pct);
					if (pct == '제품') {
						$("#map").hide();
					}

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
														console
																.log(checkImageType(data));
														if (checkImageType(data)) {
															str = "<div>"
																	+ "<a href=displayFile?fileName="
																	+ getImageLink(data)
																	+ "><img src='displayFile?fileName="
																	+ getImageLink(data)
																	+ "'/>"
																	+ "</a><small data-src="
																	+ data
																	+ ">X</small>"
																	+ "</div>";
														} else {
															str = "<div><a href='displayFile?fileName="
																	+ data
																	+ "'>"
																	+ getOriginalName(data)
																	+ "</a>"
																	+ "<small data-src="
																	+ data
																	+ ">X</small></div>";
														}

														$(".rvUploadedlist")
																.append(str);
													}
												});

									});

					// 댓글 수정 버튼 클릭
					$("#replies").on("click", ".replyLi input:button",
							function() {
						var rno = $(this).parent().attr("data-rno"); //리뷰의 글번호
						
						console.log(rno);
						
						 window.open("reviewUpdate?rno="+rno+"", "새창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
						 
/*						 toolbar = 상단 도구창 출력 여부 

						 menubar = 상단 메뉴 출력 여부

						 location = 메뉴아이콘 출력 여부

						 directories = 제목 표시줄 출력 여부

						 status = 하단의 상태바 출력 여부

						 scrollbars = 스크롤바 사용 여부

						 resizable = 팝업창의 사이즈 변경 가능 여부

						 fullscreen = 전체화면으로 할지 선택 여부

						 channelmode = F11키 기능이랑 같음

						 출처: https://kcmschool.com/63 [web sprit]
*/								

								
								
							});

					
					$("#replyModBtn").on("click", function() {
						var rno = $(".modal-title").html();
						var content = $("#up_replytext").val();

						$.ajax({
							type : 'put',
							url : 'replies/' + rno,
							contentType : "application/json;charset=utf-8",
							data : JSON.stringify({
								content : content
							}),
							dataType : "text",
							success : function(data) {
								if (data == 'success') {
									alert("수정 정상처리 됨");
									getPageList(replyPage);
									$("#modDiv").hide	("slow");
								}
							},
							error : function(err) {
								alert("수정 실패!!")
							}
						});
					});

					$("#replyDelBtn").on("click", function() {
						var rno = $(".modal-title").html();

						$.ajax({
							type : 'delete',
							url : 'replies/' + rno,
							contentType : "application/json;charset=utf-8",
							dataType : "text",
							success : function(data) {

								if (data == 'success') {
									alert("삭제 정상처리 됨");
									getPageList(replyPage);
									$("#modDiv").hide("slow");
								}
							},
							error : function(err) {
								alert("실패!!")
							}
						});
					});
					$(document).on("click","#revImg",function(){
						alert("aa");
						$(this).toggle(
								function(){
									$("#revImg").css({"width":"300","height":"300"});
								},function(){
									$("#revImg").css({"width":"150","height":"150"});
								}
						);
						
					});

					$(document).on("click", "#btnHelpful", function() {

						var loginInfo = $("#loginfo").val();

						console.log(loginInfo);
						if (loginInfo == null || loginInfo == "") {
							alert("로그인을 먼저 해주세요!");
							location.href = 'login';
						} else {
							var rno = $(this).parents("li").attr("data-rno");
							var uname = loginInfo;
							alert(uname);
							$.ajax({
								type : 'put',
								url : 'replies/Helpful/'+rno,
								data : uname,
								contentType : "application/json;charset=utf-8",
								success : function(data) {
									if (data == 'success') {
										getPageList(replyPage);
									}
								},
								error : function(err) {
									alert("증가 실패!!");
								}
							});
						}
					});

					$(document).on("click", "#btnHelpfuldis", function() {
						var loginInfo = $("#loginfo").val();
						alert(loginInfo);
						console.log(loginInfo);
						if (loginInfo == null || loginInfo == "") {
							alert("로그인을 먼저 해주세요!");
							location.href = 'login';
						} else{
							var rno = $(this).parents("li").attr("data-rno");
							console.log("helpfuldis.rno="+rno);
							var uname = loginInfo;
							console.log("helpfuldis.unmae="+uname);
							$.ajax({
								type : 'delete',
								url : 'replies/Helpfuldis/' + rno,
								data : uname,
								contentType : "application/json;charset=utf-8",
								success : function(data) {
									if (data == 'success') {
										alert("도움 된 수 감소 ");
										getPageList(replyPage);
									}
								},
								error : function(err) {
									alert("감소 실패!!");
								}
							});
						}
					
					});
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					

				}); // document.ready end
