package Controller;

import java.io.IOException;
import java.util.ArrayList;

import Model.BuyBusiness;
import Model.BuyBusinessGetOrderDetails;
import Model.Customer;
import Model.Order;
import Model.Product;
import Model.ViewProductsBuyBusiness;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/viewProductsBuy")
public class ViewProductsBuyServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		 HttpSession session = req.getSession(false);
		 
	        if (session == null) 
	        {
	            res.sendRedirect("customer_login.html");
	            return;
	        }
	        
	        Customer c = (Customer) session.getAttribute("customerData");
	        
	        if(c == null)
	        {
	        	res.sendRedirect("customer_login.html");
	        	 return;
	        	
	        }
	        
	        int productId = Integer.parseInt(req.getParameter("productId"));
	        
	        ArrayList<Product> productList = ( ArrayList<Product>) session.getAttribute("productsData");
	        
	        if(productList == null || productList.isEmpty())
	        {
	        	res.sendRedirect("no_productsAvailable.html");
	        	 return;
	        }
	        
	       
	        
	        ViewProductsBuyBusiness ref = new ViewProductsBuyBusiness();
	        
	        Product selectedProduct  = ref.getSelectedProduct(productList,productId);
	        
	        session.setAttribute("singleOrder", selectedProduct);
	        
	        BuyBusinessGetOrderDetails reff = new BuyBusinessGetOrderDetails();
	        ArrayList<Order> orderList = reff.getOrderDetails(selectedProduct,c);
	        
	        session.setAttribute("orderDetails", orderList);
	        
	        res.sendRedirect("ViewProductsBuy.jsp");
	}

}
