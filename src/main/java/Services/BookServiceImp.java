package Services;

import java.util.List;
import DAO.BookDaoImp;
import DAO.IBookDao;
import Models.Book;
import Models.Review;

@SuppressWarnings("serial")
public class BookServiceImp implements IBookService{

	IBookDao bookDao = new BookDaoImp();
	
	@Override
	public List<Book> listBook() {
		return bookDao.listBook();
	}

	@Override
	public Book findById(int id) {
		return bookDao.findById(id);
    }

	@Override
	public List<Review> listReviewByBookid(int id) {
		return bookDao.findByBookId(id);
	}

	@Override
	public List<Book> searchBook(String searchname) {
		return bookDao.searchBook(searchname);
	}

	@Override
	public List<Book> searchBookByCategory(String catename) {
		return bookDao.searchBookByCategory(catename);
	}

	@Override
	public List<Book> Pagination(int offset, int limit) {
		return bookDao.Pagination(offset, limit);
	}

	@Override
	public int countBooks() {
		return bookDao.countBooks();
	}

	@Override
	public void delete(int id) {
		bookDao.delete(id);
	}

	@Override
	public boolean insert(String title, String author, String image_url, int discount_percentage, int stock,
	                      String category, int price, String long_description) {
	    if (!checkExistBookByTitle(title)) {
	        bookDao.insert(title, author, image_url, discount_percentage, stock, category, price, long_description);
	        return true;
	    } else {
	        return false;
	    }
	}



	@Override
	public boolean checkExistBookByTitle(String title) {
		return bookDao.checkExistBookByTitle(title);
	}

	@Override
	public boolean update(int id, String title, String author, String image_url, int discountPercentage, int stock,
			String category, int price, String long_description) {
		bookDao.update(id, title, author, image_url, discountPercentage, stock, category, price, long_description);
		return bookDao.isDataUpdated(id, title, author, image_url, discountPercentage, stock, category, price, long_description);

	}
}
