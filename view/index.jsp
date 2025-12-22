<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>campus-careers</title>
<link rel="stylesheet" type="text/css" href="./css/index.css">
</head>
<body>
<form>
<div class="screen-container">

    <div class="blocks">
        <div class="logo_inner">
            <img src="../images/logo.jpg"> 
            <div class="content">CAMPUS CAREERS</div>
        </div>
        <div class="side_buttons">
            <a href="http://localhost:8080/campus_careers/views/index.jsp">
                <div class="side_button">Home</div>
            </a>
            <a href="" onclick="scrolldown">
                <div class="side_button">Service</div>
            </a>
            <a href="https://www.annauniv.edu/CUICCentre/internship.html" >
                <div class="side_button">About</div>
            </a>
        </div>
    </div>
    
    <div class="bg_img"> </div>
    
    <div class="buttons">
        <a href="http://localhost:8080/campus_careers/views/AdminLogin.jsp" class="admin_box" id="admin" name="admin">
        ADMIN
        </a>
        
        <a href="http://localhost:8080/campus_careers/views/ApplicantLogin.jsp" class="applicant_box" id="applicant" name="applicant">
        APPLICANT
        </a>
           
    </div>
    
    <div class="footer">
        <div class="footer_msg">Reach us</div>
        <a href=""><img class="footer_icons" src="../images/LinkedIn.jpg"></a>
        <a href=""><img src="../images/email.jpg" ></a>
    </div>
</div>
<script>
    function scrolldown(){
        window.scrollBy(0,400);
    }
</script>
</form>
</body>
</html>