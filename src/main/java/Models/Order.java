package Models;

public class Order {

	private int id;
    private String namecustomer;
    private String address;
    private String phone;
    private String email;
    private String notes;
    private int subtotal;
    private int ship;
    private String methodship;
    private String methodpay;
    private String status;
    private String date;
	public Order() {
		super();
	}
	public Order(int id, String namecustomer, String address, String phone, String email, String notes, int subtotal,
			int ship, String methodship, String methodpay, String status, String date) {
		super();
		this.id = id;
		this.namecustomer = namecustomer;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.notes = notes;
		this.subtotal = subtotal;
		this.ship = ship;
		this.methodship = methodship;
		this.methodpay = methodpay;
		this.status = status;
		this.date = date;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String formattedDate) {
		this.date = formattedDate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNamecustomer() {
		return namecustomer;
	}
	public void setNamecustomer(String namecustomer) {
		this.namecustomer = namecustomer;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public int getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(int subtotal) {
		this.subtotal = subtotal;
	}
	public int getShip() {
		return ship;
	}
	public void setShip(int ship) {
		this.ship = ship;
	}
	public String getMethodship() {
		return methodship;
	}
	public void setMethodship(String methodship) {
		this.methodship = methodship;
	}
	public String getMethodpay() {
		return methodpay;
	}
	public void setMethodpay(String methodpay) {
		this.methodpay = methodpay;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
    
}
