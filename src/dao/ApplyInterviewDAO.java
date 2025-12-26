package dao;

import java.sql.*;
import util.DBConnection;

public class ApplyInterviewDAO {

    public boolean applyInterview(int offerId, int applicantId) {
        String insertSQL = "INSERT INTO applications (offerId, applicantId) VALUES (?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(insertSQL)) {

            ps.setInt(1, offerId);
            ps.setInt(2, applicantId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}