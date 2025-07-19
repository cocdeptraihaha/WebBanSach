<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="author" content="">
<meta name="keywords" content="">
<meta name="description" content="">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap5/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200..1000;1,200..1000&display=swap"
	rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>Thông Tin Admin</title>
<style>
.container {
	max-width: 800px;
	margin: auto;
	padding: 20px;
}

.info {
	background: #f8f9fa;
	border: 1px solid #ddd;
	padding: 15px;
	margin-bottom: 20px;
	border-radius: 10px;
}

.info h3 {
	margin-top: 0;
}

.avatar {
	text-align: center;
	margin-bottom: 15px;
}

.avatar img {
	border-radius: 50%;
	width: 100px;
	height: 100px;
	object-fit: cover;
	border: 2px solid #ddd;
}

.text-center {
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="/Views/Admin/header.jsp"%>
	<div class="container">
		<h2 class="text-center">Thông Tin Tài Khoản</h2>
		<div class="info">
			<c:if test="${accountinfo.avatar.substring(0, 5) == 'https'}">
				<c:url value="${accountinfo.avatar}" var="accountAvatarUrl" />
			</c:if>
			<c:if test="${accountinfo.avatar.substring(0, 5) != 'https'}">
				<c:url value="/image?fname=${accountinfo.avatar}"
					var="accountAvatarUrl" />
			</c:if>

			<!-- Hiển thị ảnh tài khoản -->
			<div class="avatar">
				<img src="${accountAvatarUrl}" alt="Avatar của tài khoản"
					style="height: 150px; width: 150px; object-fit: cover; border-radius: 50%;">
			</div>

			<h3>Thông Tin Cá Nhân</h3>
			<p>
				<strong>Họ và Tên:</strong> ${accountinfo.fullname}
			</p>
			<p>
				<strong>Ngày Sinh:</strong> ${accountinfo.dateofbirth}
			</p>
			<p>
				<strong>Số Điện Thoại:</strong> ${accountinfo.phonenumber}
			</p>
			<p>
				<strong>Địa Chỉ:</strong> ${accountinfo.address}
			</p>
			<div class="text-center">
				<a href="editAccount.jsp" class="btn btn-primary btn-add">Chỉnh sửa</a>
			</div>
		</div>
	</div>
</body>
</html>
