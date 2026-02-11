package Model;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

public class BuyBusinessGetOrderDetails {

	public ArrayList<Order> getOrderDetails(Product p, Customer customerData)
	{
		ArrayList<Order> orderList = new ArrayList<Order>();
		
		 double totalAmount = p.getProductPrice() * p.getProductQuantity();
		  LocalDate deliveryDate = LocalDate.now().plusDays(7);
		  LocalDateTime orderDateTime = LocalDateTime.now();
		
		 Order	o =  new  Order(p.getProductId(),p.getProductName(),p.getProductPrice(),p.getProductQuantity(),totalAmount,deliveryDate,orderDateTime,customerData.getCustomerID(),customerData.getName(),customerData.getAddress(),customerData.getPhone(),customerData.getEmail());

		 orderList.add(o);
		 
		 return orderList;
		
		
	}

}
