package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.InterviewDAO;
import model.Interview;


@WebServlet("/AddOpportunity")
public class AddOpportunity extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String companyName = request.getParameter("company_name");
		String role = request.getParameter("role");
		int stipend = Integer.parseInt(request.getParameter("stipend"));
		double ctc = Double.parseDouble(request.getParameter("CTC"));
		int duration = Integer.parseInt(request.getParameter("duration"));
		String interviewVenue = request.getParameter("interview_venue");
		LocalDate interviewDate = LocalDate.parse(request.getParameter("interview_date"));
		LocalTime interviewTime = LocalTime.parse(request.getParameter("interview_time"));

		int adminId = (int) session.getAttribute("user");
		
		Interview interview = new Interview(
			companyName,
			role,
			stipend,
			ctc,
			duration,
			interviewVenue,
			interviewDate,
			interviewTime,
			adminId
		);
		InterviewDAO interviewDAO = new InterviewDAO(); 

		if (interviewDAO.addInterview(interview)) {
			String[] eligibleCoursesArray = request.getParameterValues("eligible_courses");
			if (eligibleCoursesArray != null) {
				List<String> eligibleCourses = Arrays.asList(eligibleCoursesArray);
				interviewDAO.addEligibleCoursesforInterview(interview.getOfferId(), eligibleCourses);
				if (interviewDAO.addEligibleCoursesforInterview(interview.getOfferId(), eligibleCourses)) {
					request.getSession().setAttribute("message", "New Offer Added successfully!");
				} else {
					request.getSession().setAttribute("errorMessage", "Failed to add One or More Eligible Branch (course) for this offer.");
				}
			}
			else{
				request.getSession().setAttribute("errorMessage", "No Eligible Branch (course) selected for this offer.");
			}
			
		} else {
			request.getSession().setAttribute("errorMessage", "Failed to add new offer.");
		}
        response.sendRedirect(request.getContextPath() + "/jsp/ViewOpportunityAdmin.jsp");
	}	
}
