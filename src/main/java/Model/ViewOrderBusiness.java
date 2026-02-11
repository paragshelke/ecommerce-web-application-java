package Model;

import java.util.ArrayList;

public class ViewOrderBusiness {

	public ArrayList<Order> getOrderList()
	{
		ViewOrderConnectivity ref = new ViewOrderJDBC();

		return ref.getOrderDetails();
	}

}
