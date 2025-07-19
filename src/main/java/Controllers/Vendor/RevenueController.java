package Controllers.Vendor;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

import Models.Order;
import Services.DTServiceImp;
import Services.OrderServiceImp;
import Services.IOrderService;
import Services.IDTService;
import Services.RevenueService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Vendor/Revenue")
public class RevenueController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    IDTService service = new DTServiceImp();
    RevenueService revenueService = new RevenueService();
    IOrderService orderService = new OrderServiceImp();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userCount = service.userCount();
        int orderCount = service.orderCount();
        int bookCount = service.bookCount();

        req.setAttribute("userCount", userCount);
        req.setAttribute("orderCount", orderCount);
        req.setAttribute("bookCount", bookCount);
        
        // Lấy danh sách đơn hàng
        List<Order> orders = orderService.listOrder();
        
        // Tính toán doanh thu theo tháng
        Map<String, Integer> monthlyRevenue = revenueService.calculateMonthlyRevenue(orders);
        
        // Chuyển dữ liệu đã sắp xếp sang JSON và gắn vào request
        req.setAttribute("monthlyLabels", new Gson().toJson(new ArrayList<>(monthlyRevenue.keySet())));
        req.setAttribute("monthlyData", new Gson().toJson(new ArrayList<>(monthlyRevenue.values())));

        // Forward sang file JSP
        req.getRequestDispatcher("/Vendor/doanhThu.jsp").forward(req, resp);
    }
}

