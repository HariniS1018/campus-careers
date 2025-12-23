<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>password-recovery</title>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/recover_password.css">
</head>

<body>
    <form action="RecoveryPassword" onsubmit="return validate()" method="post">

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
        
            <h1 class="heading">RECOVER PASSWORD</h1>
            <hr><br>

            <div class="form-group">
                <label for="uid">User ID</label>
                <input required type="text" id="uid" name="uid" placeholder="user ID">
            </div>
            
            <div class="form-group">
                <label for="npass">New Password</label>
                <input required type="password" id="npass" name="npass" placeholder="new password">
            </div>                    
                
            <div class="form-group">
                <label for="cpass">Confirm Password</label>
                <input required type="password" id="cpass" name="cpass" placeholder="confirm password">
            </div>                    
                
            <div class="form-group">
                <input  type="submit" id="but" value="Submit" onclick="validate()">
                <input type="reset" id="but" value="Reset">
            </div>

        </div>
    </form>

    <script>
        function validate(){
            pass1Obj = document.getElementById("npass")
            pass2Obj = document.getElementById("cpass")
            if(pass1Obj.value === pass2Obj.value){
                return true;
            }
            else{
                alert("password mismatch");
                return false;
            }
        }
    </script>
</body>
</html>
