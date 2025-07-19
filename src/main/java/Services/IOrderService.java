package Services;

import java.io.Serializable;
import java.util.List;

import Models.Cart;
import Models.DetailOrder;
import Models.Order;

public interface IOrderService extends Serializable{

	int insert(Order order);
	void insertcart(String username, String bookid, int quantity);
	List<Cart> getListCartByUsername(String username);
	void removeCart(String username, int bookid);
	void checkoutCart(String username, List<Cart> cartItems, int orderId);
	
	List<Order> listOrder();
	boolean updateOrderStatus(int orderId, String newStatus);
	List<Order> listOrderByUsername(String username);
	
	List<DetailOrder> getListDetailOrder(int idorder);
}
