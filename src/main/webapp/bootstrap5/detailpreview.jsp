<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết đơn hàng</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f9f9f9;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
        }
        th, td {
            text-align: center;
            padding: 12px;
        }
        th {
            background-color: #4CAF50;
            color: white;
            border: 1px solid #ddd;
        }
        td {
            border: 1px solid #ddd;
            background-color: #f4f4f4;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #ddd;
        }
        a {
            text-decoration: none;
            color: #4CAF50;
            font-size: 16px;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Chi tiết đơn hàng</h1>
    <table>
        <thead>
            <tr>
                <th>Tên sách</th>
                <th>Số lượng</th>
                <th>Tổng tiền (VND)</th>
            </tr>
        </thead>
        <tbody>
            <!-- Duyệt qua danh sách chi tiết đơn hàng -->
            <c:forEach var="orderDetail" items="${list}">
                <tr>
                    <td>${orderDetail.title}</td>
                    <td>${orderDetail.quantity}</td>
                    <td>${orderDetail.total}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br/>
    <a href="javascript:history.back()">Quay lại</a>
</body>
</html>
