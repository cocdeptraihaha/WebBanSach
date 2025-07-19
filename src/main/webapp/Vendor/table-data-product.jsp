<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/Commons/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Danh sách sản phẩm</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- CSS files -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Vendor/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    
</head>

<body onload="time()" class="app sidebar-mini rtl">
    <%@ include file="/Vendor/header.jsp" %>
    <%@ include file="/Vendor/sidebar.jsp" %>

    <main class="app-content">
        <div class="app-title">
            <ul class="app-breadcrumb breadcrumb side">
                <li class="breadcrumb-item active"><b>Danh sách sản phẩm</b></a></li>
            </ul>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="tile">
                    <div class="tile-body">
                        <div class="row element-button">
                            <div class="col-sm-2">
                                <a class="btn btn-add btn-sm" href="${pageContext.request.contextPath}/Vendor/Book/Insert" title="Thêm">
                                    <i class="fas fa-plus"></i> Tạo mới sản phẩm
                                </a>
                            </div>
                        </div>

                        <table class="table table-hover table-bordered" id="sampleTable">
                            <thead>
                                <tr>
                                    <th style="text-align: center;">Mã sách</th>
                                    <th style="text-align: center;">Tên sách</th>
                                    <th style="text-align: center;">Tác giả</th>
                                    <th style="text-align: center;">Ảnh</th>
                                    <th style="text-align: center;">Giảm giá</th>
                                    <th style="text-align: center;">Số lượng</th>
                                    <th style="text-align: center;">Danh mục</th>
                                    <th style="text-align: center;">Giá</th>
                                    <th style="display: none;">Mô tả</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach var="book" items="${books}">
                                    <tr>
                                        <td style="text-align: justify;">${book.id}</td>
                                        <td style="text-align: justify;">${book.title}</td>
                                        <td style="text-align: justify;">${book.author}</td>
										   
										  <td>
												<c:if test="${book.imageUrl.substring(0, 5)=='https' }">
													<c:url value="${book.imageUrl}" var="imgUrl"></c:url>
												</c:if>
									
												<c:if test="${book.imageUrl.substring(0, 5)!='https' }">
													<c:url value="${book.imageUrl}" var="imgUrl" />
												</c:if>
											<img src="${imgUrl}" alt="Book Image" style="width:100px; height:100px;">
											</td>
                                        
                                        <td style="text-align: justify;"> ${book.discountPercentage}%</td>
                                        <td style="text-align: justify;">${book.stock}</td>
                                        <td style="text-align: justify;">${book.category}</td>
                                        <td style="text-align: justify;">${book.price}đ</td>
                                        <td style="display: none;">${book.long_description}</td>
                                        <td style="text-align: center;">
                                            <form
												action="${pageContext.request.contextPath}/Vendor/Book/Delete"
												method="post">
												<input type="hidden" name="id" value="${book.id}" />

												<button class="btn btn-danger btn-sm trash" type="submit"
													title="Xóa">
													<i class="fas fa-trash-alt"></i>
												</button>
											</form>
											<button class="btn btn-primary btn-sm edit" type="button"
												title="Sửa" id="show-emp"
												onclick="window.location.href='${pageContext.request.contextPath}/Vendor/Book/Update?id=${book.id}'">
												<i class="fas fa-edit"></i>
											</button>
                                            <button class="btn btn-sm view" type="button" title="Xem chi tiết" onclick="viewDetails(this)" style="background-color: #28a745; color: white;">
                                                <i class="fas fa-eye"></i>
                                            </button> 
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

    <!-- Modal Chi tiết -->
    <div class="modal fade" id="viewDetailsModal" tabindex="-1" aria-labelledby="viewDetailsModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="viewDetailsModalLabel">Chi tiết sách</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="bookDescription">
                    <!-- Nội dung mô tả sẽ hiển thị ở đây -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function viewDetails(button) {
            const row = button.closest('tr'); // Lấy dòng chứa nút
            const description = row.querySelector('td:nth-child(9)').innerText.trim(); // Lấy mô tả

            document.getElementById('bookDescription').innerText = description; // Hiển thị mô tả
            const modal = new bootstrap.Modal(document.getElementById('viewDetailsModal'), {});
            modal.show(); // Hiển thị modal
        }
    </script>

</body>

</html>
