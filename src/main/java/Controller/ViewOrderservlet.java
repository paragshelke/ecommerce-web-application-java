package Controller;

import java.io.IOException;
import java.util.ArrayList;

import Model.Order;
import Model.ViewOrderBusiness;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/viewOrder")
public class ViewOrderservlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
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
		
		ViewOrderBusiness ref = new ViewOrderBusiness();
		ArrayList<Order> orderList = ref.getOrderList();
		
		ses.setAttribute("adminOrderDetails", orderList);
		
		res.sendRedirect("View_order.jsp");
				
		
	}

}
