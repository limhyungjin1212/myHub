<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>JinsReview</title>

<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="resources/css/heroic-features.css?ver=33" rel="stylesheet">

</head>

<body>
	<div>
		<jsp:include page="include/header.jsp"></jsp:include>
	</div>
	<!-- Page Content -->
	<div class="container">
		<c:choose>
			<c:when test="${login.uid eq 'admin'}">
				<jsp:include page="board/list.jsp"></jsp:include>
			</c:when>
			<c:otherwise>
				<jsp:include page="include/container.jsp"></jsp:include>
			</c:otherwise>
		</c:choose>
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<jsp:include page="include/footer.jsp"></jsp:include>
	</footer>

</body>
</html>
