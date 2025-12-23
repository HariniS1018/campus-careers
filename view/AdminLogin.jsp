<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="controller.AdminLoginServlet" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>admin-login</title>
    <link rel="stylesheet" type="text/css" href="./css/header.css">
    <link rel="stylesheet" type="text/css" href="./css/footer.css">
    <link rel="stylesheet" type="text/css" href="./css/admin_login.css">
</head>

<body>
    <form action="AdminLoginServlet" method="post">
        <div class="blocks">
            <div class="logo_inner">
                <img src="images/logo.jpg"> 
                <div class="content">CAMPUS CAREERS</div>
            </div>
            <div class="side_buttons">
                <a href="<%= request.getContextPath() %>/views/Index.jsp">
                    <div class="side_button">Home</div>
                </a>
                <a href="" onclick="scrolldown">
                    <div class="side_button">Service</div>
                </a>
                <a href="" >
                    <div class="side_button">About</div>
                </a>
            </div>
        </div>
        
        <div class="box">
            <h1 class="heading">ADMIN LOGIN</h1>
            <hr><br>
            <div class="form-group">
                <label for="uname">Admin ID</label>
                <input type="number" id="uname" name="uname"/>
                <br>
            </div>
            <div class="form-group">
                <label for="pass">Password</label>
                <input type="password" id="pass" name="pass"/>
                <br>
            </div>
            <div class="form-group">
                <input class="loginbutton" type="submit" id="but" value="submit"/>
                <input class="resetbutton" type="reset" id="but" value="reset"/>
                <br>
            </div>
            <a class="forgotpwd" href="">Forgot password?</a>
                
            <!-- <label for=gen>function</label>
            <select id=gen name=offer>
            <option value="insert">insert</option>
            <option value="delete">delete</option>
            </select>
            <br><br> -->
        </div>

        <div class="footer">
            <div class="footer_msg">Reach us</div>
            <a href=""><img class="footer_icons" src="images/LinkedIn.jpg"></a>
            <a href=""><img src="images/email.jpg" ></a>
        </div>
        
        <script>
            function scrolldown(){
                window.scrollBy(0,400);
            }
        </script>
    </form>
</body>
</html>
