package Services;

import java.util.List;

import DAO.IOrderDao;
import DAO.OrderDaoImp;
import Models.Cart;
import Models.DetailOrder;
import Models.Order;

@SuppressWarnings("serial")
public class OrderServiceImp implements IOrderService{

	IOrderDao orderDao = new OrderDaoImp();
	@Override
	public int insert(Order order) {
		return orderDao.insert(order);
	}
	
	@Override
	public void insertcart(String username, String bookid, int quantity) {
		orderDao.insertcart(username, bookid, quantity);
	}

	@Override
	public List<Cart> getListCartByUsername(String username) {
		return orderDao.getListCartByUsername(username);
	}

	@Override
	public void removeCart(String username, int bookid) {
		orderDao.removeCart(username, bookid);
		
	}

	@Override
	public void checkoutCart(String username, List<Cart> cartItems, int orderId) {
		orderDao.checkoutCart(username, cartItems, orderId);
		
	}

	@Override
	public List<Order> listOrder() {
		return orderDao.listOrder();
	}
	@Override
	public boolean updateOrderStatus(int orderId, String newStatus)
	{
		return orderDao.updateOrderStatus(orderId,newStatus);
	}

	@Override
	public List<Order> listOrderByUsername(String username) {
		return orderDao.listOrderByUsername(username);
	}

	@Override
	public List<DetailOrder> getListDetailOrder(int idorder) {
		return orderDao.getListDetailOrder(idorder);
	}

}
