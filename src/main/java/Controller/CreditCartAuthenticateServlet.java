package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import Model.CreditCartAuthenticateBusiness;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/authenticate")
public class CreditCartAuthenticateServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		String creditcardnumber = req.getParameter("cardNumber");
		String cardholdername = req.getParameter("cardHolder");
		String cvv = req.getParameter("cvv");
		
		CreditCartAuthenticateBusiness ref=new CreditCartAuthenticateBusiness();
		boolean result=ref.isValid(creditcardnumber,cardholdername,cvv);
		
		
		if(result == true)
		{
			RequestDispatcher rd = req.getRequestDispatcher("checkBalance");
			rd.forward(req, res);
		}
		else
		{
			res.sendRedirect("invalidUser.html");
		}
	}
}
