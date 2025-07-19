package Controllers.User;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;

import Models.Book;
import Models.Review;
import Services.BookServiceImp;
import Services.IBookService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/User/Details-Book")
public class SingleProductController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    IBookService service = new BookServiceImp();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     
        String bookId = req.getParameter("id");
        
        Book book = service.findById(Integer.parseInt(bookId));
        double discountedPrice = book.getPrice() + (book.getPrice() * book.getDiscountPercentage() / 100);
        DecimalFormat formatter = new DecimalFormat("#,###");
        String formattedPrice = formatter.format(discountedPrice);
        req.setAttribute("discountedPrice", formattedPrice);
        formattedPrice = formatter.format(book.getPrice());
        req.setAttribute("book", book);
        req.setAttribute("price", formattedPrice);
       
        
        List<Review> reviews = service.listReviewByBookid(Integer.parseInt(bookId));
        req.setAttribute("reviews", reviews);
        req.getRequestDispatcher("/bootstrap5/single-product.jsp").forward(req, resp);
    }
}
