package Controllers.Vendor;

import java.io.IOException;

import Services.BookServiceImp;
import Services.IBookService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Vendor/Book/Delete")
public class DeleteBookController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    IBookService service = new BookServiceImp();
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            int id = Integer.parseInt(req.getParameter("id"));
            service.delete(id);
            resp.sendRedirect(req.getContextPath() + "/Vendor/Books");
    }
}
