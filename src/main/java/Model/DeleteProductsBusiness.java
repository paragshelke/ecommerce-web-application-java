package Model;

public class DeleteProductsBusiness {

	public boolean getDeleteProducts(int productID) 
	{
		DeleteProductsConnectivity ref = new DeleteProductsJDBC();
		
		return ref.deleteProducts(productID);
	}

}
