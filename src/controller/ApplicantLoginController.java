package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.InterviewDAO;
import util.DBConnection;
import model.Admin;
import model.Applicant;
import model.Interview;

import java.sql.*;
import java.util.List;

@WebServlet("/ApplicantLoginController")
public class ApplicantLoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("uid")); // match JSP input name
        String pwd = request.getParameter("pwd");

        HttpSession session = request.getSession();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT id, password FROM applicant_security WHERE id=?")) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            RequestDispatcher dispatch;
            
            if (rs.next()) {
                Applicant applicant = new Applicant(rs.getInt("id"), rs.getString("password"));
                if (pwd.equals(applicant.getPassword())) {
                    session.setAttribute("isLoggedin", true);
                    session.setAttribute("role", "applicant");
                    session.setAttribute("user", applicant.getId());
                    
                    InterviewDAO interviewDAO = new InterviewDAO();
                    List<Interview> activeInterviews = interviewDAO.getActiveInterviews();
                    request.setAttribute("activeInterviews", activeInterviews);

                    dispatch = request.getRequestDispatcher("ViewOpportunityApplicant.jsp");
                } else {
                    session.setAttribute("isLoggedin", false);
                    request.setAttribute("errorMessage", "Invalid username or password");
                    dispatch = request.getRequestDispatcher("ApplicantLogin.jsp");
                }
            } else {
                session.setAttribute("isLoggedin", false);
                request.setAttribute("errorMessage", "User not found");
                dispatch = request.getRequestDispatcher("ApplicantLogin.jsp");
            }
            dispatch.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}