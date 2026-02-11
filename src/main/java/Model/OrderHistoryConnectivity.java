package Model;

import java.util.ArrayList;

public interface OrderHistoryConnectivity {

	ArrayList<Order> getCustomerOrderHistory(int customerID);

}
