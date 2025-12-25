package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import util.DBConnection;
import java.sql.*;

@WebServlet("/ApplicantLoginController")
public class ApplicantLoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("uid")); // match JSP input name
        String pwd = request.getParameter("pwd");

        HttpSession session = request.getSession();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT id, password FROM Applicantsecurity WHERE id=?")) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next() && pwd.equals(rs.getString("password"))) {
                session.setAttribute("isLoggedin", true);
                session.setAttribute("user", userId);

                RequestDispatcher dispatch = request.getRequestDispatcher("ViewOpportunityApplicant.jsp");
                dispatch.forward(request, response);
            } else {
                session.setAttribute("isLoggedin", false);
                PrintWriter out = response.getWriter();
                out.print("<h1>Invalid username or password</h1>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}