<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div>
	<form action="update" method="post" >
	<input type="hidden" name="pno" value="${detail.pno }" >
	<table border="1">
		<tr>
			<td>
				<select name="pcate">
					<option>분류</option>
					<option value="병원">병원</option>
					<option value="음식점">음식점</option>
					<option value="제품">제품</option>
				</select>
			</td>
			<td>이름 :
			<input type="text" name="pname" value=" ${detail.pname }" ></td>
		</tr>
		<tr>
			<td>연락처 :
			<input type="text" name="ptel" value=" ${detail.ptel }" >
			</td>
			<td>등록일 : ${detail.regdate }</td>
		</tr>
	</table>
	<div>
		<textarea name="pinfo">설명 : ${detail.pinfo }</textarea>
		
		<button class="btn-primary">수정</button>
		<button>취소</button>
	</div>
	
	</form>
</div>