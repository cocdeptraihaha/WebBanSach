package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Models.Book;
import Models.Review;
import Configs.DBConnect;

public class BookDaoImp implements IBookDao{

	@Override
	public List<Book> listBook() {
	    List<Book> books = new ArrayList<>();
	    String query = "SELECT * FROM book";

	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query);
	         ResultSet rs = ps.executeQuery()) {
	        
	        while (rs.next()) {
	            Book book = new Book(
	            		rs.getInt("id"),
	                    rs.getString("title"),
	                    rs.getString("author"),
	                    rs.getString("image_url"),
	                    rs.getInt("discount_percentage"),
	                    rs.getInt("rating"),
	                    rs.getInt("stock"),
	                    rs.getString("category"),
	                    rs.getInt("price"),
	                    rs.getString("long_description")
	            );
	            books.add(book); 
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); 
	    }

	    return books; 
	}

	@Override
	public Book findById(int id) {
		Book book = null;
	    String query = "SELECT * FROM book WHERE id = ?";
	    try (Connection conn = DBConnect.getConnection(); 
	         PreparedStatement ps = conn.prepareStatement(query)) {
	        ps.setInt(1, id);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            book = new Book(
	                rs.getInt("id"),
	                rs.getString("title"),
	                rs.getString("author"),
	                rs.getString("image_url"),
	                rs.getInt("discount_percentage"),
	                rs.getInt("rating"),
	                rs.getInt("stock"),
	                rs.getString("category"),
	                rs.getInt("price"),
	                rs.getString("long_description")
	            );
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return book;
	}

	@Override
	public List<Review> findByBookId(int bookid) {
		List<Review> reviews = new ArrayList<>();
	    String query = "SELECT a.username, r.date, r.description_review, r.stars " +
	                   "FROM account a INNER JOIN review r ON a.username = r.username " +
	                   "WHERE r.bookid = ?";

	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) {

	        
	        ps.setInt(1, bookid);

	        try (ResultSet rs = ps.executeQuery()) {
	            while (rs.next()) {
	                Review review = new Review(
	                	rs.getString("username"),
	                    rs.getDate("date"),
	                    rs.getString("description_review"),
	                    rs.getInt("stars")
	                );
	                reviews.add(review);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); 
	    }

	    return reviews;
	}

	@Override
	public List<Book> searchBook(String searchname) {
		List<Book> books = new ArrayList<>();
        String query = "SELECT * FROM book WHERE title LIKE ? OR author LIKE ?";
        try (PreparedStatement statement = DBConnect.getConnection().prepareStatement(query)) {
            statement.setString(1, "%" + searchname + "%");
            statement.setString(2, "%" + searchname + "%");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Book book = new Book(
                    resultSet.getInt("id"),
                    resultSet.getString("title"),
                    resultSet.getString("author"),
                    resultSet.getString("image_url"),
                    resultSet.getInt("discount_percentage"),
                    resultSet.getInt("rating"),
                    resultSet.getInt("stock"),
                    resultSet.getString("category"),
                    resultSet.getInt("price"),
                    resultSet.getString("long_description")
                );
                books.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return books;
	}

	@Override
	public List<Book> searchBookByCategory(String catename) {
		List<Book> books = new ArrayList<>();
        String query = "SELECT * FROM book WHERE category = ?";
        try (PreparedStatement statement = DBConnect.getConnection().prepareStatement(query)) {
            statement.setString(1, catename);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Book book = new Book(
                    resultSet.getInt("id"),
                    resultSet.getString("title"),
                    resultSet.getString("author"),
                    resultSet.getString("image_url"),
                    resultSet.getInt("discount_percentage"),
                    resultSet.getInt("rating"),
                    resultSet.getInt("stock"),
                    resultSet.getString("category"),
                    resultSet.getInt("price"),
                    resultSet.getString("long_description")
                );
                books.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return books;
	}

	@Override
	public List<Book> Pagination(int offset, int limit) {
		List<Book> books = new ArrayList<>();
        String query = "SELECT * FROM book LIMIT ? OFFSET ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, limit); 
            stmt.setInt(2, offset);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Book book = new Book(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("author"),
                    rs.getString("image_url"),
                    rs.getInt("discount_percentage"),
                    rs.getInt("rating"),
                    rs.getInt("stock"),
                    rs.getString("category"),
                    rs.getInt("price"),
                    rs.getString("long_description")
                );
                books.add(book);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return books;
	}
	
    public int countBooks() {
    	String query = "SELECT COUNT(*) FROM book";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1); 
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
	public void delete(int id) {
	    String sql = "DELETE FROM book WHERE id = ?";

	    try (PreparedStatement preparedStatement = DBConnect.getConnection().prepareStatement(sql)) {
	        preparedStatement.setInt(1, id);

	        int rowsAffected = preparedStatement.executeUpdate();
	        if (rowsAffected > 0) {
	            System.out.println("Deleted successfully: Book with ID = " + id);
	        } else {
	            System.out.println("No book found with ID = " + id);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	@Override
	public void insert(String title, String author, String image_url, int discount_percentage, int stock,
			String category, int price, String long_description) {
		String sql = "INSERT INTO book (title, author, image_url, discount_percentage, stock, category, price, long_description) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try (PreparedStatement preparedStatement = DBConnect.getConnection().prepareStatement(sql)) {
			preparedStatement.setString(1, title);
			preparedStatement.setString(2, author);
			preparedStatement.setString(3, image_url);
			preparedStatement.setInt(4, discount_percentage);
			preparedStatement.setInt(5, stock);
			preparedStatement.setString(6, category);
			preparedStatement.setInt(7, price);
			preparedStatement.setString(8, long_description);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	@Override
	public boolean checkExistBookByTitle(String title) {
		 String sql = "SELECT COUNT(*) FROM book WHERE title = ?";
	        
	        try (PreparedStatement preparedStatement = DBConnect.getConnection().prepareStatement(sql)) {
	        	
	            preparedStatement.setString(1, title);
	            
	            ResultSet resultSet = preparedStatement.executeQuery();
	            
	            if (resultSet.next()) {
	                int count = resultSet.getInt(1); 
	                return count > 0;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return false;
	}


    public void update(int id, String title, String author, String imageUrl, int discountPercentage, int stock,
                          String category, int price, String longDescription) {
    	String sql = "UPDATE book SET title = ?, author = ?, image_url = ?, discount_percentage = ?, stock = ?, category = ?, price = ?, long_description = ? WHERE id = ?";
    	
    	try (PreparedStatement ps = DBConnect.getConnection().prepareStatement(sql)) {
    		ps.setString(1, title);  // Thay giá trị `title` từ input
    		ps.setString(2, author);  // Thay giá trị `author`
    		ps.setString(3, imageUrl);  // Thay giá trị `image_url`
    		ps.setInt(4, discountPercentage);  // Thay giá trị `discountPercentage`
    		ps.setInt(5, stock);  // Thay giá trị `stock`
    		ps.setString(6, category);  // Thay giá trị `category`
    		ps.setInt(7, price);  // Thay giá trị `price`
    		ps.setString(8, longDescription);  // Thay giá trị `long_description`
    		ps.setInt(9, id);  // Thay giá trị `id` để xác định bản ghi cần cập nhật
    		ps.executeUpdate();}
            catch (Exception e) {
            e.printStackTrace();
        }
    }
    public boolean isDataUpdated(int id, String title, String author, String imageUrl, 
            int discountPercentage, int stock, String category, 
            int price, String longDescription) {
			String sql = "SELECT COUNT(*) AS count " +
			"FROM books " +
			"WHERE id = ? AND title = ? AND author = ? AND image_url = ? " +
			"AND discountPercentage = ? AND stock = ? AND category = ? " +
			"AND price = ? AND long_description = ?";
			try (Connection connection = DBConnect.getConnection();
			PreparedStatement ps = connection.prepareStatement(sql)) {
			ps.setInt(1, id);
			ps.setString(2, title);
			ps.setString(3, author);
			ps.setString(4, imageUrl);
			ps.setInt(5, discountPercentage);
			ps.setInt(6, stock);
			ps.setString(7, category);
			ps.setInt(8, price);
			ps.setString(9, longDescription);
			
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
			int count = rs.getInt("count");
			return count > 0; // Nếu count > 0, bản ghi mới đã tồn tại
			}
			} catch (Exception e) {
			e.printStackTrace();
			}
			return false; // Trả về false nếu xảy ra lỗi
			}

}
