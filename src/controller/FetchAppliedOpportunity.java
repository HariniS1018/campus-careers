package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ApplyInterviewDAO;
import dao.InterviewDAO;
import model.Interview;


@WebServlet("/FetchAppliedOpportunity")
public class FetchAppliedOpportunity extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Integer applicantId = (Integer) session.getAttribute("user");
		ApplyInterviewDAO applyInterviewDAO = new ApplyInterviewDAO();
		
		List<Interview> appliedInterviews = applyInterviewDAO.fetchAppliedOffers(applicantId);
		if (appliedInterviews != null) {
			request.setAttribute("appliedInterviews", appliedInterviews);
			request.getRequestDispatcher("/jsp/ViewAppliedOpportunity.jsp").forward(request, response);
		}
		else {
			request.getSession().setAttribute("errorMessage", "Failed to fetch the details of your applied offers or you haven't applied to any offers yet.");
			response.sendRedirect(request.getContextPath() + "/jsp/ViewOpportunityApplicant.jsp");
		}
	}	
}
