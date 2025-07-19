package Controllers.User;

import java.io.IOException;

import Models.Account;
import Services.IOrderService;
import Services.OrderServiceImp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/User/Remove")
public class RemoveCartController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	IOrderService orderService = new OrderServiceImp();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		Account account = (Account) session.getAttribute("account");
		int bookid = Integer.parseInt(req.getParameter("productId"));
		
		orderService.removeCart(account.getUsername(), bookid);
		resp.sendRedirect(req.getContextPath() + "/User/ListCart");
	}
}
