package Controllers.Vendor;

import java.io.IOException;

import Services.OrderServiceImp;
import Services.IOrderService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Vendor/Orders/StatusChange")
public class StatusOrderController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    IOrderService service = new OrderServiceImp();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int orderId = Integer.parseInt(req.getParameter("id"));
            String newStatus = req.getParameter("status");

            boolean isUpdated = service.updateOrderStatus(orderId, newStatus);

            if (isUpdated) {
                req.getSession().setAttribute("message", "Cập nhật trạng thái thành công!");
            } else {
                req.getSession().setAttribute("error", "Cập nhật trạng thái thất bại!");
            }
        } catch (Exception e) {
            req.getSession().setAttribute("error", "Lỗi hệ thống: " + e.getMessage());
        }

        resp.sendRedirect(req.getContextPath() + "/Vendor/Orders");
    }
}
