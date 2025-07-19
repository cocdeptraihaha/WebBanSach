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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chỉnh Sửa Thông Tin Tài Khoản</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style>
.container {
	max-width: 800px;
	margin: auto;
	padding: 20px;
}

.btn-add {
	margin-bottom: 15px;
	display: block;
	width: 100%;
	padding: 10px;
	background-color: #F86D72;
	color: white;
	text-align: center;
	text-decoration: none;
	border-radius: 5px;
	font-size: 16px;
}

.btn-add:hover {
	background-color: #272727;
}

label {
	font-weight: bold;
	display: block;
	margin-top: 10px;
}

input, textarea {
	width: 100%;
	padding: 10px;
	margin-top: 5px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

textarea {
	resize: none;
}

.short-description, .long-description {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.text-center {
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="/Views/Vendor/header.jsp"%>
	<div class="container">
		<h2 class="text-center">Chỉnh Sửa Thông Tin Tài Khoản</h2>

		<form action="updateAccount" method="post">
			<label for="fullname">Họ và Tên:</label> <input type="text"
				id="fullname" name="fullname" required value="${account.fullname}">

			<label for="dob">Ngày Sinh:</label> <input type="date" id="dob"
				name="dob" required value="${account.dob}"> <label
				for="phone">Số Điện Thoại:</label> <input type="tel" id="phone"
				name="phone" required pattern="[0-9]{10}" value="${account.phone}">

			<label for="address">Địa Chỉ:</label>
			<textarea id="address" name="address" rows="3" required>${account.address}</textarea>

			<button type="submit" class="btn-add">Lưu Thay Đổi</button>
		</form>
	</div>

</body>
</html>
