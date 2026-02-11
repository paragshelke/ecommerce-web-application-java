package Controller;

import java.io.IOException;

import Model.DeleteProductsBusiness;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/removeProducts")
public class RemoveProductsServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		int productId = Integer.parseInt(req.getParameter("productId"));
		
		DeleteProductsBusiness ref = new DeleteProductsBusiness();
		boolean result = ref.getDeleteProducts(productId);
		
		if(result == true)
		{
			res.sendRedirect("product_DeletedSucess.html");
		}
		else {
			
			res.sendRedirect("somethingWentWrong.html");
		}
	}

}
