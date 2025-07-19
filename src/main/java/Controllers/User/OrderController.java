package Controllers.User;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import Models.Cart;
import Models.Order;
import Services.IOrderService;
import Services.OrderServiceImp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/User/Order")
public class OrderController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	IOrderService orderService = new OrderServiceImp();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Cấu hình response và request
	    resp.setContentType("text/html");
	    resp.setCharacterEncoding("UTF-8");
	    req.setCharacterEncoding("UTF-8");

	    // Lấy thông tin từ form
	    String firstname = req.getParameter("firstname");
	    String provinces = req.getParameter("provinces");
	    String district = req.getParameter("district");
	    String address = req.getParameter("address");
	    String fullAddress = provinces + ", " + district + ", " + address;
	    String phone = req.getParameter("phone");
	    String email = req.getParameter("email");
	    String note = req.getParameter("notes");
	    int subtotal = Integer.parseInt((req.getParameter("subtotal")).replace(",", ""));
	    int shippingfee = Integer.parseInt((req.getParameter("shippingFee").replace(",", "")));
	    String shippingMethod = req.getParameter("shippingMethod");
	    String paymentMethod = req.getParameter("listGroupRadios");
	    String status = "Chờ xác nhận";

	    // Lấy ngày giờ hiện tại
	    LocalDateTime now = LocalDateTime.now();
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	    String formattedDate = now.format(formatter);

	    // Tạo đối tượng Order
	    Order order = new Order();
	    order.setNamecustomer(firstname);
	    order.setAddress(fullAddress);
	    order.setPhone(phone);
	    order.setEmail(email);
	    order.setNotes(note);
	    order.setSubtotal(subtotal);
	    order.setShip(shippingfee);
	    order.setMethodship(shippingMethod);
	    order.setMethodpay(paymentMethod);
	    order.setStatus(status);
	    order.setDate(formattedDate);

	    int orderId = orderService.insert(order); 

	   
	    String username = (String) req.getSession().getAttribute("username");
	    List<Cart> cartItems = orderService.getListCartByUsername(username); // Phương thức này trả về danh sách giỏ hàng

	    orderService.checkoutCart(username, cartItems, orderId);

	    resp.sendRedirect(req.getContextPath() + "/User/Ordered");
        
	}

}
