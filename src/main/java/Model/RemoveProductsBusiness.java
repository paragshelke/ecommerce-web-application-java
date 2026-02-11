package Model;

import java.util.ArrayList;
import java.util.Iterator;

public class RemoveProductsBusiness {
	
	 public void removeProduct(ArrayList<Product> cart, int productId) 
	 {

		 if (cart == null || cart.isEmpty())
		 {
		     return;
		 }
		 
		 Iterator<Product> it = cart.iterator();

	        while (it.hasNext())
	        {
	            Product p = it.next();
	            if (p.getProductId() == productId)
	            {
	                it.remove();
	                break;
	            }
	        }
	 }

}
