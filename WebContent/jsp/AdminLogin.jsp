<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>admin-login</title>
        <link rel="stylesheet" type="text/css" href="./css/header.css">
        <link rel="stylesheet" type="text/css" href="./css/footer.css">
        <link rel="stylesheet" type="text/css" href="./css/login.css">
    </head>

    <body>
        <div class="blocks">
            <div class="logo_inner">
                <img src="images/logo.jpg"> 
                <div class="content">CAMPUS CAREERS</div>
            </div>
            <div class="side_buttons">
                <a href="<%= request.getContextPath() %>/jsp/Index.jsp">
                    <div class="side_button">Home</div>
                </a>
            </div>
        </div>

        <% 
            String reqErrorMsg = (String) request.getAttribute("errorMessage"); %>
            if (reqErrorMsg != null) {
                out.print("<div class='error'>" + reqErrorMsg + "</div>");
            }

            String sessErrorMsg = (String) session.getAttribute("errorMessage");
            if (sessErrorMsg != null) {
                out.print("<div class='error'>" + sessErrorMsg + "</div>");
                session.removeAttribute("sessErrorMsg");
            }
        %>

        <form action="AdminLoginController" method="post" class="form-box">  
            <div class="box">
                <h1 class="heading">ADMIN LOGIN</h1>
                <hr><br>
                <div class="form-group">
                    <label for="uid">Admin ID</label>
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
                <a class="forgotpwd" href="<%= request.getContextPath() %>/jsp/RecoverPassword.jsp">Forgot password?</a>
                    
                <!-- <label for=gen>function</label>
                <select id=gen name=offer>
                <option value="insert">insert</option>
                <option value="delete">delete</option>
                </select>
                <br><br> -->
            </div>
        </form>

        <div class="footer">
            <div class="footer_msg">Reach us</div>
            <a href=""><img class="footer_icons" src="images/LinkedIn.jpg"></a>
            <a href=""><img src="images/email.jpg" ></a>
        </div>
    </body>
</html>
