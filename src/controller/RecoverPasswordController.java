package controller;

import java.io.IOException;
import javax.servlet.http.*;

import dao.RecoverPassword;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

@WebServlet("/RecoverPassword")
public class RecoverPasswordController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String role = request.getParameter("urole");
        int userId = Integer.parseInt(request.getParameter("uid"));
        String newPwd = request.getParameter("npass");
        String confirmPwd = request.getParameter("cpass");
        if (!newPwd.equals(confirmPwd)) {
            request.setAttribute("errorMessage", "Passwords do not match.");
            RequestDispatcher rd = request.getRequestDispatcher("RecoverPassword.jsp");
            rd.forward(request, response);
            return;
        }

        boolean isSuccess = false;
        RecoverPassword recoverPassword = new RecoverPassword();
        if ("admin".equals(role)) {
            isSuccess = recoverPassword.UpdatePasswordAdmin(userId, newPwd);
        } else if ("applicant".equals(role)) {
            isSuccess = recoverPassword.UpdatePasswordApplicant(userId, newPwd);
        } 

        if (isSuccess) {
            request.getSession().setAttribute("message", "Password updated successfully!");
        } else {
            request.getSession().setAttribute("errorMessage", "Password update failed.");
        }

        String target = "admin".equals(role) ? "AdminLogin.jsp" : "ApplicantLogin.jsp";
        response.sendRedirect(request.getContextPath() + "/jsp/" + target);
    }
}
