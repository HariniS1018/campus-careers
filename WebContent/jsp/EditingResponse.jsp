<%-- <%@page import="java.io.PrintWriter"%>
<%@page import="admin.database1"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>edit-response</title>
	</head>
	<body>
		<%
				String jobid = request.getParameter("jobid");	// offer id
				String dname = request.getParameter("dname");
				String Cname = request.getParameter("Cname");
				String domain = request.getParameter("domain");
				String job_type = request.getParameter("job_type");
				Date StartDate = Date.valueOf(request.getParameter("StartDate"));
				String duration = request.getParameter("duration");
				String venue = request.getParameter("venue");
				Date In_date = Date.valueOf(request.getParameter("In_date"));
				String In_time = request.getParameter("In_time");
				int count=0;
				database1 obj = new database1();
				//int count = obj.EditDetail(jobid,dname,Cname,domain,job_type,StartDate,duration,venue,In_date,In_time);
				RequestDispatcher dispatch = null;
				PrintWriter outs = response.getWriter();
				//System.out.println(jobid);
				if(count>0) {
					String htmlResponse = "<html><body><script>alert('Editing Successfull')</script><a href='<%= request.getContextPath() %>/views/ViewOpportunityAdmin.jsp'>Go-Back</a></body></html>";
				}
				else {
					String htmlResponse = "<html><body><script>alert('Editing failed')</script><a href='<%= request.getContextPath() %>/views/ViewOpportunityAdmin.jsp'>Go-Back</a></body></html>";
				}
				outs.println(htmlResponse);
				dispatch =request.getRequestDispatcher("ViewOpportunityAdmin.jsp");
				dispatch.forward(request, response);
			
		%>
	</body>
</html> --%>