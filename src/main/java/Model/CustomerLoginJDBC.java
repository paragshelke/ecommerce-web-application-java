package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CustomerLoginJDBC implements CustomerLoginConectivity{

	@Override
	public Customer checkCustomer(String email, String password) 
	{
		Customer customer = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/AJPDB","root","21122001m");
			
			
			   String query = "select * from customer where email=? AND password=?";

			   PreparedStatement pstmt = con.prepareStatement(query);
			   
			   pstmt.setString(1, email);
			   pstmt.setString(2, password);

			   ResultSet rs = pstmt.executeQuery();
			
			   if(rs.next()) 
			   {	
				   customer = new Customer();
				   
				   customer.setCustomerID(rs.getInt("customerID"));
				   customer.setName(rs.getString("name"));
				   customer.setEmail(rs.getString("email"));
				   customer.setPassword(rs.getString("password"));
				   customer.setAddress(rs.getString("address"));
				   customer.setPhone(rs.getString("phone"));
				 				   
		       }
			   
			   con.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return customer;
	}

}
