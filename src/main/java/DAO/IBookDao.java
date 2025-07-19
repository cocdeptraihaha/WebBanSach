package DAO;

import java.util.List;

import Models.Book;
import Models.Review;

public interface IBookDao {

	List<Book> listBook();
	Book findById(int id);
	List<Review> findByBookId(int id);
	List<Book> searchBook(String searchname);
	List<Book> searchBookByCategory(String catename);
	List<Book> Pagination(int offset, int limit);
	int countBooks();
	
	void delete(int id);
	void insert(String title, String author, String image_url, int discount_percentage, int stock, String category, int price, String long_description);
	void update(int id, String title, String author, String image_url, int discount_percentage, int stock, String category, int price, String long_description) ;
	boolean checkExistBookByTitle(String title);
	boolean isDataUpdated(int id, String title, String author, String imageUrl, 
            int discountPercentage, int stock, String category, 
            int price, String longDescription);
}
