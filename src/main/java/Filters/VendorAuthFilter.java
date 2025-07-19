package Filters;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Models.Account;

@WebFilter("/Vendor/*") // Áp dụng cho tất cả URL có tiền tố /Vendor
public class VendorAuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession(false); // Lấy session nếu tồn tại
        Account account = (session != null) ? (Account) session.getAttribute("account") : null;

        // Kiểm tra nếu chưa đăng nhập hoặc không phải role "vendor"
        // Nếu là trang Login, bỏ qua filter (để tránh vòng lặp chuyển hướng)
        String requestURI = httpRequest.getRequestURI();
        if (account == null && !requestURI.endsWith("/Vendor/Login")) {
            // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập và không phải trang Login
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/Vendor/Login");
            return; 
        }

        // Đã đăng nhập hợp lệ hoặc đang ở trang Login, cho phép tiếp tục
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Dọn dẹp nếu cần
    }
}
