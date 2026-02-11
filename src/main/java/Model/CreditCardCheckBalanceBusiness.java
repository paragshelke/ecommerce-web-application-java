package Model;

public class CreditCardCheckBalanceBusiness {

	public double getBalance(String creditcardnumber, String cardholdername, String cvv)
	{
		CreditCardCheckBalanceConnectivity ref = new CreditCardCheckBalanceJDBC();
		
		return ref.checkBalance(creditcardnumber,cardholdername,cvv);
	}

}
