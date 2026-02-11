package Controller;

import java.io.IOException;
import java.util.ArrayList;

import Model.Product;
import Model.ViewProductsBusiness;
import Model.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/viewProducts")
public class ViewProductsServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		/*
		 * HttpSession ses = req.getSession(false);
		 * 
		 * if (ses == null) { res.sendRedirect("customer_login.html"); return; }
		 */
		  
			/*
			 * Customer customer = (Customer) ses.getAttribute("customerData"); if (customer
			 * == null) { res.sendRedirect("customer_login.html"); return; }
			 */
			 

		ViewProductsBusiness ref = new ViewProductsBusiness();
		ArrayList<Product> productList = ref.getProducts();

		if (!productList.isEmpty()) 
		{
			HttpSession session = req.getSession();
			session.setAttribute("productsData", productList);

			res.sendRedirect("view_Products.jsp");
		} 
		else {
			
			res.sendRedirect("no_productsAvailable.html");
		}

	}

}
