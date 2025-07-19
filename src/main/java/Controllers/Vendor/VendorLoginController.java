package Controllers.Vendor;

import java.io.IOException;

import Models.Account;
import Services.AccountServiceImp;
import Services.IAccountService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Vendor/Login")
public class VendorLoginController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	IAccountService service = new AccountServiceImp();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/Vendor/Login.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// Set encoding for request and response
	    resp.setContentType("text/html");
	    resp.setCharacterEncoding("UTF-8");
	    req.setCharacterEncoding("UTF-8");

	    // Retrieve form parameters
	    String username = req.getParameter("username");
	    String password = req.getParameter("password");
	    boolean isRememberMe = "on".equals(req.getParameter("remember"));

	    // Login service call
	    Account account = service.Login(username, password, "vendor");
	    
	    if (account != null) {
	    	
	        HttpSession session = req.getSession();
	        session.setAttribute("username", account.getUsername()); 
	        session.setAttribute("account", account); 

	        if (isRememberMe) {
	            Cookie usernameCookie = new Cookie("username", username);
	            usernameCookie.setMaxAge(60 * 60 * 24 * 30); // 30 days
	            resp.addCookie(usernameCookie);
	        }

	        // Redirect to home page
	        resp.sendRedirect(req.getContextPath() + "/Vendor/Revenue");
	    } else {
	        // Login failed
	        String alertMsg = "Tài khoản hoặc mật khẩu không đúng";
	        req.setAttribute("alert", alertMsg);
	        req.getRequestDispatcher("/Vendor/Login.jsp").forward(req, resp);
	    }
	}
}