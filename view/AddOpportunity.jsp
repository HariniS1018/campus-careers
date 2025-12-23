<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>add-new-jobs-(admin)</title>
        <link rel="stylesheet" type="text/css" href="./css/header.css">
        <link rel="stylesheet" type="text/css" href="./css/add_opportunity.css">
    </head>

    <body>
        <form action="ViewOpportunityAdmin" method="post">
            <div class="blocks">
                <div class="logo_inner">
                    <img src="images/logo.jpg"> 
                    <div class="content">CAMPUS CAREERS</div>
                </div>
                <div class="side_buttons">
                    <a href="<%= request.getContextPath() %>/views/ViewOpportunityAdmin.jsp">
                        <div class="side_button">View Offers</div>
                    </a>
                    </a>
                    <a href="">
                        <div class="side_button">About</div>
                    </a>
                    <a href="<%= request.getContextPath() %>/views/LogOut.jsp">
                        <div class="side_button">log out</div>
                    </a>
                    
                </div>
            </div>
            
            
            <div class="box">
                
                <h1 class="heading">FILL IN THE DETAILS</h1>
                <hr>
                
                <div class="form-group">
                    <label for="dname">Departments Allowed</label>
                    <input type="text" id="dname" name="dname" required/>
                </div>

                <div class="form-group">
                    <label for="cname">Company Name</label>
                    <input type="text" id="cname" name="cname" required/>
                </div>

                <div class="form-group">
                    <label for="domain">Domain</label>
                    <input type="text" id="domain" name="domain" required/>
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
                    </div>
                </div>

                <div class="form-group">
                    <label for="JStart">Job Start Date</label>
                    <input type="date" id="JStart" name="JStart"/>
                </div>

                <div class="form-group">
                    <label for="duration">Job Duration</label>
                    <input type="text" id="duration" name="duration" value="duration" required/>
                </div>

                <div class="form-group">
                    <label for="venue">Interview Venue</label>
                    <input type="text" id="venue" name="venue" required/>
                </div>

                <div class="form-group">
                    <label for="date">Interview Date</label>
                    <input type="date" id="date" name="date" required/>
                </div>

                <div class="form-group">
                    <label for="time">Interview Time</label>
                    <input type="time" id="time" name="time" required/>
                </div>

                <div class="form-group">
                    <input type="submit" id="but" value="submit"/>
                    <input type="reset" id="but" value="reset"/>
                </div>
                
            </div>
        </form>
    </body>
</html>