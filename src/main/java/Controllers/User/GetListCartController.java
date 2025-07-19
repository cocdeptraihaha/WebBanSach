package Controllers.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import Models.Account;
import Models.Cart;
import Services.IOrderService;
import Services.OrderServiceImp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/User/ListCart")
public class GetListCartController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	IOrderService orderService = new OrderServiceImp();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Cart> carts = new ArrayList<>();
		HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("account") == null) {
            resp.sendRedirect(req.getContextPath() + "/User/Login");
            return;
        }
        
        Account account = (Account) session.getAttribute("account");
		carts = orderService.getListCartByUsername(account.getUsername());
		req.setAttribute("carts", carts);
		req.setAttribute("account", account);
		req.getRequestDispatcher("/bootstrap5/cart.jsp").forward(req, resp);
		
	}
}
