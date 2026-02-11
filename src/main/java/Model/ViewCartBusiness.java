package Model;

import java.util.ArrayList;

public class ViewCartBusiness {
	
	public double getTotalAmount( ArrayList<Product> cart) 
	{
		double totalamount = 0;
		for(Product p:cart)
		{
			totalamount = totalamount +(p.getProductPrice() * p.getProductQuantity());
		}
		 
		 return totalamount;
	}
	

}
