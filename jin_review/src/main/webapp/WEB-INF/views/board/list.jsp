<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<div class="row text-center">
		<div class="col-lg-3 col-md-6 mb-4">
			<table class="table table-dark">
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>정보</th>
					<th>연락처</th>
				</tr>
				<c:forEach items="${list}" var="boardVO">
				<tr>
					<td>${boardVO.pno }</td>
					<td>${boardVO.pname }</td>
					<td>${boardVO.pinfo }</td>
					<td>${boardVO.ptel }</td>
				</tr>
			</c:forEach>
			</table>
		
		</div>
	</div>

