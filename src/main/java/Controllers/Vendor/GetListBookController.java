package Controllers.Vendor;

import java.io.IOException;
import java.util.List;

import Models.Book;
import Services.BookServiceImp;
import Services.IBookService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Vendor/Books")
public class GetListBookController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	IBookService service = new BookServiceImp();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Book> books = service.listBook();
        req.setAttribute("books", books);
        req.getRequestDispatcher("/Vendor/table-data-product.jsp").forward(req, resp);
	}
}