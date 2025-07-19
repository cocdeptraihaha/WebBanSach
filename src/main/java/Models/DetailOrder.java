package Models;

public class DetailOrder {

	private int idBook;
    private String title;
    private int quantity;
    private double total;

    public DetailOrder(int idBook, String title, int quantity, double total) {
        this.idBook = idBook;
        this.title = title;
        this.quantity = quantity;
        this.total = total;
    }

    // Getter và setter
    public int getIdBook() {
        return idBook;
    }

    public void setIdBook(int idBook) {
        this.idBook = idBook;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
	
}
