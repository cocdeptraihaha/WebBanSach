<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="vi">

<head>
</head>

<body>
    <!-- Header -->
    <header id="header">
        <!-- Top Info -->
        <div class="top-info d-none d-md-block">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-4 text-center">
                        <p>
                            CẦN HỖ TRỢ? GỌI CHÚNG TÔI: <a href="tel:0356146325">0356146325</a> 
                            hoặc <a href="https://zalo.me/g/ufqosa391" target="_blank">Zalo</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Navigation -->
        <nav id="header-nav" class="navbar navbar-expand-lg">
            <div class="container">
                <!-- Brand Logo -->
                <a class="navbar-brand" href="index.jsp">
                    <img src="${pageContext.request.contextPath}/bootstrap5/images/main-logo-1.png" alt="Logo">
                </a>

                <!-- Toggle Button -->
                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#bdNavbar"
                    aria-controls="bdNavbar" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Offcanvas Menu -->
                <div class="offcanvas offcanvas-end" tabindex="-1" id="bdNavbar" aria-labelledby="bdNavbarOffcanvasLabel">
                    <div class="offcanvas-header">
                        <a class="navbar-brand" href="index.jsp">
                            <img src="${pageContext.request.contextPath}/bootstrap5/images/main-logo-1.png" alt="Logo">
                        </a>
                        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>

                    <div class="offcanvas-body">
                        <!-- Navigation Links -->
                        <ul class="navbar-nav me-auto">
                            <li class="nav-item"><a class="nav-link" href="Home.jsp">TRANG CHỦ</a></li>
                            <li class="nav-item"><a class="nav-link" href="UserManagement.jsp">QUẢN LÍ NGƯỜI DÙNG</a></li>
                            <li class="nav-item"><a class="nav-link" href="VendorManagement.jsp">QUẢN LÍ NGƯỜI BÁN</a></li>
                            <li class="nav-item"><a class="nav-link" href="ReviewManagement.jsp">QUẢN LÍ ĐÁNH GIÁ</a></li>
                            <li class="nav-item"><a class="nav-link" href="Login.jsp">ĐĂNG XUẤT</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
    </header>
</body>

</html>
