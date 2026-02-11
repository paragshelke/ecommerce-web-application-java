package Model;

public class AddProductsBusiness {

	public boolean addProducts(int productId, String productName, double productPrice, String productImage,
			String productDescription)
	{
		AddProductsConnectivity ref = new AddProductsJDBC();	
		return ref.setAddProduct(productId,productName,productPrice,productImage,productDescription);
	}

}
