package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import Model.CreditCardCheckBalanceBusiness;
import Model.Order;
import Model.SaveOrderDetailsBusiness;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkBalance")
public class CreditCardCheckBalanceServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		String creditcardnumber=req.getParameter("cardNumber");
		String cardholdername=req.getParameter("cardHolder");
		String cvv=req.getParameter("cvv");
		
		CreditCardCheckBalanceBusiness ref=new CreditCardCheckBalanceBusiness();
		double result=ref.getBalance(creditcardnumber,cardholdername,cvv);
		
		HttpSession ses = req.getSession();
		double totalamount= (double) ses.getAttribute("currentBuyTotalAmount");
		
		ArrayList<Order>  orderList = (ArrayList<Order>) ses.getAttribute("orderDetails");

		  if(totalamount <= result) 
		  { 
			  res.sendRedirect("paymentSuccessfull.html");
			  SaveOrderDetailsBusiness reff = new SaveOrderDetailsBusiness();
			  reff.saveOrderdetails(orderList);
			  
		  }
		  else {
			  res.sendRedirect("insufficientBalance.html");
		  
		  }
		 
		
		
	}
	
	
}
