<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Commons/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông báo</title>
<style>
    .btn {
        display: inline-block;
        padding: 10px 15px;
        font-size: 14px;
        color: white;
        background-color: #007bff;
        text-decoration: none;
        border-radius: 5px;
    }
    .btn:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
	<c:if test="${alert != null}">
		<h3 class="alert">${alert}</h3>
	</c:if>
	
	<a href="${pageContext.request.contextPath}/User/Login" class="btn">Quay lại</a>
</body>
</html>
