package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import Model.CustomerLoginBusiness;
import Model.CustomerRegisterBusiness;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/customerRegister")
public class CustomerRegisterServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String address = req.getParameter("address");
		String phone = req.getParameter("phone");
		
		CustomerRegisterBusiness ref = new CustomerRegisterBusiness();
		boolean result = ref.registerCustomer(name,email,password,address,phone);
		
		if(result == true)
		{
			res.sendRedirect("customer_login.html");
		}
		else 
		{
			res.sendRedirect("registration_failed.html");
		}
	}

}
