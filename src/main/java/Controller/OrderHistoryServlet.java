package Controller;

import java.io.IOException;
import java.util.ArrayList;

import Model.Customer;
import Model.Order;
import Model.OrderHistoryBusiness;
import Model.ViewOrderBusiness;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orderHistory")
public class OrderHistoryServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		
		HttpSession session = req.getSession(false);
        if (session == null) 
        {
            res.sendRedirect("customer_login.html");
            return;
        }
		
		Customer customer = (Customer) session.getAttribute("customerData");
		
		if (customer == null) 
		{
		    res.sendRedirect("customer_login.html");
		    return;
		}
		
		OrderHistoryBusiness ref = new OrderHistoryBusiness();
		ArrayList<Order> orderList = ref.getHistory(customer.getCustomerID());
			
		session.setAttribute("customerOrderHistoryDetails", orderList);
		
		res.sendRedirect("OrderHistory.jsp");
		
		
	}

}
