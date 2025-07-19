<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <title>Chỉnh sửa thông tin </title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Main CSS-->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Vendor/css/main.css">
  <link rel="stylesheet" type="text/css" href="css/main.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
  <!-- or -->
  <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

  <!-- Font-icon css-->
  <link rel="stylesheet" type="text/css"
    href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

</head>
<body>
	<%@ include file="/Vendor/header.jsp"%>
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
