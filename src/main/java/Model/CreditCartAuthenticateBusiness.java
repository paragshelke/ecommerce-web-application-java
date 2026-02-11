package Model;

public class CreditCartAuthenticateBusiness {

	public boolean isValid(String creditcardnumber, String cardholdername, String cvv)
	{
		CreditCartAuthenticateConnectivity ref = new CreditCartAuthenticateJDBC();
		
		return ref.checkUser(creditcardnumber,cardholdername,cvv);
	}
	

}
