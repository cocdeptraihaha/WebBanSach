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

@WebServlet("/User/Books")
public class ListBooksPaginationController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	private static final int PAGE_SIZE = 8;
	IBookService service = new BookServiceImp();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pageNumber = 1;

        String pageParam = req.getParameter("page");
        if (pageParam != null) {
            try {
                pageNumber = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                pageNumber = 1;
            }
        }
        
        int offset = (pageNumber - 1) * PAGE_SIZE;

        List<Book> books = service.Pagination(offset, PAGE_SIZE);
        int totalBooks = service.countBooks();
        int totalPages = (int) Math.ceil((double) totalBooks / PAGE_SIZE);

        req.setAttribute("books", books);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("currentPage", pageNumber);

        req.getRequestDispatcher("/bootstrap5/shop.jsp").forward(req, resp);
    }
}
