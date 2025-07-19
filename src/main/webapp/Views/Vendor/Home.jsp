<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>Thông Tin Tài Khoản và Shop</title>
<style>
.container {
    max-width: 1200px;
    margin: auto;
    padding: 20px;
}
.panel {
    background: #f8f9fa;
    border: 1px solid #ddd;
    padding: 15px;
    border-radius: 10px;
    margin-bottom: 20px;
    width: 100%;
}
.panel a {
    text-decoration: none;
    color: #000;
    display: block;
    padding: 10px;
    border-bottom: 1px solid #ddd;
}
.panel a:hover {
    background-color: #007bff;
    color: #fff;
}
.info {
    background: #f8f9fa;
    border: 1px solid #ddd;
    padding: 15px;
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
    width: 150px;
    height: 150px;
    object-fit: cover;
    border: 2px solid #ddd;
}
.text-center {
    text-align: center;
}
.panel-container {
    max-width: 250px;
    margin-right: 20px;
}
.content-container {
    flex-grow: 1;
}
.row {
    display: flex;
    flex-wrap: nowrap;
}
</style>
</head>
<body>
	<%@ include file="/Views/Vendor/header.jsp"%>
	<div class="container">
		<div class="row">
			<!-- Panel bên trái -->
			<div class="panel-container">
				<div class="panel">
					<h4>Chức năng</h4>
					<a href="viewAccount.jsp">Thông Tin Tài Khoản</a>
					<a href="orderHistory.jsp">Lịch Sử Đơn Hàng</a>
					<a href="wishlist.jsp">Danh Sách Yêu Thích</a>
					<a href="editAccount.jsp">Chỉnh Sửa Thông Tin</a>
					<a href="logout.jsp">Đăng Xuất</a>
				</div>
			</div>

			<!-- Nội dung bên phải -->
			<div class="content-container">
				<div class="info">
					<h3>Chi tiết nội dung sẽ hiển thị ở đây</h3>
					<p>Bạn có thể thêm nội dung chính cho từng trang ở đây.</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>