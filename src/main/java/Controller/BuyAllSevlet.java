package Controller;

import java.io.IOException;
import java.util.ArrayList;

import Model.BuyAllBusiness;
import Model.Customer;
import Model.Order;
import Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/buyAll")
public class BuyAllSevlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		HttpSession ses = req.getSession(false);
		
		if(ses == null)
		{
			res.sendRedirect("customer_login.html");
			return;
		}
		
			Customer customerData = (Customer) ses.getAttribute("customerData");
			
			if (customerData == null)
			{
	            res.sendRedirect("customer_login.html");
	            return;
	        }
			
			ArrayList<Product> cart = (ArrayList<Product>) ses.getAttribute("cartData");
	        
	        if (cart == null || cart.isEmpty()) 
	        {
	            res.sendRedirect("no_productsAvailable.html");
	            return;
	        }
	        
	       BuyAllBusiness ref = new BuyAllBusiness();
	       ArrayList<Order> orderList  = ref.placeOrder(customerData,cart);
	       
	       ses.setAttribute("orderDetails", orderList);
	       
	        
	        res.sendRedirect("buyAll.jsp");
	        
		
		
	}

}
