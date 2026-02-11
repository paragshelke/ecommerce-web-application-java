package Model;

public class Product {

	int productId;
	String productName;
	double productPrice;
	String productImage;
	String ProductDescription;
	int productQuantity;
	
	public Product() {
		
	}
	
	public Product(int productId, String productName, double productPrice, String productImage,
			String ProductDescription, int productQuantity) {
		
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productImage = productImage;
		this.ProductDescription = ProductDescription;
		this.productQuantity = productQuantity;
	}
	
	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public double getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
	
	public String getProductDescription() {
		return ProductDescription;
	}

	public void setProductDescription(String ProductDescription) {
		this.ProductDescription = ProductDescription;
	}
	
}
