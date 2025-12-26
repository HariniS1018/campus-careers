package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.InterviewDAO;

@WebServlet("/DeleteOpportunity")
public class DeleteOpportunity extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		
			String offerIdParam = request.getParameter("offer_id");
			if (offerIdParam != null) {
				int offerId = Integer.parseInt(offerIdParam);
				InterviewDAO interviewDAO = new InterviewDAO();
				if (interviewDAO.deactivateInterview(offerId)) {
					request.getSession().setAttribute("message", "Deleted the offer details successfully");
				} else {
					request.getSession().setAttribute("errorMessage", "Failed to delete the offer details");
				}
			} 
			else {
				request.getSession().setAttribute("errorMessage",  "Missing offer_id parameter");
			}
			
			response.sendRedirect(request.getContextPath() + "/jsp/ViewOpportunityAdmin.jsp");
	}
}
