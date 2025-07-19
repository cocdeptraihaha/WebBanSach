package Models;

public class Account {

	private String username;
	private String password;
	private String email;
	private String role;
	private String token;
	
	public Account() {
		super();
	}
	
	public Account(String username, String password, String email, String role, String token) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.role = role;
		this.token = token;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}
	
}
