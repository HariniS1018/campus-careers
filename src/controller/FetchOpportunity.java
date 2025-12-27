package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.InterviewDAO;
import model.Interview;


@WebServlet("/FetchOpportunity")
public class FetchOpportunity extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String offerIdParam = request.getParameter("offer_id");
		if (offerIdParam != null) {
			int offerId = Integer.parseInt(offerIdParam);
		
			InterviewDAO interviewDAO = new InterviewDAO();
			Interview interview = interviewDAO.getInterview(offerId);
			if (interview != null) {
				request.setAttribute("interview", interview);
				response.sendRedirect(request.getContextPath() + "/jsp/EditOpportunity.jsp");
			}
			else {
				request.getSession().setAttribute("errorMessage", "Failed to fetch the details of offer.");
				response.sendRedirect(request.getContextPath() + "/jsp/ViewOpportunityAdmin.jsp");
			}
		}
		else{
			request.getSession().setAttribute("errorMessage", "Missing offer_id parameter");
			response.sendRedirect(request.getContextPath() + "/jsp/ViewOpportunityAdmin.jsp");
		}
        
	}	
}
