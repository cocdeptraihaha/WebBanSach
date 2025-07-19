<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Quản Lí Người Bán</title>
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
        <h2>Danh Sách Người Bán</h2>
        <table class="table table-striped table-hover">
            <thead class="table-dark">
                <tr>
                    <th>Tài Khoản</th>
                    <th>Avatar</th>
                    <th>Tên Người Bán</th>
                    <th>Ngày Sinh</th>
                    <th>Số Điện Thoại</th>
                    <th>Địa Chỉ</th>
                    <th>Hành Động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="vendor" items="${vendors}">
                    <tr>
                        <td>${vendor.username}</td>
                        <td>
                            <img src="${vendor.avatar}" alt="Avatar" style="width: 50px; height: 50px; border-radius: 50%;">
                        </td>
                        <td>${vendor.fullname}</td>
                        <td>${vendor.dateofbirth}</td>
                        <td>${vendor.phonenumber}</td>
                        <td>${vendor.address}</td>
                        <td>
                            <form action="deleteVendor" method="post" style="display:inline;">
                                <input type="hidden" name="username" value="${vendor.username}">
                                <button type="submit" class="btn btn-danger btn-sm">Xóa</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty vendors}">
                    <tr>
                        <td colspan="7" class="text-center">Không có người bán nào!</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</body>
</html>
