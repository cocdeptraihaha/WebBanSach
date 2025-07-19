<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
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
<style>
.container {
	max-width: 800px;
	margin: auto;
	padding: 20px;
}
</style>
</head>
<body>
<%@ include file="/Views/Vendor/header.jsp"%>
    <div class="container">
        <h2>Cài Đặt Tài Khoản</h2>

        <!-- Form đổi mật khẩu -->
        <form action="${pageContext.request.contextPath}/vendor/updatePassword" method="post">
            <h3>Đổi Mật Khẩu</h3>
            <div class="mb-3">
                <label for="currentPassword" class="form-label">Mật khẩu hiện tại:</label>
                <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
            </div>
            <div class="mb-3">
                <label for="newPassword" class="form-label">Mật khẩu mới:</label>
                <input type="password" class="form-control" id="newPassword" name="newPassword" required>
            </div>
            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Xác nhận mật khẩu mới:</label>
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Cập Nhật Mật Khẩu</button>
        </form>

        <hr>

        <!-- Form đổi email -->
        <form action="${pageContext.request.contextPath}/vendor/updateEmail" method="post">
            <h3>Đổi Email</h3>
            <div class="mb-3">
                <label for="currentEmail" class="form-label">Email hiện tại:</label>
                <input type="email" class="form-control" id="currentEmail" name="currentEmail" value="${vendor.email}" readonly>
            </div>
            <div class="mb-3">
                <label for="newEmail" class="form-label">Email mới:</label>
                <input type="email" class="form-control" id="newEmail" name="newEmail" required>
            </div>
            <div class="mb-3">
                <label for="confirmEmail" class="form-label">Xác nhận email mới:</label>
                <input type="email" class="form-control" id="confirmEmail" name="confirmEmail" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Cập Nhật Email</button>
        </form>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-rjT2F6gf5IYev36+tb6MGyLFBQ0Sz7OVTxCtvFvhBxsBl48f9z7zIuhvzy6Cq07P" 
        crossorigin="anonymous"></script>
</body>
</html>
