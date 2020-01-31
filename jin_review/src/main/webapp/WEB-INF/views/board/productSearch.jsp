<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<h1>1</h1>
<h1>2</h1>
<h1>3</h1>
<h1>4</h1>
<h1>5</h1>

<div class="col-md-6">
	<c:forEach items="${searchList }" var="pVO"	>
	<div class="row p-3 my-3 border">	
	<div class="col-md-4">
		<img class="img-thumbnail" src='displayFile?fileName=${pVO.fn }' alt="not image">
	</div>
	<div class="col-md-8">
	<table class="table table-borderless">
		<tr>
			<td><h4><a href="detail?pno=${pVO.pno }&pageNum=${page.cri.pageNum}&keyword=${page.cri.keyword}">${pVO.pname }</a></h4>
			</td>
			<td>${pVO.ptel }</td>
		</tr>
	<tr>
		<td>
		<c:forEach  begin="1" end="${pVO.rate }" var="rateAvg">
				<i class='fas fa-star' style='color :#99ccff;' ></i>
			</c:forEach>
			<c:choose>
				<c:when test="${(pVO.rate *2) % 2 eq 1}">
					<i class="fas fa-star-half-alt" style='color :#99ccff;'></i>
					<c:forEach begin="${pVO.rate+1 }" end="4">
						<i class='far fa-star' style='color :#99ccff;' ></i>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach begin="${pVO.rate }" end="4">
						<i class='far fa-star' style='color :#99ccff;' ></i>
					</c:forEach>	
				</c:otherwise>
			</c:choose>
			<p class="card-text">${pVO.rcnt } reviews</p>
		</td>
		<td>${pVO.place }</td>
	</tr>
	<tr>
		<td><p>${pVO.pcate }</p></td>
		
	</tr>
	<tr>
		<td colspan="2">
		<p>
				"${pVO.pinfo }"
				</p>
		</td>
	</tr>
	</table>
	</div>
	</div>
	</c:forEach>	

</div>
		<c:if test="${page.prev }">
			<a	href="productSearch?pageNum=${page.startPage-1 }&keyword=${page.cri.keyword}&place=${page.cri.place}">[이전]</a>
		</c:if>
		 <c:forEach begin="${page.startPage }" end="${page.endPage}" var="num">
				<c:choose>
					<c:when test="${page.cri.pageNum == num }">
						<b><a href="productSearch?pageNum=${num }&keyword=${page.cri.keyword}&place=${page.cri.place}"
											class="w3-bar-item w3-button w3-green">${num }</a></b>
					</c:when>
					<c:otherwise>
						<a href="productSearch?pageNum=${num }&keyword=${page.cri.keyword}&place=${page.cri.place}"
											class="w3-bar-item w3-button">${num }</a>
					</c:otherwise>
				</c:choose>
				</c:forEach> 
				
		<c:if test="${page.next }">
			<a href="productSearch?pageNum=${page.endPage +1 }&keyword=${page.cri.keyword}&place=${page.cri.place}">[다ㅁ음]</a>
		</c:if> 

<script>
			
		var keyword ="${page.cri.keyword}";
		var place="${page.cri.place}";
		
		$("#category").val(keyword);
		$("#placekeyword").val(place);
		
		$("#category").on("click",function(){
			$(this).val("");
		});
		
</script>