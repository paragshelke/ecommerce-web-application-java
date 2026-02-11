package Controller;

import java.io.IOException;
import java.util.ArrayList;

import Model.Customer;
import Model.Order;
import Model.ViewOrderBusiness;
import Model.ViewUserBusiness;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/viewUsers")
public class ViewUserServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		HttpSession ses = req.getSession(false);
		
		if (ses == null)
		{
		    res.sendRedirect("admin_login.html");
		    return;
		}
		
		boolean isLogin = (boolean) ses.getAttribute("isLogin");
		
		if (isLogin == false) 
		{
		    res.sendRedirect("admin_login.html");
		    return;
		}
		
		ViewUserBusiness ref = new ViewUserBusiness();
		ArrayList<Customer> customerList = ref.getCustomerList();
		
		ses.setAttribute("customerDetails", customerList);
		
		res.sendRedirect("View_Users.jsp");
	}

}
