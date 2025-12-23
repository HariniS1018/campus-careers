<%@page import="applicant.database2"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>view-active-opportunities-applicant</title>
        <link rel="stylesheet" type="text/css" href="./css/header.css">
        <link rel="stylesheet" type="text/css" href="./css/footer.css">
        <link rel="stylesheet" type="text/css" href="./css/view_opportunity_admin.css">
    </head>

    <body>
        <%
            boolean isLoggedin = (boolean) session.getAttribute("isLoggedin");
            //boolean whoLoggedin = (boolean) session.getAttribute("whoLoggedin");
            int userID = (int) session.getAttribute("user");
            if(isLoggedin) {
                //if(whoLoggedin){
        %>

        <div class="blocks">
            <div class="logo_inner">
                <img src="../images/logo.jpg"> 
                <div class="content">CAMPUS CAREERS</div>
            </div>
            <div class="side_buttons">
                <a href="<%= request.getContextPath() %>/views/Index.jsp">
                    <div class="side_button">Home</div>
                </a>
                <a href="<%= request.getContextPath() %>/views/ViewAppliedOpportunity.jsp">
                    <div class="side_button">View Applied Offers</div>
                </a>
                <a href="<%= request.getContextPath() %>/views/LogOut.jsp">
                    <div class="side_button">Log out</div>
                </a>
            </div>
        </div>

        <%
        database2 obj = new database2();
        List<Map<String, Object>> List2 = new ArrayList<>();
        List2 = obj.ViewOffers();
        
        for(int i=0;i<List2.size();i++){
            Map<String,Object> inboxMsg = List2.get(i);
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
            
            <div class='card-buttons'>
                <a href ='<%= request.getContextPath() %>/views/ApplyOffer.jsp?jobid=<%=jobid %>'>
                    <button>Apply</button>
                </a>  
            </div>
        </div>
        
        <%} 
    }
    %>

    </body>
</html>