package Model;

import java.util.ArrayList;

public class ViewProductsBusiness {

	public ArrayList<Product> getProducts() 
	{
		ViewProductsConnectivity ref = new ViewProductsJDBC();
		return ref.getProductsDetails();
	}
	
	
}
