package Controllers.Vendor;

import Services.OrderServiceImp;

import java.io.IOException;
import java.util.List;

import DAO.IOrderDao;
import DAO.OrderDaoImp;
import Models.Order;
import Services.IOrderService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Vendor/Orders")
public class GetListOrderController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	IOrderService service = new OrderServiceImp();
	IOrderDao dao= new OrderDaoImp();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Order> orders = dao.listOrder();
		req.setAttribute("orders", orders);
		req.getRequestDispatcher("/Vendor/table-data-order.jsp").forward(req, resp);
	}
}
