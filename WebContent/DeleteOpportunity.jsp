<%@page import="admin.database1"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>delete-opportunity-admin</title>
	</head>

	<body>
	<%
		boolean isLoggedin = (boolean) session.getAttribute("isLoggedin");
		int userID = (int) session.getAttribute("user");
		if(isLoggedin) {
			String job_id = request.getParameter("jobid");
			int jobid = Integer.parseInt(job_id); 
			database1 obj = new database1();
			int count = obj.DeleteDetail(jobid);
			RequestDispatcher dispatch = null;
			PrintWriter outs = response.getWriter();
			if(count>0) {
				String htmlResponse = "<html><script>alert('Deletion Successfull')</script><a href='<%= request.getContextPath() %>/views/ViewOpportunityAdmin.jsp'>Go-Back</a></html>";
			}
			else {
				String htmlResponse = "<html><script>alert('Deletion Failed')</script><a href='<%= request.getContextPath() %>/views/ViewOpportunityAdmin.jsp'>Go-Back</a></html>";
			}
			outs.println(htmlResponse);
			dispatch =request.getRequestDispatcher("ViewOpportunityAdmin.jsp");
			dispatch.forward(request, response);
		}
	%>
	</body>
</html>