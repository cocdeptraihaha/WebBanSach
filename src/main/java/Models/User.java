package Models;

public class User {

	private String username;
    private String fullname;
    private String province;
    private String district;
    private String town;
    private String phone;
    private String address;
	public User(String username, String fullname, String province, String district, String town, String phone,
			String address) {
		super();
		this.username = username;
		this.fullname = fullname;
		this.province = province;
		this.district = district;
		this.town = town;
		this.phone = phone;
		this.address = address;
	}
	public User() {
		super();
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getTown() {
		return town;
	}
	public void setTown(String town) {
		this.town = town;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}
