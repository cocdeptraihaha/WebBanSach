<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Commons/taglib.jsp"%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đăng Nhập - VENDOR</title>
<!-- Link Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200..1000;1,200..1000&display=swap"
	rel="stylesheet">
<style>
* {
	box-sizing: border-box;
	font-family: 'Nunito', sans-serif;
}

body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
	background-color: #f3f3f3;
}

.login-container {
	width: 400px;
	padding: 30px;
	background-color: white;
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
	border-radius: 10px;
}

.login-container h2 {
	text-align: center;
	color: #333;
	margin-bottom: 20px;
	font-size: 24px;
}

.login-container form {
	display: flex;
	flex-direction: column;
}

.login-container input[type="text"], .login-container input[type="password"]
	{
	padding: 15px;
	margin: 15px 0;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.login-container label {
	font-size: 16px;
	color: #333;
}

.login-container .actions {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 10px;
}

.login-container .actions a {
	color: #333;
	text-decoration: none;
	font-size: 16px;
}

.login-container .actions a:hover {
	color: #f35e64;
}

.login-container button {
	padding: 15px;
	font-size: 16px;
	margin-top: 20px;
	background-color: #333;
	color: white;
	border: none;
	border-radius: 25px;
	cursor: pointer;
}

.login-container button:hover {
	background-color: #555;
}

.register-link {
	text-align: center;
	margin-top: 20px;
}

.register-link a {
	font-size: 16px;
	color: #f35e64;
	text-decoration: none;
}

.register-link a:hover {
	color: #d03444;
}
</style>
</head>
<body>
	<div class="login-container">
		<h2>VENDOR</h2>

		<%-- Kiểm tra xem có thông báo lỗi hay không --%>
		<c:if test="${alert != null}">
			<h3 class="alert">${alert}</h3>
		</c:if>

		<form action="Login" method="post">
			<label for="username">Tên đăng nhập hoặc email *</label> <input
				type="text" id="username" placeholder="Tên đăng nhập của bạn"
				name="username" required> <label for="password">Mật
				khẩu *</label> <input type="password" id="password"
				placeholder="Mật khẩu của bạn" name="password" required>

			<div class="actions">
				<label><input type="checkbox" checked="checked"
					name="remember"> Ghi nhớ tôi</label> <a href="#">Quên mật khẩu</a>
			</div>

			<button type="submit">Đăng Nhập</button>
		</form>

		<div class="register-link">
			<p>
				Chưa có tài khoản? <a href="${pageContext.request.contextPath}/Vendor/Register">Đăng Ký</a>
			</p>
		</div>
	</div>
</body>
</html>
