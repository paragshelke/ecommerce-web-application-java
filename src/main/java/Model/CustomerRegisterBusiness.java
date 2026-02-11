package Model;

public class CustomerRegisterBusiness {
	
	public boolean registerCustomer(String name, String email, String password,String address, String phone) 
	{
		CustomerRegisterConnectivity ref = new CustomerRegisterJDBC();

		return ref.registerCustomerDb(name,email,password,address,phone);
	}
	

}
