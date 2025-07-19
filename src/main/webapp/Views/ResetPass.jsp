<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đặt lại mật khẩu</title>
<!-- Google Fonts -->
<link
    href="https://fonts.googleapis.com/css2?family=Nunito:wght@200;400;600&display=swap"
    rel="stylesheet">
<style>
* {
    box-sizing: border-box;
    font-family: 'Nunito', Arial, sans-serif;
}

body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    background-color: #f9f9f9;
}

.reset-password-container {
    width: 400px;
    padding: 30px;
    background-color: white;
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
}

.reset-password-container h2 {
    text-align: center;
    color: #333;
    margin-bottom: 20px;
    font-weight: 600;
}

.reset-password-container form {
    display: flex;
    flex-direction: column;
}

.reset-password-container label {
    font-size: 16px;
    color: #555;
    margin-bottom: 5px;
}

.reset-password-container input[type="password"] {
    padding: 15px;
    margin: 10px 0;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.reset-password-container button {
    padding: 15px;
    font-size: 16px;
    margin-top: 20px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.reset-password-container button:hover {
    background-color: #0056b3;
}
</style>
</head>
<body>

<div class="reset-password-container">
    <h2>Đặt Lại Mật Khẩu</h2>
    <form action="/resetpassword" method="post">
        <label for="old-password">Mật khẩu cũ *</label>
        <input type="password" id="old-password" name="oldPassword" placeholder="Nhập mật khẩu cũ" required>
        
        <label for="new-password">Mật khẩu mới *</label>
        <input type="password" id="new-password" name="newPassword" placeholder="Nhập mật khẩu mới" required>
        
        <label for="confirm-password">Xác nhận mật khẩu mới *</label>
        <input type="password" id="confirm-password" name="confirmPassword" placeholder="Xác nhận mật khẩu mới" required>

        <button type="submit">Đặt Lại Mật Khẩu</button>
    </form>
</div>

</body>
</html>
