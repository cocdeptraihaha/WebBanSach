<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>Danh sách đơn hàng</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Main CSS-->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Vendor/css/main.css">
  <link rel="stylesheet" type="text/css" href="css/main.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
  <!-- or -->
  <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

  <!-- Font-icon css-->
  <link rel="stylesheet" type="text/css"
    href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<script>
    $(document).ready(function() {
     
    // Cấu hình các nhãn phân trang
    $('#sampleTable').dataTable( {
        "language": {
        "sProcessing":   "Đang xử lý...",
        "sLengthMenu":   "Xem _MENU_ mục",
        "sZeroRecords":  "Không tìm thấy dòng nào phù hợp",
        "sInfo":         "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
        "sInfoEmpty":    "Đang xem 0 đến 0 trong tổng số 0 mục",
        "sInfoFiltered": "(được lọc từ _MAX_ mục)",
        "sInfoPostFix":  "",
        "sSearch":       "Tìm:",
        "sUrl":          "",
        "oPaginate": {
            "sFirst":    "Đầu",
            "sPrevious": "Trước",
            "sNext":     "Tiếp",
            "sLast":     "Cuối"
            }
        }
    } );
         
    } ); 
  </script> 
</head>

<body onload="time()" class="app sidebar-mini rtl">
  <!-- Navbar-->
    <%@ include file="/Vendor/header.jsp"%>
  <!-- Sidebar menu-->
  <%@ include file="/Vendor/sidebar.jsp"%>
    <main class="app-content">
      <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
          <li class="breadcrumb-item active"><b>Danh sách đơn hàng</b></a></li>
        </ul>
        <div id="clock"></div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">
              <table class="table table-hover table-bordered" id="sampleTable">
                <thead>
  <tr>
    <th style="text-align: center;">ID đơn hàng</th>
    <th style="text-align: center;">Tên khách hàng</th>
    <th style="text-align: center;">Địa chỉ</th>
    <th style="text-align: center;">Số điện thoại</th>
    <th style="text-align: center;">Email</th>
    <th style="text-align: center;">Lưu ý</th>
    <th style="text-align: center;">Tiền sách</th>
    <th style="text-align: center;">Vận chuyển</th>
    <th style="text-align: center;">Phương thức vận chuyển</th>
    <th style="text-align: center;">Phương thức thanh toán</th>
    <th style="text-align: center;">Ngày tạo</th>
    <th style="text-align: center;">Trạng thái</th>
  </tr>
</thead>
<tbody>
  <c:forEach var="order" items="${orders}">
    <tr>
      <td style="text-align: center;">${order.id}</td>
      <td style="text-align: center;">${order.namecustomer}</td>
      <td style="text-align: center;">${order.address}</td>
      <td style="text-align: center;">${order.phone}</td>
      <td style="text-align: center;">${order.email}</td>
      <td style="text-align: center;">${order.notes}</td>
      <td style="text-align: center;">${order.subtotal}</td>
      <td style="text-align: center;">${order.ship}</td>
      <td style="text-align: center;">${order.methodship}</td>
      <td style="text-align: center;">${order.methodpay}</td>
      <td style="text-align: center;">${order.date}</td>
      <td style="text-align: center;">
    <form action="${pageContext.request.contextPath}/Vendor/Orders/StatusChange" method="post">
        <input type="hidden" name="id" value="${order.id}">
        <select name="status" class="form-control" style="width: auto; display: inline;">
            <option value="Chờ xử lí" ${order.status == 'Chờ xử lí' ? 'selected' : ''}>Chờ xử lí</option>
            <option value="Đang giao" ${order.status == 'Đang giao' ? 'selected' : ''}>Đang giao</option>
            <option value="Đã hoàn thành" ${order.status == 'Đã hoàn thành' ? 'selected' : ''}>Đã hoàn thành</option>
            <option value="Đã hủy" ${order.status == 'Đã hủy' ? 'selected' : ''}>Đã hủy</option>
        </select>
        <button type="submit" class="btn btn-primary btn-sm">Cập nhật</button>
    </form>
	</td>
    </tr>
  </c:forEach>
</tbody>

              </table>
            </div>
          </div>
        </div>
      </div>
    </main>
  <!-- Essential javascripts for application to work-->
  <script src="js/jquery-3.2.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="src/jquery.table2excel.js"></script>
  <script src="js/main.js"></script>
  <!-- The javascript plugin to display page loading on top-->
  <script src="js/plugins/pace.min.js"></script>
  <!-- Page specific javascripts-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
  <!-- Data table plugin-->
  <script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
  <script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
    
   
</body>

</html>