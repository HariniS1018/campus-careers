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
import model.Interview;
import java.sql.*;
import java.util.List;

@WebServlet("/AdminLoginController")
public class AdminLoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("uid"));
        String pwd = request.getParameter("pwd");

        HttpSession session = request.getSession();

        try (Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT id, password FROM admin_security WHERE id=?")) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            RequestDispatcher dispatch;
            
            if (rs.next()) {
                Admin admin = new Admin(rs.getInt("id"), rs.getString("password"));
            
                if (pwd.equals(admin.getPassword())) {
                    session.setAttribute("isLoggedin", true);
                    session.setAttribute("role", "admin");
                    session.setAttribute("user", admin.getId());
                    
                    InterviewDAO interviewDAO = new InterviewDAO();
                    List<Interview> activeInterviews = interviewDAO.getActiveInterviews();
                    request.setAttribute("activeInterviews", activeInterviews);
                    dispatch = request.getRequestDispatcher("ViewOpportunityAdmin.jsp");
                }
                else {
                    session.setAttribute("isLoggedin", false);
                    request.setAttribute("errorMessage", "Invalid username or password");
                    dispatch = request.getRequestDispatcher("AdminLogin.jsp");
                }
            } else {
                session.setAttribute("isLoggedin", false);
                request.setAttribute("errorMessage", "User not found");
                dispatch = request.getRequestDispatcher("AdminLogin.jsp");
            }
            
            dispatch.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}