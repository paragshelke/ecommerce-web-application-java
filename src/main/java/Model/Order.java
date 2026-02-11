package Model;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Order {

	 	private int productId;
	    private String productName;
	    private double productPrice;
	    private int productQuantity;
	    private double totalAmount;
	    private LocalDate deliveryDate;
	    private LocalDateTime orderDateTime;
	    private int customerID;
	    private String name;
	    private String address;
	    private String phone;
	    private String email;
	    
	    public Order() {
			
		}
	    
		public Order(int productId, String productName, double productPrice, int productQuantity, double totalAmount,
				LocalDate deliveryDate, LocalDateTime orderDateTime, int customerID, String name, String address,
				String phone, String email) {
			this.productId = productId;
			this.productName = productName;
			this.productPrice = productPrice;
			this.productQuantity = productQuantity;
			this.totalAmount = totalAmount;
			this.deliveryDate = deliveryDate;
			this.orderDateTime = orderDateTime;
			this.customerID = customerID;
			this.name = name;
			this.address = address;
			this.phone = phone;
			this.email = email;
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

		public int getProductQuantity() {
			return productQuantity;
		}

		public void setProductQuantity(int productQuantity) {
			this.productQuantity = productQuantity;
		}

		public double getTotalAmount() {
			return totalAmount;
		}

		public void setTotalAmount(double totalAmount) {
			this.totalAmount = totalAmount;
		}

		public LocalDate getDeliveryDate() {
			return deliveryDate;
		}

		public void setDeliveryDate(LocalDate deliveryDate) {
			this.deliveryDate = deliveryDate;
		}

		public LocalDateTime getOrderDateTime() {
			return orderDateTime;
		}

		public void setOrderDateTime(LocalDateTime orderDateTime) {
			this.orderDateTime = orderDateTime;
		}

		public int getCustomerID() {
			return customerID;
		}

		public void setCustomerID(int customerID) {
			this.customerID = customerID;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getPhone() {
			return phone;
		}

		public void setPhone(String phone) {
			this.phone = phone;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}
	    
	    
}
