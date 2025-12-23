<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>add-new-jobs-(admin)</title>
    <link rel="stylesheet" type="text/css" href="./css/header.css">
    <link rel="stylesheet" type="text/css" href="./css/add_new_offer.css">
</head>

<body>
    <form action="Interview_details" method="post">
        <div class="blocks">
            <div class="logo_inner">
                <img src="../images/logo.jpg"> 
                <div class="content">CAMPUS CAREERS</div>
            </div>
            <div class="side_buttons">
                <a href="<%= request.getContextPath() %>/views/Index.jsp">
                    <div class="side_button">Home</div>
                </a>
                <a href="<%= request.getContextPath() %>/views/Index.jsp">
                    <div class="side_button">View Offers</div>
                </a>
                </a>
                <a href="<%= request.getContextPath() %>/views/Index.jsp">
                    <div class="side_button">About</div>
                </a>
                <a href="<%= request.getContextPath() %>/views/Index.jsp">
                    <div class="side_button">log out</div>
                </a>
                
            </div>
        </div>
        
        
        <div class="box">
        <table>
            <tr><h1 class="heading">FILL IN THE DETAILS</h1></tr>
            
            <hr>
            
                <div class="form-group">
                    <label for="dname">Departments Allowed</label>
                    <input type="text" id="dname" name="dname" required/>
                </div>

                <div class="form-group">
                    <label for="cname">Company name</label>
                    <input type="text" id="cname" name="cname" required/>
                </div>

                <div class="form-group">
                    <label for="domain">Domain</label>
                    <input type="text" id="domain" name="domain" required/>
                </div>

                <div class="form-group">
                    <label>Job type</label>
                    <div class="radio-inputs">
                        <label>
                            <input type="checkbox" name="JT" required />
                            Placement
                        </label>
                        <label>
                            <input type="checkbox" name="JT" required />
                            Internship
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="JStart">Job Start date</label>
                    <input type="date" id="JStart" name="JStart"/>
                </div>

                <div class="form-group">
                    <label for="JEnd">Job End date</label>
                    <input type="date" id="JEnd" name="JEnd"/>
                </div>

                <div class="form-group">
                    <label for="venue">Interview venue:</label>
                    <input type="text" id="venue" name="venue" required/>
                </div>

                <div class="form-group">
                    <label for="date">Interview date</label>
                    <input type="date" id="date" name="date" required/>
                </div>

                <div class="form-group">
                    <label for="time">Interview time</label>
                    <input type="time" id="time" name="time" required/>
                </div>

                <div class="form-group">
                    <input type="submit" id="but" value="submit"/>
                    <input type="reset" id="but" value="reset"/>
                </div>
        </table>
        </div>
    </form>
</body>
</html>