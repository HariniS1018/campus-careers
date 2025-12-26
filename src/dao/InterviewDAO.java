package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Interview;
import util.DBConnection;

import java.time.LocalDate;
import java.time.LocalTime;


public class InterviewDAO {

    public List<Interview> getActiveInterviews() {
        List<Interview> interviews = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT companyName, role, stipend, ctc, duration, interviewVenue, interviewDate, interviewTime, offerId, adminId, isActive FROM Interview WHERE isActive=1"
             )) {

            ResultSet rs = ps.executeQuery();
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
                interviews.add(interview);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return interviews;
    }

    public boolean addInterview(Interview interview) {
        String insertSQL = "INSERT INTO Interview (companyName, role, stipend, ctc, duration, interviewVenue, interviewDate, interviewTime, adminId) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS);) {

            ps.setString(1, interview.getCompanyName());
            ps.setString(2, interview.getRole());
            ps.setInt(3, interview.getStipend());
            ps.setDouble(4, interview.getCtc());
            ps.setInt(5, interview.getDuration());
            ps.setString(6, interview.getInterviewVenue());
            ps.setDate(7, Date.valueOf(interview.getInterviewDate()));
            ps.setTime(8, Time.valueOf(interview.getInterviewTime()));
            ps.setInt(9, interview.getAdminId());
            
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        int generatedOfferId = rs.getInt(1);
                        interview.setOfferId(generatedOfferId); // update object with DB PK
                    }
                }
            }        
            return rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean addEligibleCoursesforInterview(int offerId, List<String> courseIds) {
        String insertSQL = "INSERT INTO OfferCourse (offerId, courseId) VALUES (?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(insertSQL)) {

            for (String courseId : courseIds) {
                ps.setInt(1, offerId);
                ps.setString(2, courseId);
                ps.addBatch();
            }
            int[] rowsAffected = ps.executeBatch();
            for (int count : rowsAffected) {
                if (count == 0) {
                    return false; // at least one insert failed
                }
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}