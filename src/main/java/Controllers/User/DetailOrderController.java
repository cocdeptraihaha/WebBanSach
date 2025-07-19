package Controllers.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import Models.DetailOrder;
import Services.BookServiceImp;
import Services.IBookService;
import Services.IOrderService;
import Services.OrderServiceImp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/User/DetailOrder")
public class DetailOrderController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	IOrderService service = new OrderServiceImp();
	IBookService bookS = new BookServiceImp();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		
		List<DetailOrder> list = new ArrayList<>();
		list = service.getListDetailOrder(id);
		
		req.setAttribute("list", list);
		req.getRequestDispatcher("/bootstrap5/detailpreview.jsp").forward(req, resp);
	}

}
