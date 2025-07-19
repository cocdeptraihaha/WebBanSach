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
<title>Quản lý Sách</title>
<style>
.container {
	max-width: 800px;
	margin: auto;
	padding: 20px;
}

.table-container {
	max-width: 1200px;
	margin: auto;
	padding: 20px;
}

.btn-add {
	margin-bottom: 15px;
}

.short-description {
	max-width: 250px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.long-description {
	max-width: 400px;
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
	<div class="table-container">
		<h2 class="text-center">Danh Sách Sản Phẩm</h2>

		<!-- Nút Thêm Sách -->
		<div class="text-end">
			<a href="addBook.jsp" class="btn btn-success btn-add">Thêm Sách</a>
		</div>

		<!-- Bảng Danh Sách Sách -->
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>Hình Ảnh</th>
					<th>Tên Sách</th>
					<th>Tác Giả</th>
					<th>Danh Mục</th>
					<th>Giá Niêm Yết</th>
					<th>Tỷ Lệ Giảm Giá (%)</th>
					<th>Giá Bán (Sau Giảm)</th>
					<th>Số Lượng Tồn</th>
					<th>Mô Tả Ngắn</th>
					<th>Mô Tả Dài</th>
					<th>Hành Động</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="book" items="${books}">
					<tr>
						<!-- Hiển thị Hình Ảnh Sách -->
						<td><c:if test="${book.images.substring(0, 5) == 'https'}">
								<img src="${book.images}" alt="${book.bookname}"
									style="height: 100px; width: 80px; object-fit: cover;">
							</c:if> <c:if test="${book.images.substring(0, 5) != 'https'}">
								<img src="/image?fname=${book.images}" alt="${book.bookname}"
									style="height: 100px; width: 80px; object-fit: cover;">
							</c:if></td>

						<!-- Hiển thị thông tin sách -->
						<td>${book.bookname}</td>
						<td>${book.author}</td>
						<td>${book.category}</td>
						<td>${book.listprice}</td>
						<td>${book.discountrate}</td>

						<!-- Tính Giá Bán Sau Giảm Giá -->
						<td><c:out
								value="${book.listprice - (book.listprice * book.discountrate / 100)}" />
						</td>

						<!-- Hiển thị Số Lượng Tồn -->
						<td>${book.quantity}</td>

						<!-- Hiển thị Mô Tả Ngắn -->
						<td class="short-description">${book.shortdescription}</td>

						<!-- Hiển thị Mô Tả Dài -->
						<td class="long-description">${book.longdescription}</td>

						<!-- Hành động Sửa/Xóa và Nhập thêm số lượng -->
						<td><a href="/editBook?id=${book.bookid}"
							class="btn btn-warning btn-sm">Sửa</a> <a
							href="/deleteBook?id=${book.bookid}"
							class="btn btn-danger btn-sm"
							onclick="return confirm('Bạn có chắc chắn muốn xóa sách này?');">Xóa</a>

							<!-- Nút nhập thêm số lượng --> <a
							href="/addInventory?id=${book.bookid}"
							class="btn btn-info btn-sm">Nhập thêm số lượng</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>