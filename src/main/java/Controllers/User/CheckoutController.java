package Controllers.User;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import Models.Account;
import Models.Book;
import Models.Province;
import Models.User;
import Services.AccountServiceImp;
import Services.BookServiceImp;
import Services.IAccountService;
import Services.IBookService;
import Services.IProvinceService;
import Services.ProvinceServiceImp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/User/Payment")
public class CheckoutController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	IAccountService service = new AccountServiceImp();
	IProvinceService province = new ProvinceServiceImp();
	IBookService bookservice = new BookServiceImp();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int bookid = Integer.parseInt(req.getParameter("bookId"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		
		Book book = bookservice.findById(bookid);
		double total = (book.getPrice() + (book.getPrice() * book.getDiscountPercentage()/100)) * quantity;
		
		DecimalFormat formatter = new DecimalFormat("#,###");
        String totalfm = formatter.format(total);
        
        
		HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("account") == null) {
            resp.sendRedirect(req.getContextPath() + "/User/Login");
            return;
        }
        
        Account account = (Account) session.getAttribute("account");
        User user = service.getUserByUsername(account.getUsername());
        List<Province> provinces = new ArrayList<>();
		provinces = province.getListProvince();
		req.setAttribute("provinces", provinces);

        req.setAttribute("account", account);
        req.setAttribute("user", user);
        req.setAttribute("provinces", provinces);
        req.setAttribute("total", totalfm);

        req.getRequestDispatcher("/bootstrap5/checkout.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
    }
}
