package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Configs.DBConnect;
import Models.Account;
import Models.User;

@SuppressWarnings("serial")
public class AccountDaoImp extends DBConnect implements IAccountDao {

	public Connection conn = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;

	@Override
	public Account findByUsername(String username) {
		String sql = "SELECT * FROM account WHERE username = ?";
		Account account = null;
		try {
			conn = super.getConnection();

			ps = conn.prepareStatement(sql);

			ps.setString(1, username);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				account = new Account();
				account.setUsername(rs.getString("username"));
				account.setPassword(rs.getString("password"));
				account.setEmail(rs.getString("email"));
				account.setRole(rs.getString("role"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return account;
	}

	@Override
	public void insert(Account account) {
		String sql = "INSERT INTO pending_account(username, password, email, role, token) VALUES(?, ?, ?, ?, ?)";

		try {
			conn = super.getConnection();

			ps = conn.prepareStatement(sql);

			ps.setString(1, account.getUsername());
			ps.setString(2, account.getPassword());
			ps.setString(3, account.getEmail());
			ps.setString(4, account.getRole());
			ps.setString(5, account.getToken());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean checkExistUsername(String username) {
		boolean duplicate = false;
		String query = "SELECT 1 FROM account where username = ?";
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			rs = ps.executeQuery();
			if (rs.next()) {
				duplicate = true;
			}
		} catch (Exception ex) {
		}
		return duplicate;
	}

	@Override
	public boolean activateByToken(String token) {
		 
		String selectQuery = "SELECT * FROM pending_account WHERE token = ?";
	    String insertQuery = "INSERT INTO account (email, username, password, role) VALUES (?, ?, ?, ?)";
	    String deleteQuery = "DELETE FROM pending_account WHERE token = ?";

	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement selectPs = conn.prepareStatement(selectQuery)) {
	        selectPs.setString(1, token);
	        ResultSet rs = selectPs.executeQuery();

	        if (rs.next()) {
	            String email = rs.getString("email");
	            String username = rs.getString("username");
	            String password = rs.getString("password");
	            String role = rs.getString("role");

	            try (PreparedStatement insertPs = conn.prepareStatement(insertQuery);
	                 PreparedStatement deletePs = conn.prepareStatement(deleteQuery)) {
	                
	                insertPs.setString(1, email);
	                insertPs.setString(2, username);
	                insertPs.setString(3, password);
	                insertPs.setString(4, role);
	                insertPs.executeUpdate();

	                
	                deletePs.setString(1, token);
	                deletePs.executeUpdate();
	            }

	            return true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;   
	}

	@Override
	public User getUserByUsername(String username) {
		String sql = "SELECT * FROM user WHERE username = ?";
		User user = null;
		try {
			conn = super.getConnection();

			ps = conn.prepareStatement(sql);

			ps.setString(1, username);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				user = new User();
				user.setUsername(rs.getString("username"));
				user.setFullname(rs.getString("fullname"));
				user.setPhone(rs.getString("phone"));
				user.setProvince(rs.getString("province"));
				user.setDistrict(rs.getString("district"));
				user.setAddress(rs.getString("address"));
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
}
