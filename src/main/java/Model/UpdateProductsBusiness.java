package Model;

public class UpdateProductsBusiness {

	public boolean getUpdateProducts(int productId, String productName, double productPrice, String productImage,
			String productDescription) 
	{
		UpdateProductsConnectivity ref = new UpdateProductsJDBC();
		
		return ref.updateproduct(productId,productName,productPrice,productImage,productDescription) ;
	}

}
