package applicant;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ApplicantLoginServlet")
public class ApplicantLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ApplicantLoginServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = null;
		int user = Integer.parseInt(request.getParameter("uname"));
		String pwd = request.getParameter("pass");
		
		database2 obj = new database2();
		HttpSession session = request.getSession();

		if( obj.ApplicantSecure(user,pwd)) {
			session.setAttribute("isLoggedin", true);
			//session.setAttribute("whoLoggedin", "Applicant");
			session.setAttribute("user", user);
			boolean isLoggedin = (boolean) session.getAttribute("isLoggedin");
			//String whoLoggedin = (String) session.getAttribute("whoLoggedin");
			if(isLoggedin) {
				dispatch = request.getRequestDispatcher("ViewOffers.jsp");
				dispatch.forward(request, response);
			}
		}
		else {
			PrintWriter out = response.getWriter();
			out.print("<h1>The entered username and password is invalid</h1>");   
		    out.flush();
		    out.close();
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

