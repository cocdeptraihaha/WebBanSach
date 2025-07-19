package Controllers.User;

import java.io.IOException;
import java.util.List;

import Models.Account;
import Models.Order;
import Models.User;
import Services.AccountServiceImp;
import Services.IAccountService;
import Services.IOrderService;
import Services.OrderServiceImp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/User/ListOrder")
public class PreviewOrderController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    IOrderService orderService = new OrderServiceImp();
    IAccountService accountService = new AccountServiceImp();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        HttpSession session = req.getSession(false);
        
        
        if (session == null) {
        	resp.sendRedirect(req.getContextPath() + "/User/Login");  
            return;
        }

        
        Account account = (Account) session.getAttribute("account");
        
        if (account == null) {
        	resp.sendRedirect(req.getContextPath() + "/User/Login");   
            return;
        }

        User user = accountService.getUserByUsername(account.getUsername());
        
        if (user == null) {
        	resp.sendRedirect(req.getContextPath() + "/User/Login");  
            return;
        }

        
        List<Order> orders = orderService.listOrderByUsername(user.getFullname());
        
        // Đưa danh sách đơn hàng vào request
        req.setAttribute("orders", orders);
        
        // Chuyển hướng đến view previeworder.jsp
        req.getRequestDispatcher("/bootstrap5/previeworder.jsp").forward(req, resp);
    }
}
