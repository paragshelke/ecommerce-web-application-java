package Controller;
import java.io.IOException;

import Model.CustomerLoginBusiness;
import Model.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/customerLogin")
public class CustomerLoginServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		 	HttpSession session = req.getSession(false);
	        
	        if (session != null) 
	        {
	            session.invalidate();
	        } 
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		CustomerLoginBusiness ref = new CustomerLoginBusiness();
		Customer result = ref.isCustomerValid(email,password);
		
		if(	result != null )
		{
			HttpSession ses = req.getSession();
			ses.setMaxInactiveInterval(2*60*60);
			
			ses.setAttribute("customerData",result);
			
			res.sendRedirect("viewProducts");
		}
		else 
		{
			res.sendRedirect("inavlid_Customer_Login.html");
		}
	}

}
