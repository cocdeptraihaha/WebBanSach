<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>Thêm sản phẩm </title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Main CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Vendor/css/main.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
  <script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
</head>

<body class="app sidebar-mini rtl">
  <!-- Navbar -->
  <%@ include file="/Vendor/header.jsp"%>
  <!-- Sidebar menu -->
  <%@ include file="/Vendor/sidebar.jsp"%>

  <main class="app-content">
    <div class="app-title">
      <h4>${message}</h4>
      <ul class="app-breadcrumb breadcrumb">
        <li class="breadcrumb-item">Danh sách sản phẩm</li>
      </ul>
    </div>
    <div class="row">
      <div class="col-md-12">
        <div class="tile">
          <h3 class="tile-title">Tạo mới sản phẩm</h3>
          <div class="tile-body">
            <!-- Form chính -->
            <form id="productForm" action="${pageContext.request.contextPath}/Vendor/Book/Insert" method="post" enctype="multipart/form-data">
              <div class="row">
                <!-- Tên sách -->
                <div class="form-group col-md-4">
                  <label class="control-label">Tên sách</label>
                  <input class="form-control" type="text" name="title" required>
                </div>

                <!-- Tác giả -->
                <div class="form-group col-md-4">
                  <label class="control-label">Tác giả</label>
                  <input class="form-control" type="text" name="author" required>
                </div>

                <!-- Ảnh sản phẩm -->
                <div class="form-group col-md-12">
    <label class="control-label">Ảnh sản phẩm</label>
    <div id="myfileupload">
        <input type="file" id="uploadfile" name="image_file" onchange="readURL(this);" />
    </div>
    <div id="thumbbox">
        <img height="450" width="400" alt="Thumb image" id="thumbimage" style="display: none" />
        <a class="removeimg" href="javascript:"></a>
    </div>
    <div id="boxchoice">
        <a href="javascript:" class="Choicefile"><i class="fas fa-cloud-upload-alt"></i> Chọn ảnh</a>
        <p style="clear:both" id="image_url"></p>
    </div>

    <!-- Thêm trường nhập URL -->
    <div class="form-group">
        <label class="control-label">Hoặc nhập đường link ảnh</label>
        <input class="form-control" type="text" name="image_link" placeholder="https://example.com/image.jpg">
    </div>
</div>


                <!-- Giảm giá -->
                <div class="form-group col-md-4">
                  <label class="control-label">Giảm giá (%)</label>
                  <input class="form-control" type="number" name="discount_percentage" min="-100" max="0">
                </div>

                <!-- Số lượng -->
                <div class="form-group col-md-4">
                  <label class="control-label">Số lượng</label>
                  <input class="form-control" type="number" name="stock" required>
                </div>

                <!-- Danh mục -->
                <div class="form-group col-md-4">
                  <label class="control-label">Danh mục</label>
                  <select class="form-control" name="category" required>
                    <option value="">-- Chọn danh mục --</option>
                    <option value="Tủ sách Bác Hồ">Tủ sách Bác Hồ</option>
                    <option value="Tủ sách nhân vật">Tủ sách nhân vật</option>
                    <option value="Tủ sách luật">Tủ sách luật</option>
                    <option value="Tủ sách giáo trình và tài liệu">Tủ sách giáo trình và tài liệu</option>
                  </select>
                </div>

                <!-- Giá -->
                <div class="form-group col-md-4">
                  <label class="control-label">Giá</label>
                  <input class="form-control" type="text" name="price" required>
                </div>

                <!-- Mô tả -->
                <div class="form-group col-md-12">
                  <label class="control-label">Mô tả</label>
                  <textarea class="form-control" name="long_description" id="long_description"></textarea>
                  <script>CKEDITOR.replace('long_description');</script>
                </div>
              </div>

              <!-- Nút hành động -->
              <div class="form-actions">
                <button class="btn btn-primary" type="submit">Lưu lại</button>
                <a class="btn btn-secondary" href="table-data-product.jsp">Hủy bỏ</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </main>
</body>

<script>
  function readURL(input) {
    if (input.files && input.files[0]) {
      const reader = new FileReader();
      reader.onload = function (e) {
        $('#thumbimage').attr('src', e.target.result).show();
      };
      reader.readAsDataURL(input.files[0]);
    }
  }
</script>

</html>
