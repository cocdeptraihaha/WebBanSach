<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/Commons/taglib.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <title>Thanh toán</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap5/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200..1000;1,200..1000&display=swap" rel="stylesheet">
  </head>
  <body>
  
   
  	<%@ include file="/bootstrap5/svg.jsp" %>

	<%@ include file="/bootstrap5/header.jsp" %>

    <section class="checkout-wrap padding-large">
      <div class="container">
        <form action="${pageContext.request.contextPath}/User/Order" method="post">
          <div class="row d-flex flex-wrap">
            <div class="col-lg-6">
              <h3 class="mb-3">Chi tiết đơn hàng</h3>
              <div class="billing-details">
			    <label for="firstname">Họ tên*</label>
			    <input type="text" id="firstname" name="firstname" class="form-control mt-2 mb-4 ps-3" 
			           value="${user.fullname != null ? user.fullname : ''}">
			    
			    <label for="provinces">Tỉnh/Thành phố:*</label>
			    <select id="provinces" name="provinces" class="form-control mt-2 mb-4 ps-3">
			        <option value="">-- Chọn tỉnh/thành phố --</option>
			        <c:forEach var="province" items="${provinces}">
			            <option value="${province}" 
			                    ${province == user.province ? 'selected' : ''}>${province}</option>
			        </c:forEach>
			    </select>
			    
			    <label for="district">Quận/Huyện/Thị xã:*</label>
			    <input type="text" id="district" name="district" class="form-control mt-2 mb-4" 
			           value="${user.district != null ? user.district : ''}">
			    
			    <label for="address">Địa chỉ chi tiết:*</label>
			    <input type="text" id="adr" name="address" class="form-control mt-3 ps-3 mb-3" 
			           value="${user.address != null ? user.address : ''}">
			    
			    <label for="phone">Số điện thoại *</label>
			    <input type="text" id="phone" name="phone" class="form-control mt-2 mb-4 ps-3" 
			           value="${user.phone != null ? user.phone : ''}">
			    
			    <label for="email">Email *</label>
			    <input type="text" id="email" name="email" class="form-control mt-2 mb-4 ps-3" 
			           value="${account.email != null ? account.email : ''}">
			</div>

            </div>
            <div class="col-lg-6">
              <div>
                <h3 class="mb-3">Ghi chú</h3>
                <div class="billing-details">
                  <label for="fname">Thêm dặn dò về đơn hàng</label>
                  <textarea id="notes" name="notes" class="form-control pt-3 pb-3 ps-3 mt-2"></textarea>
                </div>
              </div>

			<div class="list-group mt-4">
			  <h5>Phương thức vận chuyển</h5>
			  <label class="list-group-item d-flex gap-2 border-0">
			    <input class="form-check-input flex-shrink-0" type="radio" name="shippingMethod" value="1" id="shippingMethod1" checked>
			    <span>Vận chuyển thường (thời gian nhận hàng từ 7-9 ngày)</span>
			  </label>
			  <label class="list-group-item d-flex gap-2 border-0">
			    <input class="form-check-input flex-shrink-0" type="radio" name="shippingMethod" value="2" id="shippingMethod2">
			    <span>Vận chuyển nhanh (thời gian nhận hàng từ 3-5 ngày))</span>
			  </label>
			  <label class="list-group-item d-flex gap-2 border-0">
			    <input class="form-check-input flex-shrink-0" type="radio" name="shippingMethod" value="3" id="shippingMethod3">
			    <span>Hoả tốc (thời gian nhận hàng từ 1-2 ngày)</span>
			  </label>
			</div>

              <div class="list-group">
                  <h5>Phương thức thanh toán</h5>
                  <label class="list-group-item d-flex gap-2 border-0">
                    <input class="form-check-input flex-shrink-0" type="radio" name="listGroupRadios"
                      id="listGroupRadios1" value="Thanh toán khi nhận hàng" checked>
                    <span>
                      <p class="mb-1">Thanh toán khi nhận hàng </p>
                    </span>
                  </label>
                  <label class="list-group-item d-flex gap-2 border-0">
                    <input class="form-check-input flex-shrink-0" type="radio" name="listGroupRadios"
                      id="listGroupRadios2" value="VNPay">
                    <span>
                      <p class="mb-1">VNPay</p>
                    </span>
                  </label>
                </div>  
                
              <div class="cart-totals padding-medium pb-0">
                <h3 class="mb-3">Thanh toán</h3>
                <div class="total-price pb-3">
                  <table cellspacing="0" class="table text-capitalize">
                    <tbody>
                      <tr class="subtotal pt-2 pb-2 border-top border-bottom">
                        <th>Thành tiền sản phẩm</th>
                        <td data-title="Subtotal">
                          <span class="price-amount amount text-primary ps-5 fw-light">
                            <bdi>
                              <span class="price-currency-symbol"></span>${total}
                            </bdi>
                          </span>
                        </td>
                      </tr>
                      <tr class="order-total pt-2 pb-2 border-bottom">
						  <th>Phí vận chuyển</th>
						  <td class="shipping-fee">
						    <span class="price-amount amount text-primary ps-5 fw-light">
						        <bdi><span class="price-currency-symbol"></span>0</bdi>
						    </span>
						 </td>
						</tr>
                      <tr class="order-total pt-2 pb-2 border-bottom">
                        <th>Tổng thanh toán</th>
                        <td class="total">
						    <span class="price-amount amount text-primary ps-5 fw-light">
						        <bdi><span class="price-currency-symbol"></span>0</bdi>
						    </span>
						</td>

                      </tr>
                    </tbody>
                  </table>
                </div>
                <div class="button-wrap mt-3">
	                <input type="hidden" name="subtotal" id="subtotal" value="${total}">
	    			<input type="hidden" name="shippingFee" id="shippingFee" value="0">
			        <button type="submit" name="submit" class="btn">Đặt hàng</button>
			    </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </section>

    <%@ include file="/bootstrap5/footer.jsp" %>

    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
    <script>
 	// Hàm cập nhật phí vận chuyển
    function updateShippingFee(fee) {
        const shippingFeeElement = document.querySelector('.shipping-fee bdi');
        const shippingFeeInput = document.getElementById('shippingFee');  // Lấy trường ẩn shippingFee
        if (shippingFeeElement && shippingFeeInput) {
            // Cập nhật phí vận chuyển trên giao diện
            shippingFeeElement.textContent = fee.toLocaleString('vi-VN').replace(/\./g, ',');

            // Cập nhật giá trị vào trường ẩn shippingFee
            shippingFeeInput.value = fee;
        } else {
            console.error('Không tìm thấy phần tử phí vận chuyển hoặc trường ẩn shippingFee');
        }
    }

    // Hàm cập nhật tổng thanh toán
    function updateTotalPayment() {
        // Lấy thành tiền sản phẩm
        const productTotalElement = document.querySelector('.subtotal .price-amount bdi');
        const productTotal = productTotalElement ? parseFloat(productTotalElement.textContent.replace(/,/g, '')) : 0;

        // Lấy phí vận chuyển
        const shippingFeeElement = document.querySelector('.shipping-fee bdi');
        const shippingFee = shippingFeeElement ? parseFloat(shippingFeeElement.textContent.replace(/,/g, '')) : 0;

        // Tính tổng thanh toán
        const totalPayment = productTotal + shippingFee;

        // Cập nhật tổng thanh toán vào giao diện
        const totalPaymentElement = document.querySelector('.total .price-amount bdi'); // Đảm bảo cập nhật đúng phần tử
        if (totalPaymentElement) {
            totalPaymentElement.textContent = totalPayment.toLocaleString('vi-VN').replace(/\./g, ',');
        } else {
            console.error('Không tìm thấy phần tử tổng thanh toán');
        }
    }

    // Lắng nghe sự kiện thay đổi phương thức vận chuyển
    document.querySelectorAll('input[name="shippingMethod"]').forEach((radio) => {
        radio.addEventListener('change', function() {
            const shippingMethodId = this.value;  // Lấy giá trị của phương thức vận chuyển đã chọn

            // Gửi yêu cầu đến controller để lấy phí vận chuyển
            fetch(`${pageContext.request.contextPath}/User/Shipprice`, {
                method: 'POST',
                body: JSON.stringify({ shippingMethod: shippingMethodId }),  // Gửi dữ liệu phương thức vận chuyển
                headers: {
                    'Content-Type': 'application/json'
                }
            })
            .then(response => response.json())
            .then(data => {
                console.log('Dữ liệu từ server:', data);  // Kiểm tra dữ liệu trả về từ server

                // Cập nhật phí vận chuyển
                updateShippingFee(data.fee);

                // Cập nhật tổng thanh toán sau khi thay đổi phí vận chuyển
                updateTotalPayment();
            })
            .catch(error => {
                console.error('Lỗi khi lấy phí vận chuyển:', error);
            });
        });
    });
	</script>
  </body>
</html>