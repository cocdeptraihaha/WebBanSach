<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Commons/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>${book.title}</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="author" content="">
<meta name="keywords" content="">
<meta name="description" content="">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap5/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200..1000;1,200..1000&display=swap" rel="stylesheet">
</head>
<body>
	
	<%@ include file="/bootstrap5/svg.jsp" %>

	<%@ include file="/bootstrap5/header.jsp"%>

	<div class="search-popup">
		<div class="search-popup-container">

			<form role="search" method="get" class="search-form" action="">
				<input type="search" id="search-form" class="search-field"
					placeholder="Type and press enter" value="" name="s" />
				<button type="submit" class="search-submit">
					<svg class="search">
						<use xlink:href="#search"></use></svg>
				</button>
			</form>
		</div>
	</div>

	<section class="single-product padding-large">
	  <div class="container">
	    <div class="row">
	      <!-- Product Image Section -->
	      <div class="col-lg-6">
	        <div class="d-flex justify-content-center product-preview">
	          <c:choose>
	            <c:when test="${book.imageUrl.substring(0, 5) == 'https'}">
	              <c:url value="${book.imageUrl}" var="imgUrl" />
	            </c:when>
	            <c:otherwise>
	              <c:url value="/image?fname=${book.imageUrl}" var="imgUrl" />
	            </c:otherwise>
	          </c:choose>
	          <img height="200" width="300" src="${imgUrl}" class="img-fluid shadow-sm" alt="${book.title}">
	        </div>
	      </div>
	
	      <!-- Product Info Section -->
	      <div class="col-lg-6 d-flex flex-column justify-content-center">
	        <div class="product-info ps-lg-5 pt-3 pt-lg-0">
	          <div class="element-header">
	            <h1 class="product-title fs-4" style="text-align: justify;">${book.title}</h1>
	            <div class="product-price d-flex align-items-center mt-2">
	              <span class="fs-2 fw-light text-primary me-2">${discountedPrice}đ</span>
	              <c:if test="${discountedPrice != price}">
	                <del>${price}đ</del>
	              </c:if>
	            </div>
	
	            <div class="rating text-warning d-flex align-items-center mb-2">
	              <c:forEach var="i" begin="1" end="${book.rating}">
	                <svg class="star star-fill">
	                  <use xlink:href="#star-fill"></use>
	                </svg>
	              </c:forEach>
	            </div>
	          </div>
	          <p class="fs-6">Tác giả: ${book.author}</p>
	          <hr>
	          <div class="product-quantity my-3">
	            <div class="item-title">
	              <l>Còn ${book.stock} sản phẩm </l>
	            </div>
	            <form method="post" action="${pageContext.request.contextPath}/User/ActionHandler">
				    <div class="d-flex align-items-center mt-3">
				        <!-- Input số lượng mua -->
				        <label for="quantity" class="me-3" style="font-size: 20px;">Số lượng:</label>
				        <input type="number" id="quantity" name="quantity" value="1" min="1" max="${book.stock}" class="form-control w-auto" style="font-size: 12px;">
				        
				        <!-- Gửi thông tin sản phẩm -->
				        <input type="hidden" name="bookId" value="${book.id}">
				    </div>
				    <div class="action-buttons my-3 d-flex flex-wrap gap-3">
				        <!-- Nút Mua ngay -->
				        <button type="submit" name="action" value="buyNow" class="btn btn-primary">Mua ngay</button>
				        <!-- Nút Thêm vào giỏ hàng -->
				        <button type="submit" name="action" value="addToCart" class="btn btn-dark">Thêm vào giỏ hàng</button>
				    </div>
				</form>
	          </div>
	        </div>
	        <hr>
	
	        <!-- Product Category Section -->
	        <div class="meta-item d-flex mb-1">
	          <span class="fw-medium me-2">Danh mục:</span>
	          <ul class="select-list list-unstyled d-flex mb-0">
	            <li class="select-item"><a href="#">${book.category}</a></li>
	          </ul>
	        </div>
	      </div>
	    </div>
	  </div>
	</section>

	

	<section class="product-tabs">
	  <div class="container">
	    <div class="row">
	      <div class="tabs-listing">
	        <!-- Tabs Navigation -->
	        <nav>
	          <div class="nav nav-tabs d-flex justify-content-center py-3" id="nav-tab" role="tablist">
	            <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">
	              Mô tả
	            </button>
	            <button class="nav-link" id="nav-review-tab" data-bs-toggle="tab" data-bs-target="#nav-review" type="button" role="tab" aria-controls="nav-review" aria-selected="false">
	              Đánh giá
	            </button>
	          </div>
	        </nav>
	
	        <!-- Tabs Content -->
	        <div class="tab-content border-bottom py-4" id="nav-tabContent">
	          <!-- Tab: Mô tả -->
	          <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
	            <p style="text-align: justify;">${book.long_description}</p>
	          </div>
	
	          <!-- Tab: Đánh giá -->
	          <div class="tab-pane fade" id="nav-review" role="tabpanel" aria-labelledby="nav-review-tab">
	            <div class="review-box review-style d-flex gap-3 flex-column">
	              <c:choose>
	                <c:when test="${not empty reviews}">
	                  <c:forEach var="review" items="${reviews}">
	                    <div class="review-item d-flex align-items-start gap-3 border-bottom py-3">
	                      <div class="review-content">
	                        <div class="rating text-primary mb-1">
	                          <c:forEach begin="1" end="${review.stars}" var="star">
	                            <svg class="star star-fill">
	                              <use xlink:href="#star-fill"></use>
	                            </svg>
	                          </c:forEach>
	                          <c:forEach begin="${review.stars + 1}" end="5" var="star">
	                            <svg class="star">
	                              <use xlink:href="#star-empty"></use>
	                            </svg>
	                          </c:forEach>
	                        </div>
	                        <div class="review-header mb-1">
	                          <span class="author-name fw-medium">${review.username}</span>
	                          <span class="review-date text-muted"> - <fmt:formatDate value="${review.date}" pattern="dd/MM/yyyy" /></span>
	                        </div>
	                        <p>${review.description_review}</p>
	                      </div>
	                    </div>
	                  </c:forEach>
	                </c:when>
	                <c:otherwise>
	                  <p class="text-center no-reviews">Không có đánh giá nào.</p>
	                </c:otherwise>
	              </c:choose>
	
	              <!-- Thêm đánh giá -->
	              <div class="add-review mt-4">
	                <h5>Thêm đánh giá</h5>
	                <form id="form" class="d-flex flex-column gap-3">
	                  <textarea placeholder="Đánh giá của bạn" class="form-control" rows="3"></textarea>
	                  <input type="file" class="form-control py-2" />
	                  <button type="submit" name="submit" class="btn btn-primary align-self-start">Gửi đánh giá</button>
	                </form>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</section>



	<section id="related-items" class="position-relative padding-large ">
		<div class="container">
			<div
				class="section-title d-md-flex justify-content-between align-items-center mb-4">
				<h3 class="d-flex align-items-center">Related Items</h3>
				<a href="shop.jsp" class="btn">View All</a>
			</div>
			<div
				class="position-absolute top-50 end-0 pe-0 pe-xxl-5 me-0 me-xxl-5 swiper-next product-slider-button-next">
				<svg
					class="chevron-forward-circle d-flex justify-content-center align-items-center p-2"
					width="80" height="80">
            <use xlink:href="#alt-arrow-right-outline"></use>
          </svg>
			</div>
			<div
				class="position-absolute top-50 start-0 ps-0 ps-xxl-5 ms-0 ms-xxl-5 swiper-prev product-slider-button-prev">
				<svg
					class="chevron-back-circle d-flex justify-content-center align-items-center p-2"
					width="80" height="80">
            <use xlink:href="#alt-arrow-left-outline"></use>
          </svg>
			</div>

		</div>
	</section>

	<%@ include file="/bootstrap5/footer.jsp"%>

	<script src="js/jquery-1.11.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
	
</body>
</html>