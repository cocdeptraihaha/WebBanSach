package Configs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import Configs.DBConnect;

public class DBConnect {

	private static String USERNAME = "root";
	private static String PASSWORD = "1234";
	private static String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static String URL = "jdbc:mysql://localhost:3306/project";

	public static Connection getConnection() throws SQLException, Exception {
		try {
			Class.forName(DRIVER);
			return DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
		try {
			new DBConnect();
			System.out.println(DBConnect.getConnection());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
