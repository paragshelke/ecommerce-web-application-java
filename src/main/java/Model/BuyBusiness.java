package Model;

import java.util.ArrayList;

public class BuyBusiness {

	public Product getSelectedProduct(ArrayList<Product> cart,int productId)
	{
		Product selectedProduct = null;
		for(Product p:cart)
		{
			if(p.productId == productId)
			{
				 selectedProduct = p;
				break;
			}
		}
				
		return selectedProduct;
	}

}
