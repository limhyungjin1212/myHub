<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no,user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">
<title>JinsReview</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="resources/css/heroic-features.css?ver=34" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="resources/css/all.min.css?ver=35" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="resources/css/dataTables.bootstrap4.min.css"
	rel="stylesheet">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>

<link rel="stylesheet" href="resources/css/upload.css" >
</head>
<body>
	<div>
		<jsp:include page="include/header.jsp"></jsp:include>
	</div>
	<h1>URI : ${uri }
		<a href="test">지도 테스트</a>
	</h1>
	


	<!-- Page Content -->
	<div class="container">
		<c:choose>
			<c:when test="${login.uid eq 'admin'}">
			<c:choose>
				<c:when test="${uri == '/register' }">
				<%@ include file="board/register.jsp"%>
				</c:when>
				<c:when test="${uri == '/detail' }">
					<%@ include file="board/detail.jsp"%>
				</c:when>
				<c:when test="${uri == '/update' }">
					<%@ include file="board/update.jsp"%>
				</c:when>				
				<c:otherwise>
					<%@ include file="board/list.jsp" %>
				</c:otherwise>
			</c:choose>
			</c:when>
			<c:otherwise>
				<jsp:include page="include/container.jsp"></jsp:include>
			</c:otherwise>
		</c:choose>
		<c:if test="">
		</c:if>
	</div>
	<!-- /.container -->
	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<jsp:include page="include/footer.jsp"></jsp:include>
	</footer>

</body>
</html>