package Models;

public class Book {
    
	 private int id;
	    private String title;
	    private String author;
	    private String imageUrl;
	    private int discountPercentage;
	    private int rating;
	    private int stock;
	    private String category;
	    private int price;
	    private String long_description;
	    
		
	    public Book(int id, String title, String author, String imageUrl, int discountPercentage, int rating,
				int stock, String category, int price, String long_description) {
			super();
			this.id = id;
			this.title = title;
			this.author = author;
			this.imageUrl = imageUrl;
			this.discountPercentage = discountPercentage;
			this.rating = rating;
			this.stock = stock;
			this.category = category;
			this.price = price;
			this.long_description = long_description;
			
		}


		public Book() {
			super();
		}

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getAuthor() {
			return author;
		}

		public void setAuthor(String author) {
			this.author = author;
		}

		public String getImageUrl() {
			return imageUrl;
		}

		public void setImageUrl(String imageUrl) {
			this.imageUrl = imageUrl;
		}

		public int getDiscountPercentage() {
			return discountPercentage;
		}

		public void setDiscountPercentage(int discountPercentage) {
			this.discountPercentage = discountPercentage;
		}

		public int getRating() {
			return rating;
		}

		public void setRating(int rating) {
			this.rating = rating;
		}

		public int getStock() {
			return stock;
		}

		public void setStock(int stock) {
			this.stock = stock;
		}

		public String getCategory() {
			return category;
		}

		public void setCategory(String category) {
			this.category = category;
		}

		public double getPrice() {
			return price;
		}

		public void setPrice(int price) {
			this.price = price;
		}

		public String getLong_description() {
			return long_description;
		}

		public void setLong_description(String long_description) {
			this.long_description = long_description;
		}
		
		@Override
	    public String toString() {
	        return "Book{" +
	               "id=" + id +
	               ", title='" + title + '\'' +
	               ", author='" + author + '\'' +
	               ", imageUrl='" + imageUrl + '\'' +
	               ", discountPercentage=" + discountPercentage +
	               ", rating=" + rating +
	               ", stock=" + stock +
	               ", category='" + category + '\'' +
	               ", price=" + price +
	               ", long_description='" + long_description + '\'' +
	               '}';
	    }
}

