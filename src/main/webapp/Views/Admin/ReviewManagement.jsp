<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Quản Lí Đánh Giá</title>
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

h2 {
	text-align: center;
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<%@ include file="/Views/Admin/header.jsp"%>
	 <div class="container">
        <h2>Danh Sách Đánh Giá</h2>
        <table class="table table-striped table-hover">
            <thead class="table-dark">
                <tr>
                    <th>ID Sách</th>
                    <th>Đánh Giá</th>
                    <th>Số Sao</th>
                    <th>Tên Người Đánh Giá</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="review" items="${reviews}">
                    <tr>
                        <td>${review.bookId}</td>
                        <td>${review.comment}</td>
                        <td>${review.rating}</td>
                        <td>${review.reviewerName}</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty reviews}">
                    <tr>
                        <td colspan="4" class="text-center">Không có đánh giá nào!</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</body>
</html>
