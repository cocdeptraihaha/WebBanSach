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

@WebServlet("/User/ActionHandler")
public class ActionHandlerController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	IOrderService orderService = new OrderServiceImp();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
        String quantity = req.getParameter("quantity");
        String bookId = req.getParameter("bookId");
        String action = req.getParameter("action");  

        if ("buyNow".equals(action)) {
            handleBuyNow(req, resp, bookId, quantity);
        } else if ("addToCart".equals(action)) {
            handleAddToCart(req, resp, bookId, quantity);
        }
    }

    private void handleBuyNow(HttpServletRequest req, HttpServletResponse resp, String bookId, String quantity) throws IOException {
    	
    	resp.sendRedirect(req.getContextPath() + "/User/Payment?bookId=" + bookId + "&quantity=" + quantity);
    }

    private void handleAddToCart(HttpServletRequest req, HttpServletResponse resp, String bookId, String quantity) throws IOException {
    	HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("account") == null) {
            resp.sendRedirect(req.getContextPath() + "/User/Login");
            return;
        }
        
        Account account = (Account) session.getAttribute("account");

        orderService.insertcart(account.getUsername(), bookId, Integer.parseInt(quantity));
    }

}
