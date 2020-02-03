/**
 * 
 */

function idcheck() {
	var id = document.getElementById("uid").value; // id가 id의 값
	if (id.length < 8 || id.length > 12) { // id의 길이가 8보다 작거나 12보다 크면
		document.getElementById("idcheck").innerHTML = "id는 8자이상 12자 이하로 입력하셔야 합니다.";
	} else {
		document.getElementById("idcheck").innerHTML = "멋진 아이디네요!";
	}

	var id_pattern = /[~!@#$%^&*()_+|<>?:{}]/;
}
function key() {
	var str = document.getElementById("firstNum").value;
	var pattern_num = /[0-9]/; // 숫자
	var pattern_eng = /[a-zA-Z]/; // 문자
	var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
	var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크
	
	//
	if ((pattern_num.test(str)) && !(pattern_eng.test(str) )
			&& !(pattern_spc.test(str)) && !(pattern_kor.test(str))) {
		return true
	} else {
		
		alert("숫자만 입력 가능합니다.")
		return false
	}
}


 

function pwequalscheck() {
	var pw = document.getElementById("upw").value;
	var pwchk = document.getElementById("pwchk").value;

	if (pw == pwchk) {
		document.getElementById("pwequals").innerHTML = "비밀번호 일치";
	} else {
		document.getElementById("pwequals").innerHTML = "비밀번호가 다릅니다.";
	}
}
var s = "";
function sendNum() {
	var a = "";
		a = Math.floor(Math.random() * 10000) + 1;
		s = parseInt(a);
		document.getElementById("receiveNum").value = s;
	alert(s);
}

function equalsNum() {
	var receiveNum = document.getElementById("receiveNum").value;
	alert(s == receiveNum && s!="" ? "인증완료" : "인증 실패");
}

function selectEmail() {
	var select = document.getElementById("emailselect").value;
	
	if (select==1){
		document.getElementById("email2").value = "";
		document.getElementById("email2").readOnly = false;
	} else{
		document.getElementById("email2").value = select;
		document.getElementById("email2").readOnly = true;
	}
}

$(document).ready(function(){
	var EcheckNum = 0;	
	$("#emailCheck").hide();
	
	

		$("#uname").on("blur",function(){
			var uname = $(this).val();
			if(uname == ""){
				return false;
			}
			$.ajax({
				url : "nameCheck",
				data : "uname="+uname ,
				dataType : "text",
				type : "get",
				success : function(data) {
					console.log(data.length);
					if(data == 0){
						$("#nameCheckBox").text("아주 멋진 닉네임 입니다.!")
					} else{
						$("#nameCheckBox").text("닉네임이  이미 사용중입니다.").css("color","red");
						$("#uname").val("");
						$("#uname").focus();
					}
				}
			});
		}); //uname blur end
		
			$("#joinForm").submit(function(){ //회원가입 유효성 검사.
			
			var uid = $("#uid").val();
			var nameCheckBox = $("#nameCheckBox").text(); 
			var pwcheck = $("#pwcheck").text();
			
			
			if(uid.length < 8 || uid.length > 12){
				alert("id양식에 맞게 작성")
				return false;
			}
			if(nameCheckBox != "아주 멋진 닉네임 입니다.!" ){
				alert("name양식에 맞게 작성");
				return false;
			}
			if(pwcheck != "비밀번호 사용 가능합니다."){
				alert("비번 양식에 맞게 작성");
				return false;
			}
			
				
			var ecn = $("#emailCheckNum").val();
			var ect = $("#ectrue").val();
			
			if(ect == 1){
				$("#joinForm").submit();
			} else {
				alert("이메일 인증을 해주세요");
				return false;
			}
		});
		
			$("#upw").on("blur",	function() {
				var pattern_num = /[0-9]/; // 숫자
				var pattern_eng = /[a-zA-Z]/; // 문자
				var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
				var pw = $("#upw").val();
					if (pw.length > 7 && pattern_num.test(pw) && pattern_eng.test(pw) && pattern_spc.test(pw) ) {
						$("#pwcheck").text("비밀번호 사용 가능합니다.").css("color","green");
						} else {
							$("#pwcheck").text("비밀번호는 특수문자1개이상포함 , 영문자 와 숫자 포함하여야합니다.")
							.css("color", "red");
						}
			});
			
				var year = "<option>연도</option>";
				for(i=2019;i>1980;i--){
					year +="<option>";
					year += i;
					year +="</option>";
				}
				
				$("#year").html(year);
				
				$("#submit").on("click",function(){
						$("#umail").val;
				});
				
				
				$("#emailSendbtn").on("click",function(){
					
					var umail = $("#umail").val();
					
					
					var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
					
					if(!getMail.test(umail)){
						alert("이메일 형식을 맞춰주세요. ex)email아이디@naver.com");
						return false;
					}
					
					
					
					alert(umail);
					$.ajax({
						
						url : "mailSending",
						data : "umail="+umail,
						type : 'post',
						dataType : "text",
						success : function(data) {
							$("#emailCheck").show();
							
							EcheckNum = data;
							
						}

					});
					
				}); 
				
					$("#emailCheckBtn").on("click",function(){
						
						var ecn = $("#emailCheckNum").val();
						
						if(ecn == EcheckNum){
							alert("인증 완료");
							$("#ectrue").val("1");
						} else{
							alert("인증실패 . 다시확인해주세요");
						}
						
					});
				
				
				
				
				
				
				
		});