package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ViewCustomerJDBC implements ViewCustomerConnectivity {

	@Override
	public ArrayList<Customer> getCustomerDetails() 
	{
		ArrayList<Customer> customerList = new ArrayList<>();
		
		try {
			
			   Class.forName("com.mysql.cj.jdbc.Driver");
			   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/AJPDB","root","21122001m");
			
			   String query = "select * from customer;";
			   PreparedStatement pstmt = con.prepareStatement(query);
			
			   ResultSet rs = pstmt.executeQuery();

			   while (rs.next()) 
			   {
				   Customer c = new Customer();
				   
	                c.setCustomerID(rs.getInt("customerID"));
	                c.setName(rs.getString("name"));
	                c.setAddress(rs.getString("address"));
	                c.setPhone(rs.getString("phone"));
	                c.setEmail(rs.getString("email"));

	                customerList.add(c);
	       
	            }

	            con.close();
			   
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return customerList;
	
	}
}
