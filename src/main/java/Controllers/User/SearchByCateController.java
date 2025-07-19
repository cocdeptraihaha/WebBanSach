package Controllers.User;

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

@WebServlet("/User/Search/Cate")
public class SearchByCateController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	IBookService service = new BookServiceImp();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String catename = req.getParameter("categoryName");
		List<Book> books = service.searchBookByCategory(catename);
        req.setAttribute("books", books);
        req.getRequestDispatcher("/bootstrap5/shop.jsp").forward(req, resp);
	}

}
