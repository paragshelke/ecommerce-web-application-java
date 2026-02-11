package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CreditCartAuthenticateJDBC implements CreditCartAuthenticateConnectivity {

	@Override
	public boolean checkUser(String creditcardnumber, String cardholdername, String cvv) 
	{
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/creditcard","root","21122001m");
			
			String query="select * from users where CreditCardNumber=? and CardHolderName=? and CVV=?";
					
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setString(1, creditcardnumber);
			pstmt.setString(2, cardholdername);
			pstmt.setString(3, cvv);
		
			ResultSet rs=pstmt.executeQuery();
			
			return rs.next();
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return false;
		
		
	}

}
