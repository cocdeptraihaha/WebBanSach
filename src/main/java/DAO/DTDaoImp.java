package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Configs.DBConnect;

public class DTDaoImp implements IDTDao {

    @Override
    public int userCount() {
        String query = "SELECT COUNT(*) AS total FROM user"; 
        try (Connection connection = DBConnect.getConnection();
             PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getInt("subtotal");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0; // Trả về 0 nếu có lỗi xảy ra
    }

    @Override
    public int orderCount() {
        String query = "SELECT COUNT(*) AS total FROM `order`"; 
        try (Connection connection = DBConnect.getConnection();
             PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0; // Trả về 0 nếu có lỗi xảy ra
    }

    @Override
    public int bookCount() {
        String query = "SELECT COUNT(*) AS total FROM book"; // Thay "Books" bằng tên bảng sách thực tế của bạn
        try (Connection connection = DBConnect.getConnection();
             PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
        }
}