package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import Model.CartProductsBusiness;
import Model.Customer;
import Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addToCart")
public class AddToCartServlet  extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		 		int productId = Integer.parseInt(req.getParameter("productid"));
		 		
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
		 
		 		ArrayList<Product> cart = (ArrayList<Product>) session.getAttribute("cartData");
		           
		        if (cart == null) 
		        {
		            cart = new ArrayList<>();
		        }
		 
		        CartProductsBusiness ref = new CartProductsBusiness();
		        
		        
		        boolean found = false;
		        //runs 0 times if cart is empty as size=0 flag remains false
		        for (Product p : cart) 
		        {
		            if (p.getProductId() == productId) 
		            {
		                p.setProductQuantity(p.getProductQuantity() + 1);
		                
		                found = true;

		                session.setAttribute("addedProduct", p);
		                break;
		            }
		        }
		        
		        if(found == false) 
		        {
		        	Product product = ref.getProductById(productId);
		        	
		        	if (product != null) 
		        	{
		        		product.setProductQuantity(1);;
		        		
		        		cart.add(product);
			        
			        	session.setAttribute("addedProduct",product);
		        		
		        	}
		        	else
		        	{
		        		res.sendRedirect("no_productsAvailable.html");
		        		return;
		        	}
		        	
		        }
		        	session.setAttribute("cartData", cart);
		      
		        	res.sendRedirect("addedto_Cart.jsp");
		       	        
		        
	}

}
