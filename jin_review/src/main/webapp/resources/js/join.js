/**
 * 
 */

function idcheck() {
	var id = document.getElementById("id").value; // id가 id의 값
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

/*
 * function passwordcheck() { var pw = document.getElementById("pw").value; if
 * (pw.length < 8 || pw.length > 12) {
 * document.getElementById("pwcheck").innerHTML = "비밀번호는 8자이상 12자 이하로 입력하셔야
 * 합니다."; } else { document.getElementById("pwcheck").innerHTML = ""; } }
 */

function pwequalscheck() {
	var pw = document.getElementById("pw").value;
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

$(document).ready(
		function() {

			$("#pw").on("blur",	function() {
				var pw = $("#pw").val().length;
					if (pw < 8 || pw > 12) {
							$("#pwcheck").text("비밀번호는 8자이상 12자 이하로 입력하셔야 합니다.")
									.css("color", "red");
						} else {
							$("#pwcheck").text("");
						}
					});
			
				var year = "<option>연도</option>";
				for(i=2019;i>1980;i--){
					year +="<option>";
					year += i;
					year +="</option>";
				}
				$("#year").html(year);
				
				
				
		});