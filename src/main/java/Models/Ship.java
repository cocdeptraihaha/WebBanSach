package Models;

public class Ship {

	private int id;
	private String shipname;
	private int priceship;
	public Ship(int id, String shipname, int priceship) {
		super();
		this.id = id;
		this.shipname = shipname;
		this.priceship = priceship;
	}
	public Ship() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getShipname() {
		return shipname;
	}
	public void setShipname(String shipname) {
		this.shipname = shipname;
	}
	public int getPriceship() {
		return priceship;
	}
	public void setPriceship(int priceship) {
		this.priceship = priceship;
	}
	
}
