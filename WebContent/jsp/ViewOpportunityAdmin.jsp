<%@page import="java.util.List"%>
<%@page import="model.Interview;"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Boolean isLoggedin = (Boolean) session.getAttribute("isLoggedin");
String role = (String) session.getAttribute("role");
if (isLoggedin != null && isLoggedin){
    if ("admin".equals(role)) {
    %>
        
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="UTF-8">
            <title>view-active-opportunities-admin</title>
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
                    <a href="<%= request.getContextPath() %>/jsp/AddOpportunity.jsp">
                        <div class="side_button">Add Offers</div>
                    </a>
                    <a href="<%= request.getContextPath() %>/jsp/LogOut.jsp">
                        <div class="side_button">Log out</div>
                    </a>
                </div>
            </div>

            <%
                List<Interview> activeInterviews = (List<Interview>) request.getAttribute("activeInterviews");
                    if (activeInterviews != null) {
                        for (Interview interview : activeInterviews) {
            %>
                
                            <div class='card'>
                                <div class='card-title'><%= interview.getDomain() %> - <%= interview.getJobType() %></div>
                                <div class='card-text'>Company: <b><%= interview.getCompanyName() %></b></div>
                                <div class='card-text'>Start Date: <b><%= interview.getStartDate() %></b> for <b><%= interview.getDuration() %></b> months</div>
                                <div class='card-text'>Interview: <b><%= interview.getInterviewTime() %></b> Hrs on <b><%= interview.getInterviewDate() %></b> in <b><%= interview.getVenue() %></b></div>
                                <div class='card-buttons'>
                                    <a href='<%= request.getContextPath() %>/jsp/EditOpportunity.jsp?offer_id=<%= interview.getOfferId() %>'>
                                        <button>Edit</button>
                                    </a>
                                    <a href='<%= request.getContextPath() %>/jsp/DeleteOpportunity.jsp?offer_id=<%= interview.getOfferId() %>'>
                                        <button>Delete</button>
                                    </a>
                                </div>
                            </div>
        
            
            <%      } 
                }
            %>

        </body>
    </html>

<%  }
    else{
        session.setAttribute("errorMessage", "Access denied. Admins only.");
        response.sendRedirect("AdminLogin.jsp");
    } 
} else {
    session.setAttribute("errorMessage", "Please log in to continue.");
    response.sendRedirect("AdminLogin.jsp");
} %>