package Models;

public class Cart {

	private String username;
	private int bookid;
	private String bookname;
	private String url;
	private int bookprice;
	private int discount;
	private int quantity;
	
	public Cart(String username, int bookid, String bookname, String url, int bookprice, int quantity) {
		super();
		this.username = username;
		this.bookid = bookid;
		this.bookname = bookname;
		this.url = url;
		this.bookprice = bookprice;
		this.quantity = quantity;
	}
	public Cart() {
		super();
	}
	public Cart(int bookid, String bookname, String url, int bookprice, int discount, int quantity) {
		super();
		this.bookid = bookid;
		this.bookname = bookname;
		this.url = url;
		this.bookprice = bookprice;
		this.discount = discount;
		this.quantity = quantity;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public int getBookprice() {
		return bookprice;
	}
	public void setBookprice(int bookprice) {
		this.bookprice = bookprice;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getTotalPrice() {
        return bookprice * quantity * (1 - discount / 100);
    }
	
	@Override
	public String toString() {
		return "Cart [username=" + username + ", bookid=" + bookid + ", bookname=" + bookname + ", url=" + url
				+ ", bookprice=" + bookprice + ", discount=" + discount + ", quantity=" + quantity + "]";
	}
}
