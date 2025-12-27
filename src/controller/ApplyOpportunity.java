package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ApplyInterviewDAO;

@WebServlet("/ApplyOpportunity")
public class ApplyOpportunity extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		
			String offerIdParam = request.getParameter("offer_id");
			if (offerIdParam != null) {
				int offerId = Integer.parseInt(offerIdParam);
				
                Object userObj = request.getSession().getAttribute("user");
                if (userObj == null) {
                    request.getSession().setAttribute("errorMessage", "Please log in again.");
                    response.sendRedirect(request.getContextPath() + "/ApplicantLogin.jsp");
                    return;
                }
                int applicantId = Integer.parseInt(userObj.toString());
                
                ApplyInterviewDAO applyInterviewDAO = new ApplyInterviewDAO();
				if (applyInterviewDAO.applyInterview(offerId, applicantId)) {
                    request.getSession().setAttribute("message", "Applied for the offer successfully");
                } else {
                    request.getSession().setAttribute("errorMessage", "Failed to apply for the offer");
                }
			} 
			else {
				request.getSession().setAttribute("errorMessage",  "Missing offer_id parameter");
			}
			
			response.sendRedirect(request.getContextPath() + "/jsp/ViewOpportunityApplicant.jsp");
	}
}
