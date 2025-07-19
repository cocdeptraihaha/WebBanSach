package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Configs.DBConnect;
import Models.Province;

public class ProvinceDaoImp implements IProvinceDao{

	@Override
	public List<Province> getListProvince() {
		List<Province> provinces = new ArrayList<>();
	    String query = "SELECT * FROM province";

	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query);
	         ResultSet rs = ps.executeQuery()) {
	        
	        while (rs.next()) {
	            Province province = new Province(
	            		rs.getInt("id"),
	                    rs.getString("name")
	            );
	            provinces.add(province); 
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); 
	    }

	    return provinces; 
	}
}
