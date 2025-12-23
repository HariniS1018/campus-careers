package mini_project2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.io.PrintWriter;
/*import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.math.BigInteger;
*/
@WebServlet("/Admin")
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Admin() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int dbuser = 0;
		String dbpass = null;
		Connection con = null;
		ResultSet rs = null;
		Statement stmt = null;
		RequestDispatcher dispatch = null;
		int user = Integer.parseInt(request.getParameter("uname"));
		String pwd = request.getParameter("pass");
		String offer = request.getParameter("offer");
		//String pwd2 = getMd5(pwd);
		
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/AU","root","root");
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from Adminsecurity");
			while(rs.next()) {
				dbuser = rs.getInt(1);
				dbpass = rs.getString(2);
			}
			if((user == dbuser) && pwd.equals(dbpass)) {
				if(offer.equals("insert")) {
					dispatch = request.getRequestDispatcher("AdminInsertion.jsp");
					dispatch.forward(request, response);
				}
				else if(offer.equals("delete")) {
					dispatch = request.getRequestDispatcher("AdminDeletion.jsp");
					dispatch.forward(request, response);
				}
				else {
					PrintWriter out = response.getWriter();
					out.print("<h1>The entered offer is invalid</h1>");   
			        out.flush();
			        out.close();
				}
				
			}
			else {
				PrintWriter out = response.getWriter();
				out.print("<h1>The entered username and password is invalid</h1>");   
			    out.flush();
			    out.close();
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
		finally {
			try {
				stmt.close();
				rs.close();
				con.close();
			} 
			catch (SQLException e) {
				e.printStackTrace();
			}
		}

	
	}
/*
	private String getMd5(String pwd) {
		try {
			MessageDigest md = MessageDigest.getInstance("Md5");
			byte[] messageDigest = md.digest(pwd.getBytes());
			BigInteger no = new BigInteger(1,messageDigest);
			String hashtext = no.toString(16);
			while(hashtext.length()<32)
				hashtext = "0" + hashtext;
			return hashtext;
		}
		catch(NoSuchAlgorithmException e) {
			throw new RuntimeException (e);
		}
	}
	*/

}
