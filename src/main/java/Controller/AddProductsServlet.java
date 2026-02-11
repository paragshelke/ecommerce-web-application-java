package Controller;

import java.io.IOException;

import Model.AddProductsBusiness;
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

@WebServlet("/addProducts")
public class AddProductsServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		HttpSession ses = req.getSession(false);
		
		if (ses == null)
		{
		    res.sendRedirect("admin_login.html");
		    return;
		}
		
		boolean isLogin = (boolean) ses.getAttribute("isLogin");
		
		if (isLogin == false) 
		{
		    res.sendRedirect("admin_login.html");
		    return;
		}
		
		int productId = Integer.parseInt(req.getParameter("productId"));
		String productName = req.getParameter("productName");	
		double  productPrice = Double.parseDouble(req.getParameter("productPrice"));
		Part filePart = req.getPart("productImage");
	    String productImage = filePart.getSubmittedFileName();
		//String productImage = req.getParameter("productImage");
		String productDescription = req.getParameter("productDescription");
		
				
		AddProductsBusiness ref = new AddProductsBusiness();
		boolean result = ref.addProducts(productId,productName,productPrice,productImage,productDescription);
		
		if(result == true)
		{
			res.sendRedirect("productAdded_sucess.html");
		}
		else {
			res.sendRedirect("somethingWentWrong.html");
		}
		
	
	}

}
