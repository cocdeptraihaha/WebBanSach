<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đăng Ký - VENDOR</title>
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

.register-container {
	width: 400px;
	padding: 30px;
	background-color: white;
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
	border-radius: 10px;
}

.register-container h2 {
	text-align: center;
	color: #333;
	margin-bottom: 20px;
	font-size: 24px;
}

.register-container form {
	display: flex;
	flex-direction: column;
}

.register-container input[type="email"], .register-container input[type="text"],
	.register-container input[type="password"] {
	padding: 15px;
	margin: 15px 0;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.register-container label {
	font-size: 16px;
	color: #333;
}

.register-container .actions {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 10px;
}

.register-container button {
	padding: 15px;
	font-size: 16px;
	margin-top: 20px;
	background-color: #333;
	color: white;
	border: none;
	border-radius: 25px;
	cursor: pointer;
}

.register-container button:hover {
	background-color: #555;
}

.login-link {
	text-align: center;
	margin-top: 20px;
}

.login-link a {
	font-size: 16px;
	color: #f35e64;
	text-decoration: none;
}

.login-link a:hover {
	color: #d03444;
}

.error {
    color: red;
    font-size: 14px;
    margin-top: -10px;
    margin-bottom: 10px;
}
</style>

<script>
    function validatePasswords(event) {
        const newPassword = document.getElementById("password").value;
        const confirmPassword = document.getElementById("confirm-password").value;
        const errorElement = document.getElementById("error-message");

        if (newPassword !== confirmPassword) {
            event.preventDefault(); // Ngăn gửi form nếu mật khẩu không khớp
            errorElement.textContent = "Mật khẩu xác nhận không khớp. Vui lòng thử lại!";
        } else {
            errorElement.textContent = ""; // Xóa thông báo lỗi nếu mật khẩu khớp
        }
    }
</script>

</head>
<body>

	<div class="register-container">
		<h2>Đăng Ký</h2>
		<h3>VENDOR</h3>
		<form onsubmit="validatePasswords(event)">
			<label for="email">Email *</label> 
			<input type="email" id="email" placeholder="Email của bạn" required> 
			
			<label for="username">Tên đăng nhập *</label> 
			<input type="text" id="username" placeholder="Tên đăng nhập của bạn" required> 
			
			<label for="password">Mật khẩu *</label> 
			<input type="password" id="password" placeholder="Mật khẩu của bạn" required>
			
			<label for="confirm-password">Xác nhận mật khẩu *</label> 
			<input type="password" id="confirm-password" placeholder="Nhập lại mật khẩu" name="confirm_password" required>
			
			<!-- Hiển thị thông báo lỗi -->
			<p id="error-message" class="error"></p>

			<button type="submit">Đăng Ký</button>
		</form>

		<div class="login-link">
			<p>
				Đã có tài khoản? <a href="Login.jsp">Đăng Nhập</a>
			</p>
		</div>
	</div>

</body>
</html>
