<%@page import="model.Interview"%>
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
            <title>edit-opportunity-admin</title>
            <link rel="stylesheet" type="text/css" href="./css/header.css">
            <link rel="stylesheet" type="text/css" href="./css/add_opportunity.css">
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
                    <a href="<%= request.getContextPath() %>/jsp/ViewOpportunityAdmin.jsp">
                        <div class="side_button">View Offers</div>
                    </a>
                    <a href="<%= request.getContextPath() %>/LogOutController">
                        <div class="side_button">Log out</div>
                    </a>
                </div>
            </div>


            <%
            Interview interview = (Interview) request.getAttribute("interview");
                if (interview != null) {
                
            %>

                <form action="EditOpportunity" method="post" class="form-box">
                    <div class="box">
                        
                        <h1 class="heading">EDIT FORM</h1>
                        <hr>
                        
                        <div class="dropdown-group">
                            <label for="eligible_courses">Eligible Courses <small>Select multiple courses by holding Ctrl (Windows) or Command (Mac).</small></label>
                            <select class="select-box" id="eligible_courses" name="eligible_courses" multiple size="6" required></select>
                        </div>

                        <%
                            String selectedCourses = new com.google.gson.Gson().toJson(interview.getEligibleCourses());
                        %>

                        <script>
                            const departments = {
                                "CS": "Computer Science Engineering",
                                "IT": "Information Technology",
                                "Mech": "Mechanical Engineering",
                                "ECE": "Electronics & Communication",
                                "EEE": "Electrical & Electronics",
                                "Civil": "Civil Engineering",
                                "BioTech": "Biotechnology",
                            };
                        
                            const selectBox = document.getElementById("eligible_courses");
                        
                            for (const [value, label] of Object.entries(departments)) {
                                const option = document.createElement("option");
                                option.value = value;
                                option.textContent = label;
                                if (selectedCourses.includes(value)) {
                                    option.selected = true;
                                }
                                // option.classList.add("option-box");
                                selectBox.appendChild(option);
                            }
                        </script>

                        <div class="form-group">
                            <label for="company_name">Company Name</label>
                            <input type="text" id="company_name" name="company_name" value="<%= interview.getCompanyName() %>" placeholder="ABC Company" required/>
                        </div>
        
                        <div class="form-group">
                            <label for="role">Role</label>
                            <input type="text" id="role" name="role" value="<%= interview.getRole() %>" placeholder="Software Engineering" required/>
                        </div>
        
                        <div class="form-group">
                            <label for="stipend">Stipend</label>
                            <input type="number" id="stipend" name="stipend" value="<%= interview.getStipend() %>" placeholder="in thousands (INR)" required/>
                        </div>
        
                        <div class="form-group">
                            <label for="CTC">CTC</label>
                            <input type="number" id="CTC" name="CTC" value="<%= interview.getCtc() %>" placeholder="in LPA (INR)" required/>
                        </div>
        
                        <div class="form-group">
                            <label for="duration">Internship Duration</label>
                            <input type="number" id="duration" name="duration" value="<%= interview.getDuration() %>" placeholder="in months" required/>
                        </div>
        
                        <div class="form-group">
                            <label for="interview_venue">Interview Venue</label>
                            <input type="text" id="interview_venue" name="interview_venue" value="<%= interview.getInterviewVenue() %>" placeholder="Company Premise" required/>
                        </div>
        
                        <div class="form-group">
                            <label for="interview_date">Interview Date</label>
                            <input type="date" id="interview_date" name="interview_date" value="<%= interview.getInterviewDate().toString() %>" required/>
                        </div>
        
                        <div class="form-group">
                            <label for="interview_time">Interview Time (24 Hrs)</label>
                            <input type="time" id="interview_time" name="interview_time" value="<%= interview.getInterviewTime().toString() %>" required/>
                        </div>

                        <input type="hidden" name="offer_id" value="<%= interview.getOfferId() %>"/>
        
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
<% }
    }
    %>