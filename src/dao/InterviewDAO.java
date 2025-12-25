package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Interview;
import util.DBConnection;

public class InterviewDAO {

    public List<Interview> getActiveInterviews() {
        List<Interview> interviews = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT company_name, domain, job_type, start_date, duration, venue, interview_date, interview_time, offer_id FROM InterviewDetails WHERE is_active=1"
             )) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Interview interview = new Interview(
                    rs.getString("company_name"),
                    rs.getString("domain"),
                    rs.getString("job_type"),
                    rs.getString("start_date"),
                    rs.getString("duration"),
                    rs.getString("venue"),
                    rs.getString("interview_date"),
                    rs.getString("interview_time"),
                    rs.getString("offer_id")
                );
                interviews.add(interview);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return interviews;
    }
}