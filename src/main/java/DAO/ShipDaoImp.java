package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Configs.DBConnect;

@SuppressWarnings("serial")
public class ShipDaoImp implements IShipDao{

	public Connection conn = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;
	
	@Override
	public int priceShip(int id) {
		int fee = 0;
        String query = "SELECT priceship FROM shipmethod WHERE id = ?";
        try (PreparedStatement preparedStatement = DBConnect.getConnection().prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                fee = resultSet.getInt("priceship");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return fee;
	}

}
