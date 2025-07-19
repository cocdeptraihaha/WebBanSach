<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Quản lý cửa hàng</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
  <!-- Boxicons -->
  <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet">
  <!-- Custom CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Vendor/css/main.css">
  <script src="http://code.jquery.com/jquery.min.js"></script>
</head>

<body class="app sidebar-mini rtl bg-light">
  <!-- Navbar -->
  <%@ include file="/Vendor/header.jsp"%>
  <!-- Sidebar menu -->
  <%@ include file="/Vendor/sidebar.jsp"%>

  <!-- Main Content -->
  <div class="container mt-5">
    <div class="row g-4">
      <!-- Tổng khách hàng -->
      <div class="col-md-4">
        <div class="card text-white bg-primary shadow">
          <div class="card-body text-center">
            <i class='bx bxs-user-account bx-lg mb-3'></i>
            <h4 class="card-title">Tổng khách hàng</h4>
            <p class="card-text"><b>${userCount} khách hàng</b></p>
            <small class="text-white-50">Tổng số khách hàng được quản lý.</small>
          </div>
        </div>
      </div>

      <!-- Tổng sản phẩm -->
      <div class="col-md-4">
        <div class="card text-white bg-info shadow">
          <div class="card-body text-center">
            <i class='bx bxs-data bx-lg mb-3'></i>
            <h4 class="card-title">Tổng sản phẩm</h4>
            <p class="card-text"><b>${bookCount} sản phẩm</b></p>
            <small class="text-white-50">Tổng số sản phẩm được quản lý.</small>
          </div>
        </div>
      </div>

      <!-- Tổng đơn hàng -->
      <div class="col-md-4">
        <div class="card text-white bg-warning shadow">
          <div class="card-body text-center">
            <i class='bx bxs-shopping-bags bx-lg mb-3'></i>
            <h4 class="card-title">Tổng đơn hàng</h4>
            <p class="card-text"><b>${orderCount} đơn hàng</b></p>
            <small class="text-white-50">Tổng số hóa đơn bán hàng trong tháng.</small>
          </div>
        </div>
      </div>
    </div>

    <!-- Thống kê doanh thu theo tháng -->
    <div class="mt-5">
      <h4 class="text-center">Thống Kê Doanh Thu Theo Tháng</h4>
      <canvas id="revenueChart" width="400" height="200"></canvas>
    </div>
  </div>

  <!-- Chart.js -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script>
    const monthlyLabels = ${monthlyLabels}; 
    const monthlyData = ${monthlyData};     

    // Create Chart.js Bar Chart
    const ctx = document.getElementById('revenueChart').getContext('2d');
    const revenueChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: monthlyLabels,
        datasets: [{
          label: 'Doanh Thu (VNĐ)',
          data: monthlyData,
          backgroundColor: 'rgba(54, 162, 235, 0.6)',
          borderColor: 'rgba(54, 162, 235, 1)',
          borderWidth: 1
        }]
      },
      options: {
        responsive: true,
        plugins: {
          legend: {
            position: 'top',
          },
          title: {
            display: true,
            text: 'Doanh Thu Theo Tháng'
          }
        },
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
  </script>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
