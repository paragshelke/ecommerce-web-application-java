package Controller;

import java.io.IOException;
import java.util.ArrayList;

import Model.Product;
import Model.ViewProductsBusiness;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminServlet")
public class AdminServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		
		ViewProductsBusiness ref = new ViewProductsBusiness();
		ArrayList<Product> productList = ref.getProducts();
		
		if (!productList.isEmpty()) 
		{
			HttpSession session = req.getSession();
			session.setAttribute("productsData", productList);

			res.sendRedirect("admin_Dashboard.jsp");
		} 
		else {
			
			res.sendRedirect("no_productsAvailable.html");
		}

	}

}
