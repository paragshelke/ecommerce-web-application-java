package Model;

import java.util.ArrayList;

public class ViewProductsBuyBusiness {
	

	public Product getSelectedProduct(ArrayList<Product> productList,int productId)
	{
		Product selectedProduct = null;
		for(Product p:productList)
		{
			if(p.productId == productId)
			{
				 selectedProduct = p;
				break;
			}
		}
		selectedProduct.setProductQuantity(1);
		
		return selectedProduct;
	}

}
