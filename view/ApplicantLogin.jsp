<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="controller.ApplicantLoginServlet" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>applicant-login</title>
        <link rel="stylesheet" type="text/css" href="./css/header.css">
        <link rel="stylesheet" type="text/css" href="./css/footer.css">
        <link rel="stylesheet" type="text/css" href="./css/login.css">
    </head>
    
    <body>
        <div class="blocks">
            <div class="logo_inner">
                <img src="../images/logo.jpg"> 
                <div class="content">CAMPUS CAREERS</div>
            </div>
            <div class="side_buttons">
                <a href="<%= request.getContextPath() %>/view/Index.jsp">
                    <div class="side_button">Home</div>
                </a>
            </div>
        </div>
        
        <form action="ApplicantLoginServlet" method="post" class="form-box">    
            <div class="box">
                <h1 class="heading">APPLICANT LOGIN</h1>
                <hr><br>
                <div class="form-group">
                    <label for="uid">Applicant ID</label>
                    <input type="number" id="uid" name="uid"/>
                    <br>
                </div>
                <div class="form-group">
                    <label for="pwd">Password</label>
                    <input type="password" id="pwd" name="pwd"/>
                    <br>
                </div>
                <div class="form-group">
                    <input class="loginbutton" type="submit" id="submit" value="submit"/>
                    <input class="resetbutton" type="reset" id="reset" value="reset"/>
                    <br>
                </div>
                <a class="forgotpwd" href="<%= request.getContextPath() %>/view/RecoverPassword.jsp">Forgot password?</a>
            </div>
        </form>

        <div class="footer">
            <div class="footer_msg">Reach us</div>
            <a href=""><img class="footer_icons" src="images/LinkedIn.jpg"></a>
            <a href=""><img src="images/email.jpg" ></a>
        </div>
        
    </body>
</html>