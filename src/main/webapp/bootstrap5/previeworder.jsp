<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách đơn hàng</title>
    <style>
        /* Đảm bảo bảng co giãn vừa màn hình */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        h1 {
            text-align: center;
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        /* Điều chỉnh cột để tự động co giãn */
        td, th {
            word-wrap: break-word;
            overflow-wrap: break-word;
            text-overflow: ellipsis;
        }

        /* Đảm bảo bảng không bị tràn ra ngoài */
        .container {
            max-width: 100%;
            overflow-x: auto;
            padding: 0 10px;
        }
    </style>
</head>
<body>
    <h1>Danh sách đơn hàng</h1>
    <div class="container">
        <table>
            <thead>
                <tr>
                	<th>Ngày đặt</th>
                    <th>Ghi chú</th>
                    <th>Tiền sản phẩm</th>
                    <th>Phí vận chuyển</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td>${order.date}</td>
                        <td>${order.notes}</td>
                        <td>${order.subtotal}</td>
                        <td>${order.ship}</td>
                        <td>${order.status}</td>
                        <td><a href="${pageContext.request.contextPath}/User/DetailOrder?id=${order.id}">👁️</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
