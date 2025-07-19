<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="vi">
<head>
    <style>
        #header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
            background-color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        body {
            padding-top: 120px;
        }
    </style>
</head>
<body>
    <header id="header" class="site-header">
        <!-- Top Information Bar -->
        <div class="top-info border-bottom d-none d-md-block">
            <div class="container-fluid">
                <div class="row g-0">
                    <div class="col-md-4">
                        <p class="fs-6 my-2 text-center">
                            CẦN HỖ TRỢ? LIÊN HỆ CHÚNG TÔI: 
                            <a href="https://zalo.me/g/ufqosa391" target="_blank">ZALO</a>
                        </p>
                    </div>
                    <div class="col-md-4 border-start border-end">
                        <p class="fs-6 my-2 text-center">
                            Kỷ niệm ngày thành lập Quân Đội Nhân Dân Việt Nam (22/12/2024),
                            giảm sốc 30%! <a class="text-decoration-underline" href="shop.jsp">Mua ngay</a>
                        </p>
                    </div>
                    <div class="col-md-4">
                        <p class="fs-6 my-2 text-center">2-3 ngày vận chuyển và đổi trả chậm nhất 15 ngày</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Navigation Bar -->
        <nav id="header-nav" class="navbar navbar-expand-lg py-3">
            <div class="container">
                <!-- Logo -->
                <a class="navbar-brand" href="index.jsp">
                    <img src="${pageContext.request.contextPath}/bootstrap5/images/main-logo-1.png" class="logo">
                </a>

                <!-- Mobile Navbar Toggle -->
                <button class="navbar-toggler d-flex d-lg-none order-3 p-2" type="button" data-bs-toggle="offcanvas" 
                    data-bs-target="#bdNavbar" aria-controls="bdNavbar" aria-expanded="false" aria-label="Toggle navigation">
                    <svg class="navbar-icon">
                        <use xlink:href="#navbar-icon"></use>
                    </svg>
                </button>

                <!-- Offcanvas for Mobile Menu -->
                <div class="offcanvas offcanvas-end" tabindex="-1" id="bdNavbar" aria-labelledby="bdNavbarOffcanvasLabel">
                    <div class="offcanvas-header px-4 pb-0">
                        <a class="navbar-brand" href="index.jsp">
                            <img src="${pageContext.request.contextPath}/bootstrap5/images/main-logo-1.png" class="logo">
                        </a>
                        <button type="button" class="btn-close btn-close-black" data-bs-dismiss="offcanvas" aria-label="Close" data-bs-target="#bdNavbar"></button>
                    </div>
                    <div class="offcanvas-body">
                        <!-- Navigation Links -->
                        <ul id="navbar" class="navbar-nav text-uppercase justify-content-start justify-content-lg-center align-items-start align-items-lg-center flex-grow-1">
                            <li class="nav-item"><a class="nav-link me-4" href="${pageContext.request.contextPath}/User/Home">TRANG CHỦ</a></li>
                            <li class="nav-item"><a class="nav-link me-4" href="${pageContext.request.contextPath}/User/Books">KỆ SÁCH</a></li>
                            <li class="nav-item"><a class="nav-link me-4" href="${pageContext.request.contextPath}/User/ListOrder">THEO DÕI ĐƠN HÀNG</a></li>
                            <li class="nav-item"><a class="nav-link me-4" href="${pageContext.request.contextPath}/bootstrap5/blog.jsp">BẢN TIN</a></li>
                            <li class="nav-item"><a class="nav-link me-4" href="${pageContext.request.contextPath}/bootstrap5/contact.jsp">LIÊN HỆ</a></li>
                        </ul>

                        <!-- User Items (Login, Cart, and Account) -->
						<div class="user-items d-flex">
						    <ul class="d-flex justify-content-end list-unstyled mb-0">
						        <!-- Username and Logout -->
						        <li class="username-label pe-3">
						            <span>
						                <% if (session.getAttribute("username") != null) { %>
						                    <a href="/PROJECT/User/Account" class="fw-bold">
						                        <%= session.getAttribute("username") %>
						                    </a>
						                    |
						                    <a href="${pageContext.request.contextPath}/User/Logout" class="text-danger" style="font-size: 0.9em;">
						                        Đăng xuất
						                    </a>
						                <% } else { %>
						                    <a href="/PROJECT/User/Login">Login</a>
						                <% } %>
						            </span>
						        </li>
						
						        <!-- Shopping Cart -->
						        <li class="cart-item">
						            <a href="${pageContext.request.contextPath}/User/ListCart">
						                <svg class="cart">
						                    <use xlink:href="#cart"></use>
						                </svg>
						                <span class="fs-6 fw-light"></span>
						            </a>
						        </li>
						    </ul>
						</div>
                    </div>
                </div>
            </div>
        </nav>
    </header>
</body>
</html>
