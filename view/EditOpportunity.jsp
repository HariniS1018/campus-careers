<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="admin.database1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>edit-opportunity-admin</title>
        <link rel="stylesheet" type="text/css" href="./css/header.css">
        <link rel="stylesheet" type="text/css" href="./css/add_opportunity.css">
    </head>
    <body>

        <%
        boolean isLoggedin = (boolean) session.getAttribute("isLoggedin");
        int userID = (int) session.getAttribute("user");
        if(isLoggedin) {
            
            String jobid = request.getParameter("job_ID");
            int job = Integer.parseInt(jobid); 
            database1 obj = new database1();
            Map<String, Object> inboxMsg = null;
            inboxMsg = obj.ViewEditingDetail(job);
            String dname = null,Cname = null,domain = null,job_type = null,StartDate = null,duration = null,venue = null,In_date = null,In_time  = null;
            dname = (String) inboxMsg.get("dname");
            Cname = (String) inboxMsg.get("Cname");
            domain = (String) inboxMsg.get("domain");
            job_type = (String) inboxMsg.get("job_type");
            StartDate = (String) inboxMsg.get("StartDate");
            duration = (String) inboxMsg.get("duration");
            venue = (String) inboxMsg.get("venue");
            In_date = (String) inboxMsg.get("In_date");
            In_time = (String) inboxMsg.get("In_time");
            //jobid = (String) inboxMsg.get("jobID");   
        %>

        <form action="EditingOffer" method="post">
            
            <div class="blocks">
                <div class="logo_inner">
                    <img src="images/logo.jpg"> 
                    <div class="content">CAMPUS CAREERS</div>
                </div>
                <div class="side_buttons">
                    <a href="<%= request.getContextPath() %>/views/AddOpportunity.jsp">
                        <div class="side_button">Add Offers</div>
                    </a>
                    <a href="<%= request.getContextPath() %>/views/ViewOpportunityAdmin.jsp">
                        <div class="side_button">View Offers</div>
                    </a>
                    <a href="<%= request.getContextPath() %>/views/LogOut.jsp">
                        <div class="side_button">Log out</div>
                    </a>
                </div>
            </div>

            <div class="box">
                <h1 class="heading">EDIT THE DETAIL</h1>
                <hr>
                <div class="form-group">
                    <label for="dname">Departments Allowed</label>
                    <input type="text" id="dname" name="<%=dname %>" required/>
                </div>

                <div class="form-group">
                    <label for="Cname">Company Name</label>
                    <input type="text" id="Cname" name="Cname" value="<%=Cname %>"required/>
                </div>

                <div class="form-group">
                    <label for="domain">Domain</label>
                    <input type="text" id="domain" name="domain" value="<%=domain %>"required/>
                </div>

                <div class="form-group">
                    <label>Job Type</label>
                    <div class="radio-inputs">
                        <label>
                            <input type="checkbox" name="JT" required />
                            Full-Time
                        </label>
                        <label>
                            <input type="checkbox" name="JT" required />
                            Internship
                        </label>
                        </select value="<%=job_type %>">
                    </div>
                </div>

                <div class="form-group">
                    <label for="StartDate">Job Start date</label>
                    <input type="date" id="StartDate" name="StartDate" value="<%=StartDate %>" required/>
                </div>

                <div class="form-group">
                    <label for="duration">Job Duration</label>
                    <input type="text" id="duration" name="duration" value="<%=duration %>" required/>
                </div>

                <div class="form-group">
                    <label for="venue">Interview Venue</label>
                    <input type="text" id="venue" name="venue" value="<%=venue %>" required/>
                </div>

                <div class="form-group">
                    <label for="In_date">Interview Date</label>
                    <input type="date" id="In_date" name="In_date" value="<%=In_date %>" required/>
                </div>

                <div class="form-group">
                    <label for="In_time">Interview Time</label>
                    <input type="time" id="In_time" name="In_time" value="<%=In_time %>" required/>
                </div>

                <div class="form-group">
                    <input type="submit" id="but" value="submit"/>
                    <input type="reset" id="but" value="reset"/>
                </div>
            </div>
        </form>
        
    <%}
        %>
    </body>
</html>