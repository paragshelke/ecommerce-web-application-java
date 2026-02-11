package Model;

import java.util.ArrayList;

public class OrderHistoryBusiness {

	public ArrayList<Order> getHistory(int customerID)
	{		
		OrderHistoryConnectivity ref = new OrderHistoryJDBC();
		
		return ref.getCustomerOrderHistory(customerID);
		
	}

}
