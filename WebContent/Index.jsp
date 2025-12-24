<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>campus-careers</title>
        <link rel="stylesheet" type="text/css" href="./css/header.css">
        <link rel="stylesheet" type="text/css" href="./css/footer.css">
        <link rel="stylesheet" type="text/css" href="./css/index.css">
    </head>

    <body>
        <form>
            <div class="blocks">
                <div class="logo_inner">
                    <img src="images/logo.jpg"> 
                    <div class="content">CAMPUS CAREERS</div>
                </div>
            </div>
            
            <div class="bg_img"> </div>
            
            <div class="buttons">
                <a href="<%= request.getContextPath() %>/view/AdminLogin.jsp" class="admin_box" id="admin" name="admin">
                ADMIN
                </a>
                
                <a href="<%= request.getContextPath() %>/view/ApplicantLogin.jsp" class="applicant_box" id="applicant" name="applicant">
                APPLICANT
                </a>
                
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