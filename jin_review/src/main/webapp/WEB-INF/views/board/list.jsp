<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
	var result = "${msg}";

	if (result == 'wsuccess') {
		alert('글 등록 완료');
	} else if (result == 'dsuccess') {
		alert('글 삭제 완료');
	}
</script>
<div class="container">
<!-- DataTales Example -->
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
	</div>

	<!-- Topbar Search -->
	<form action="main" method="get"
		class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
		<div class="input-group">
			<%-- <input type="hidden" name="pageNum" value="${page.cri2.pageNum }"> --%>
			<select>
				<option></option>
				<option>음식점</option>
				<option>병원</option>
				<option>제품</option>
			</select> <input type="text" name="keyword"
				class="form-control bg-light border-0 small"
				placeholder="Search for..." aria-label="Search"
				aria-describedby="basic-addon2">
			<div class="input-group-append">
				<input class="btn btn-primary" type="submit" value="검색">
			</div>
		</div>
	</form>

	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-dark" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th>글번호</th>
						<th>분류</th>
						<th>제목</th>
						<th>연락처</th>
						<th>작성일자</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>글번호</th>
						<th>분류</th>
						<th>제목</th>
						<th>연락처</th>
						<th>작성일자</th>
					</tr>
					<!-- Trigger the modal with a button -->
					<button type="button" class="btn btn-info btn-lg"
						data-toggle="modal" data-target="#myModal">Open Modal</button>

					<!-- Modal -->
					<div id="myModal" class="modal fade" role="dialog">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Modal Header</h4>
								</div>
								<div class="modal-body">
									<p>Some text in the modal.</p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>

						</div>
					</div>
					<tr>
						<td><a href="register">글쓰기</a></td>
						<td colspan="4">
						<c:if test="${page.prev }">
								<a
									href="main?pageNum=${page.startPage-1 }&keyword=${page.cri.keyword}">[이전]</a>
							</c:if> <c:forEach begin="${page.startPage }" end="${page.endPage}"
								var="num">
								<%-- <a href="list?pageNum=${num }">${num }</a> --%>
								<c:choose>
									<c:when test="${page.cri.pageNum == num }">
										<b><a
											href="main?pageNum=${num }&keyword=${page.cri.keyword}"
											class="w3-bar-item w3-button w3-green">${num }</a></b>
									</c:when>
									<c:otherwise>
										<a href="main?pageNum=${num }&keyword=${page.cri.keyword}"
											class="w3-bar-item w3-button">${num }</a>
									</c:otherwise>
								</c:choose>
							</c:forEach> <c:if test="${page.next }">
								<a
									href="main?pageNum=${page.endPage +1 }&keyword=${page.cri.keyword}">[다ㅁ음]</a>
							</c:if></td>
					</tr>
				</tfoot>
				<tbody>
					<c:if test="${plist.size() == 0 }">
						<h3>데이터가 없습니다.</h3>
					</c:if>
					<c:forEach items="${adminList }"  var="boardVO">
						<tr>
							<td>${boardVO.pno }</td>
							<td>${boardVO.pcate }</td>
							<td>
							<a href="detail?pno=${boardVO.pno }&pageNum=${page.cri.pageNum}&keyword=${page.cri.keyword}">${boardVO.pname }</a>
							</td>
							<td>${boardVO.ptel }</td>
							<td>${boardVO.regdate }</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

		</div>
	</div>
</div>
</div>
