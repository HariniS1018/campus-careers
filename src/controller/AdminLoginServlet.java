package admin;

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

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminLoginServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher dispatch = null;
		int user = Integer.parseInt(request.getParameter("uname"));
		String pwd = request.getParameter("pass");
		
		database1 obj = new database1();
		HttpSession session = request.getSession();
		
		
		if( obj.AdminSecure(user,pwd)) {
			session.setAttribute("isLoggedin", true);
			session.setAttribute("user", user);
			boolean isLoggedin = (boolean) session.getAttribute("isLoggedin");
			if(isLoggedin) {
				dispatch = request.getRequestDispatcher("AddOffer.jsp");
				dispatch.forward(request, response);				
			}
		}
		else {
			session.setAttribute("isLoggedin", false);
			PrintWriter out = response.getWriter();
			out.print("<h1>The entered username and password is invalid</h1>");   
		    out.flush();
		    out.close();
		}
	}
}


