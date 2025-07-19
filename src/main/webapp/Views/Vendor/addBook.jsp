<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thêm Sách Mới</title>
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
	background: #f8f9fa;
	border: 1px solid #ddd;
	border-radius: 10px;
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

h2 {
	text-align: center;
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<%@ include file="/Views/Vendor/header.jsp"%>
	<div class="container">
		<h2>Thêm Sách Mới</h2>
		<form action="${pageContext.request.contextPath}/addBook"
			method="post" enctype="multipart/form-data">
			<!-- Tên sách -->
			<div class="mb-3">
				<label for="bookname" class="form-label">Tên sách:</label> <input
					type="text" class="form-control" id="bookname" name="bookname"
					required>
			</div>

			<!-- Loại sách -->
			<div class="mb-3">
				<label for="booktype" class="form-label">Loại sách:</label> <input
					type="text" class="form-control" id="booktype" name="booktype">
			</div>

			<!-- Thể loại -->
			<div class="mb-3">
				<label for="genre" class="form-label">Thể loại:</label> <input
					type="text" class="form-control" id="genre" name="genre">
			</div>

			<!-- Mô tả ngắn -->
			<div class="mb-3">
				<label for="shortdescription" class="form-label">Mô tả ngắn:</label>
				<textarea class="form-control" id="shortdescription"
					name="shortdescription" rows="3"></textarea>
			</div>

			<!-- Mô tả chi tiết -->
			<div class="mb-3">
				<label for="longdescription" class="form-label">Mô tả chi
					tiết:</label>
				<textarea class="form-control" id="longdescription"
					name="longdescription" rows="5"></textarea>
			</div>

			<!-- Chọn ảnh (từ máy tính hoặc URL) -->
			<div class="mb-3">
				<label for="image" class="form-label">Hình ảnh:</label>
				<div>
					<!-- Tải ảnh từ máy tính -->
					<input type="file" class="form-control" id="imageFile"
						name="imageFile" accept="image/*">
				</div>
				<div class="mt-2">
					<!-- Hoặc nhập URL ảnh -->
					<input type="url" class="form-control" id="imageUrl"
						name="imageUrl" placeholder="Hoặc nhập URL ảnh">
				</div>
			</div>

			<!-- Giá niêm yết -->
			<div class="mb-3">
				<label for="listprice" class="form-label">Giá niêm yết:</label> <input
					type="number" class="form-control" id="listprice" name="listprice"
					step="0.01" min="0">
			</div>

			<!-- Tỷ lệ giảm giá -->
			<div class="mb-3">
				<label for="discountrate" class="form-label">Tỷ lệ giảm giá
					(%):</label> <input type="number" class="form-control" id="discountrate"
					name="discountrate" min="0" max="100">
			</div>

			<!-- Số lượng nhập kho -->
			<div class="mb-3">
				<label for="quantityimported" class="form-label">Số lượng
					nhập kho:</label> <input type="number" class="form-control"
					id="quantityimported" name="quantityimported" min="0">
			</div>

			<!-- Lấy mã shop từ session (nếu có) -->
			<input type="hidden" name="shopid" value="${sessionScope.shopid}">

			<!-- Nút thêm sách -->
			<button type="submit" class="btn-add">Thêm
				Sách</button>
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-rjT2F6gf5IYev36+tb6MGyLFBQ0Sz7OVTxCtvFvhBxsBl48f9z7zIuhvzy6Cq07P"
		crossorigin="anonymous"></script>
</body>
</html>
