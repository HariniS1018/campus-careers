<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="applicant.database2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>apply-offer-(applicant)</title>
	</head>
	
	<body>
	<%
		boolean isLoggedin = (boolean) session.getAttribute("isLoggedin");
		int userid = (int) session.getAttribute("user");
		if(isLoggedin) {
			String jobid = request.getParameter("jobid");
			database2 obj = new database2();
			int count = 0;
			count = obj.ApplyOffer(jobid,userid);
			RequestDispatcher dispatch = null;
			PrintWriter writer = response.getWriter();
			
			if(count>0){
				String htmlResponse = "<html><body><script>alert('Applied Successfully!')</script> <a href='<%= request.getContextPath() %>/views/ViewOpportunityApplicant.jsp'>Go-Back</a></body></html>";
			}
			else{
				String htmlResponse = "<html><body><script>alert('Application Failed!')</script> <a href='<%= request.getContextPath() %>/views/ViewOpportunityApplicant.jsp'>Go-Back</a></body></html>";
			}
			writer.println(htmlResponse);
			dispatch =request.getRequestDispatcher("ViewAppliedOpportunity.jsp");
			dispatch.forward(request,response);
		
		}
		%>
	</body>
</html>