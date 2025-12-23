package mini_project2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteInDB")
public class DeleteInDB extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteInDB() {
        super();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;
		PreparedStatement pst = null;
		int jobID = Integer.parseInt(request.getParameter("jobID"));
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/AU","root","root");
			pst = con.prepareStatement("delete from interview_details where jobID=?");
			pst.setInt(1, jobID);
			int count = pst.executeUpdate();
			PrintWriter out = response.getWriter();
			
			if(count>0) {
				String htmlResponse = "<html>";
				htmlResponse +="<script>alert('Deleted the offer details successfully')</script>"
							 + "	<div>\r\n"
							 + "    	<a href=\"http://localhost:8080/java_mini_project_2/welcome.jsp\" class=\"home\">\r\n"
							 + "        	<button>home</div></button></a>\r\n"
							 + "         <a href=\"https://www.annauniv.edu/CUICCentre/internship.html\" class=\"home\"><br>\r\n"
							 + "             <button>About</button></a>\r\n"
							 + "     </div>"
							 + "</html>";
				out.println(htmlResponse);
			    out.flush();
			    out.close();
			}
				
			else {
				String htmlResponse = "<html>";
				htmlResponse +="<script>alert('Deletion failed')</script>"
							 + "	<div>\r\n"
							 + "    	<a href=\"http://localhost:8080/java_mini_project_2/welcome.jsp\" class=\"home\">\r\n"
							 + "        	<button>home</div></button></a>\r\n"
							 + "         <a href=\"https://www.annauniv.edu/CUICCentre/internship.html\" class=\"home\"><br>\r\n"
							 + "             <button>About</button></a>\r\n"
							 + "     </div>"
							 + "</html>";
				out.println(htmlResponse);
			    out.flush();
			    out.close();
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
		finally {
			try {
				pst.close();
				con.close();
			} 
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
