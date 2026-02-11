package Controller;

import java.io.IOException;
import java.util.ArrayList;

import Model.Product;
import Model.ViewCartBusiness;
import Model.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/viewCart")
public class ViewCartServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		  HttpSession ses = req.getSession(false);
			
			if (ses == null)
			{
			    res.sendRedirect("customer_login.html");
			    return;
			}
			
			Customer customer = (Customer) ses.getAttribute("customerData");
			if (customer == null) 
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
		 
		  ViewCartBusiness ref = new ViewCartBusiness();
		  double totalamount = ref.getTotalAmount(cart);
		  
		  ses.setAttribute("cartproductsTotalAmount", totalamount);
		  res.sendRedirect("view_CartProducts.jsp");
		  	
	}

}
