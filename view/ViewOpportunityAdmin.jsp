<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="admin.database1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
                <img src="../images/logo.jpg"> 
                <div class="content">CAMPUS CAREERS</div>
            </div>
            <div class="side_buttons">
                <a href="<%= request.getContextPath() %>/views/Index.jsp">
                    <div class="side_button">Home</div>
                </a>
                <a href="<%= request.getContextPath() %>/views/AddOpportunity.jsp">
                    <div class="side_button">Add Offers</div>
                </a>
                <a href="<%= request.getContextPath() %>/views/LogOut.jsp">
                    <div class="side_button">Log out</div>
                </a>
            </div>
        </div>

        <%
        boolean isLoggedin = (boolean) session.getAttribute("isLoggedin");
        int userid = (int) session.getAttribute("user");
        if(isLoggedin) {
            
            database1 obj = new database1();
            List<Map<String, Object>> List1 = new ArrayList<>();
            List1 = obj.view_interview(userid);
            
            for(int i=0;i<List1.size();i++){
                Map<String,Object> inboxMsg = List1.get(i);
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
                <a href='<%= request.getContextPath() %>/views/EditOffer.jsp?job_ID=<%= jobid %>'>
                    <button>Edit</button>                
                </a>
                
                <a href='<%= request.getContextPath() %>/views/DeleteOffer.jsp?jobid=<%=jobid %>'>
                    <button>Delete</button>
                </a>    
            </div>
        </div>
        
        <%}
            }%>

    </body>
</html>