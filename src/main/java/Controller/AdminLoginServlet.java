package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import Model.AdminLoginBusiness;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		AdminLoginBusiness ref = new AdminLoginBusiness();
		boolean result  = ref.isAdminValid(email,password);
		
		if(result == true)
		{
			HttpSession ses = req.getSession();
			ses.setMaxInactiveInterval(2*60*60);
			ses.setAttribute("isLogin", result);
			
			RequestDispatcher rd = req.getRequestDispatcher("adminServlet");
			rd.forward(req, res);
			
			
		}
		else 
		{
			res.sendRedirect("inavlid_Admin_Login.html");
		}
	}

}
