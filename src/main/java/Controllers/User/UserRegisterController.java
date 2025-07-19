package Controllers.User;

import java.io.IOException;
import java.util.UUID;

import Services.AccountServiceImp;
import Services.IAccountService;
import Utils.EmailUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/User/Register")
public class UserRegisterController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/Views/User/Register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");

        IAccountService service = new AccountServiceImp();
        String alertMsg = "";

        if (service.checkExistUsername(username)) {
            alertMsg = "Tài khoản đã tồn tại!";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher("/Views/User/Register.jsp").forward(req, resp);
            return;
        }

        String token = UUID.randomUUID().toString();

        boolean isSaved = service.register(email, username, password, "user", token);

        if (isSaved) {
            String subject = "Xác nhận đăng ký tài khoản";
            String confirmLink = req.getRequestURL().toString().replace("Register", "Confirm") + "?token=" + token;
            String emailContent = "Chào " + username + ",<br><br>" +
                    "Vui lòng nhấn vào liên kết dưới đây để xác nhận đăng ký tài khoản của bạn:<br>" +
                    "<a href='" + confirmLink + "'>Xác nhận đăng ký</a><br><br>" +
                    "Trân trọng,<br>Đội ngũ hỗ trợ.";

            try {
                EmailUtil.sendEmail(email, subject, emailContent);
                req.setAttribute("alert", "Đăng ký thành công! Vui lòng kiểm tra email để kích hoạt tài khoản.");
            } catch (Exception e) {
                e.printStackTrace();
                alertMsg = "Không thể gửi email xác thực. Vui lòng thử lại sau.";
                req.setAttribute("alert", alertMsg);
            }

            req.getRequestDispatcher("/Views/Confirm.jsp").forward(req, resp);
        } else {
            alertMsg = "Đăng ký thất bại. Vui lòng thử lại.";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher("/Views/User/Register.jsp").forward(req, resp);
        }
    }
}
