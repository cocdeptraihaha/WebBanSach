package Controllers;

import java.io.IOException;

import Services.AccountServiceImp;
import Services.IAccountService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/User/Confirm")
public class EmailConfirmController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String token = req.getParameter("token");
        IAccountService service = new AccountServiceImp();
        String alertMsg = "";

        if (service.activateAccount(token)) {
            alertMsg = "Tài khoản của bạn đã được kích hoạt thành công!";
        } else {
            alertMsg = "Liên kết xác nhận không hợp lệ hoặc đã hết hạn.";
        }

        req.setAttribute("alert", alertMsg);
        req.getRequestDispatcher("/Views/User/Login.jsp").forward(req, resp);
    }
}
