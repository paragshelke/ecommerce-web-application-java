package Model;

public class CartProductsBusiness {

	public Product getProductById(int productId) 
	{
		CartProductsConnectivity ref = new CartProductsJDBC();
		 return ref.productById(productId);
	}
	
	

}
