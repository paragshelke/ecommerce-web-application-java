package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CustomerRegisterJDBC implements CustomerRegisterConnectivity {

	@Override
	public boolean registerCustomerDb(String name, String email, String password,String address, String phone) 
	{
		try {
			
			   Class.forName("com.mysql.cj.jdbc.Driver");
			   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/AJPDB","root","21122001m");
			
			   String query = "insert into customer (name, email, password,address,phone) values (?, ?, ?, ? ,?)";

			   PreparedStatement pstmt = con.prepareStatement(query);
			   
			   pstmt.setString(1, name);
			   pstmt.setString(2, email);
			   pstmt.setString(3, password);
			   pstmt.setString(4, address);
			   pstmt.setString(5, phone);
			   
			   
			   int count = pstmt.executeUpdate();
			   
			   con.close();
			   
			   return count > 0;
			   
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}

}
