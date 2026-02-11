package Model;

import java.util.ArrayList;

public class ViewUserBusiness {

	public ArrayList<Customer> getCustomerList() 
	{
		ViewCustomerConnectivity ref = new ViewCustomerJDBC();

		return ref.getCustomerDetails();
	}

}
