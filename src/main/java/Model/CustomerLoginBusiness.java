package Model;

public class CustomerLoginBusiness {
	
	public Customer isCustomerValid(String email, String password)
	{
		CustomerLoginConectivity ref = new CustomerLoginJDBC();
		return ref.checkCustomer(email,password);
	}

}
