package Services;

import java.io.Serializable;
import java.util.List;

import Models.Book;
import Models.Review;

public interface IBookService extends Serializable{

	List<Book> listBook();
	Book findById(int id);
	List<Review> listReviewByBookid(int id);
	List<Book> searchBook(String searchname);
	List<Book> searchBookByCategory(String catename);
	List<Book> Pagination(int offset, int limit);
	int countBooks();
	
	void delete(int id);
	boolean insert(String title, String author, String image_url, int discount_percentage, int stock, String category, int price, String long_description);
	boolean update(int id, String title, String author, String image_url, int discountPercentage, int stock, String category, int price, String long_description);
	boolean checkExistBookByTitle(String title);
}
