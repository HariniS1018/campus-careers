<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>campus-careers</title>
    </head>

    <body>
        <% session.invalidate(); %>

        <h1><font color="Red">You are Sucessfully logged out...</font></h1>
        <a href="<%= request.getContextPath() %>/views/Index.jsp">Go-Back To Home Page</a>

    </body>
</html>