package Controller;

import java.io.IOException;
import java.util.ArrayList;

import Model.Product;
import Model.RemoveProductsBusiness;
import Model.ViewCartBusiness;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/removeFromCart")
public class RemoveFromCartServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{

		HttpSession session = req.getSession(false);
	
		if (session == null)
		{
		    res.sendRedirect("customer_login.html");
		    return;
		}

	
		ArrayList<Product> cart = (ArrayList<Product>) session.getAttribute("cartData");
		
		if (cart == null) 
		{
		    res.sendRedirect("viewCart");
		    return;
		}

		int productId = Integer.parseInt(req.getParameter("productId"));
		
		RemoveProductsBusiness ref = new RemoveProductsBusiness();
		ref.removeProduct(cart, productId);

		ViewCartBusiness business = new ViewCartBusiness();
		double newTotal = business.getTotalAmount(cart);

		session.setAttribute("cartData", cart);
		session.setAttribute("cartproductsTotalAmount", newTotal);

		res.sendRedirect("viewCart");
	}
}
