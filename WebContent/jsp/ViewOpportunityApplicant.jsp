<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
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
            <title>view-active-opportunities-applicant</title>
            <link rel="stylesheet" type="text/css" href="./css/header.css">
            <link rel="stylesheet" type="text/css" href="./css/footer.css">
            <link rel="stylesheet" type="text/css" href="./css/view_opportunity.css">
        </head>

        <body>
            <div class="blocks">
                <div class="logo_inner">
                    <img src="images/logo.jpg"> 
                    <div class="content">CAMPUS CAREERS</div>
                </div>
                <div class="side_buttons">
                    <a href="<%= request.getContextPath() %>/views/ViewAppliedOpportunity.jsp">
                        <div class="side_button">View Applied Offers</div>
                    </a>
                    <a href="<%= request.getContextPath() %>/LogOutController">
                        <div class="side_button">Log out</div>
                    </a>
                </div>
            </div>

            <% 
                String sessMessage = (String) session.getAttribute("message");
                if (sessMessage != null) {
                    out.print("<div class='success'>" + sessMessage + "</div>");
                    session.removeAttribute("message");
                }

                String sessErrorMsg = (String) session.getAttribute("errorMessage");
                if (sessErrorMsg != null) {
                    out.print("<div class='error'>" + sessErrorMsg + "</div>");
                    session.removeAttribute("errorMessage");
                }
                
                List<Interview> activeInterviews = (List<Interview>) request.getAttribute("activeInterviews");
                if (activeInterviews != null) {
                    for (Interview interview : activeInterviews) {
            %>
            
                        <div class='card'>
                            <div class='card-title'><%= interview.getRole() %></div>
                            <div class='card-text'>Eligible Branches: <b><%= String.join(", ", interview.getEligibleCourses()) %></b></div>
                            <div class='card-text'>Company: <b><%= interview.getCompanyName() %></b></div>
                            <div class='card-text'>Stipend: <b><%= interview.getStipend() %> INR</b> &MediumSpace; &MediumSpace;   CTC: <b><%= interview.getCtc() %> LPA INR</b> </div>
                            <div class='card-text'>Internship Duration: <b><%= interview.getDuration() %></b> months</div>
                            <div class='card-text'>Interview: <b><%= interview.getInterviewTime() %></b> Hrs on <b><%= interview.getInterviewDate() %></b> in <b><%= interview.getInterviewVenue() %></b></div>
                            <div class='card-buttons'>
                                <form action="ApplyOpportunity" method="post">
                                    <input type="hidden" name="offer_id" value="<%= interview.getOfferId() %>"/>
                                    <input type="submit" value="Apply"/>
                                </form>
                            </div>
                        </div>
        
            <%      } 
                }
            %>
        
        </body>
    </html>

<% 
    }
    else{
        session.setAttribute("errorMessage", "Access denied. Applicants only.");
        response.sendRedirect("ApplicantLogin.jsp");
    } 
} 
else {
    session.setAttribute("errorMessage", "Please log in to continue.");
    response.sendRedirect("ApplicantLogin.jsp");
} 
%>
