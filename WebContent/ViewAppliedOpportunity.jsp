<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="applicant.database2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
                <a href="<%= request.getContextPath() %>/views/LogOut.jsp">
                    <div class="side_button">Log out</div>
                </a>
            </div>
        </div>

        <div class='card'>
            <div class='card-title'>Software Engineering - Full Time</div>
            <div class='card-text'>Company: <b>ABC</b> </div>
            <div class='card-text'>Start Date: <b>01-01-2026</b> for <b>6</b> months</div>
            <div class='card-text'>Interview: <b>09:00</b> Hrs on <b>25-12-2025</b> in <b>CUIC</b></div>
        </div>
        

        <%
            boolean isLoggedin = (boolean) session.getAttribute("isLoggedin");
            int userid = (int) session.getAttribute("user");
            if(isLoggedin) {
                //String jobid = request.getParameter("jobid");
                database2 obj = new database2();
                List<Map<String, Object>> List3 = new ArrayList<>();
                List3 = obj.AppliedOffers(userid);
                
                for(int i=0;i<List3.size();i++){
                    Map<String,Object> inboxMsg = List3.get(i);
                    String Cname = (String) inboxMsg.get("Cname");
                    String domain = (String) inboxMsg.get("domain");
                    String job_type = (String) inboxMsg.get("job_type");
                    String StartDate = (String) inboxMsg.get("StartDate");
                    String duration = (String) inboxMsg.get("duration");
                    String venue = (String) inboxMsg.get("venue");
                    String In_date = (String) inboxMsg.get("In_date");
                    String In_time = (String) inboxMsg.get("In_time");
                    String jobid = (String) inboxMsg.get("jobID");
        %>
    
        <div class='card'>
            <div class='card-title'><%=domain %> - <%=job_type %></div>
            <div class='card-text'>Company: <b><%=Cname %></b> </div>
            <div class='card-text'>Start Date: <b><%=StartDate %></b> for <b><%=duration %></b> months</div>
            <div class='card-text'>Interview: <b><%=In_time %></b> Hrs on <b><%=In_date %></b> in <b><%=venue %></b></div>
        </div>
        
        <%}
            }%>
        
    </body>
</html>