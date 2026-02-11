package Model;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

public class SaveOrderDetailsBusiness {

	public void saveOrderdetails(ArrayList<Order> orderList) 
	{
		SaveOrderDetailsConnectivity ref = new SaveOrderDetailsJDBC();

		  for(Order o:orderList)
		  {  
			    ref.saveOrder(o.getProductId(),o.getProductName(),o.getProductPrice(),o.getProductQuantity(),o.getTotalAmount(),o.getDeliveryDate(),o.getOrderDateTime(),o.getCustomerID(),o.getName(),o.getAddress(),o.getPhone(),o.getEmail());
							  			 
		  }	
	}

}
