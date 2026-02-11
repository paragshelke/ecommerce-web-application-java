package Controller;

import java.io.IOException;

import Model.DeleteProductsBusiness;
import Model.UpdateProductsBusiness;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;


//Enable file upload
@MultipartConfig(
fileSizeThreshold = 1024 * 1024,
maxFileSize = 1024 * 1024 * 5,
maxRequestSize = 1024 * 1024 * 10
)
@WebServlet("/updateProduct")
public class UpdateProductsServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		
		  HttpSession ses = req.getSession(false);
		  
		  if (ses == null)
		  {
			  res.sendRedirect("admin_login.html"); 
			  return; 
		  }
		 
		  Boolean isLogin = (Boolean) ses.getAttribute("isLogin");
		  
		  if (isLogin == null || !isLogin)
		  {
			  res.sendRedirect("admin_login.html");
			  return;
	}
		 
		String productid = (String) ses.getAttribute("productID");
		 
		int productId = Integer.parseInt(productid);
		String productName = req.getParameter("productName");	
		double  productPrice = Double.parseDouble(req.getParameter("productPrice"));
		Part filePart = req.getPart("productImage");
	    String productImage = filePart.getSubmittedFileName();
		//String productImage = req.getParameter("productImage");
		String productDescription = req.getParameter("productDescription");
		
				
		UpdateProductsBusiness ref = new UpdateProductsBusiness();
		boolean result = ref.getUpdateProducts(productId,productName,productPrice,productImage,productDescription);
		
		if(result == true)
		{
			res.sendRedirect("product_UpdatedSucess.html");
		}
		else {
			res.sendRedirect("somethingWentWrong.html");
		}
		
	
		
	}

}
