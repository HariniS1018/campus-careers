<%@page import="java.util.List"%>
<%@page import="model.Interview"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Boolean isLoggedin = (Boolean) session.getAttribute("isLoggedin");
String role = (String) session.getAttribute("role");
if (isLoggedin != null && isLoggedin){
    if ("applicant".equals(role)) {
    %>
    
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="UTF-8">
            <title>view-my-applications</title>
            <link rel="stylesheet" href="css/header.css">
            <link rel="stylesheet" href="css/view_opportunity.css">
        </head>
        <body>

            <div class="blocks">
                <div class="logo_inner">
                    <img src="images/logo.jpg"> 
                    <div class="content">CAMPUS CAREERS</div>
                </div>
                <div class="side_buttons">
                    <a href="<%= request.getContextPath() %>/views/ViewOpportunityApplicant.jsp">
                        <div class="side_button">View New Opportunities</div>
                    </a>
                    <a href="<%= request.getContextPath() %>/LogOutController">
                        <div class="side_button">Log out</div>
                    </a>
                </div>
            </div>

            <%
            List<Interview> appliedInterviews = (List<Interview>) request.getAttribute("appliedInterviews");
                if (appliedInterviews != null) {
                    for (Interview interview : appliedInterviews) {
            
            %>
        
                        <div class='card'>
                            <div class='card-title'><%= interview.getRole() %></div>
                            <div class='card-text'>Eligible Branches: <b><%= String.join(", ", interview.getEligibleCourses()) %></b></div>
                            <div class='card-text'>Company: <b><%= interview.getCompanyName() %></b></div>
                            <div class='card-text'>Stipend: <b><%= interview.getStipend() %> INR</b> &MediumSpace; &MediumSpace;   CTC: <b><%= interview.getCtc() %> LPA INR</b> </div>
                            <div class='card-text'>Internship Duration: <b><%= interview.getDuration() %></b> months</div>
                            <div class='card-text'>Interview: <b><%= interview.getInterviewTime() %></b> Hrs on <b><%= interview.getInterviewDate() %></b> in <b><%= interview.getInterviewVenue() %></b></div>
                        </div>

            <%  
                    } 
                }
            %>
            
        </body>
    </html>
<% }
    }
    %>