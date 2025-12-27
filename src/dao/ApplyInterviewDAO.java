package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.Interview;
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

    public List<Interview> fetchAppliedOffers(int applicantId) {
        List<Interview> appliedOffers = new ArrayList<>();
        String sql = "select i.companyName, i.role, i.stipend, i.ctc, i.duration, i.interviewVenue, i.interviewDate, i.interviewTime, i.offerId, i.adminId, i.isActive from Applications as app join interview as i on app.offerId=i.offerId where app.applicantId=?";
        try (Connection con = DBConnection.getConnection();
                PreparedStatement pst = con.prepareStatement(sql);) {
            
            pst.setInt(1, applicantId);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Interview interview = new Interview(
                    rs.getString("companyName"),
                    rs.getString("role"),
                    rs.getInt("stipend"),
                    rs.getDouble("ctc"),
                    rs.getInt("duration"),
                    rs.getString("interviewVenue"),
                    rs.getDate("interviewDate").toLocalDate(),
                    rs.getTime("interviewTime").toLocalTime(),
                    rs.getInt("offerId"),
                    rs.getInt("adminId"),
                    rs.getBoolean("isActive")
                );
                appliedOffers.add(interview);
            }
        }
        catch(Exception e){
			e.printStackTrace();
            return new ArrayList<>();
		}
        return appliedOffers;
    }

}