package Controllers.User;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;

import Models.Account;
import Models.Cart;
import Models.Province;
import Models.User;
import Services.AccountServiceImp;
import Services.IAccountService;
import Services.IOrderService;
import Services.IProvinceService;
import Services.OrderServiceImp;
import Services.ProvinceServiceImp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/User/CheckoutCart")
public class CheckoutCartController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	IOrderService orderService = new OrderServiceImp();
	IProvinceService provinceService = new ProvinceServiceImp();
	IAccountService service = new AccountServiceImp();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession(false);

        Account account = (Account) session.getAttribute("account");

        List<Cart> cartItems = orderService.getListCartByUsername(account.getUsername());

        double total = 0;
        for (Cart item : cartItems) {
            double itemTotal = (item.getBookprice()
                + (item.getBookprice() * item.getDiscount() / 100)) 
                * item.getQuantity();
            total += itemTotal;
        }

        DecimalFormat formatter = new DecimalFormat("#,###");
        String totalFormatted = formatter.format(total);
        User user = service.getUserByUsername(account.getUsername());
        List<Province> provinces = provinceService.getListProvince();

        req.setAttribute("account", account);
        req.setAttribute("user", user);
        req.setAttribute("total", totalFormatted);
        req.setAttribute("provinces", provinces);

       
        req.getRequestDispatcher("/bootstrap5/checkout.jsp").forward(req, resp);
	}

}
