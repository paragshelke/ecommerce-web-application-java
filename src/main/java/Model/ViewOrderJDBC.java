package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

public class ViewOrderJDBC implements ViewOrderConnectivity{

	@Override
	public ArrayList<Order> getOrderDetails()
	{
		 ArrayList<Order> orderList = new ArrayList<>();
			
			try {
				
				   Class.forName("com.mysql.cj.jdbc.Driver");
				   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/AJPDB","root","21122001m");
				
				   String query = "select * from orders";
				   PreparedStatement pstmt = con.prepareStatement(query);
				
				   ResultSet rs = pstmt.executeQuery();

				   while (rs.next()) 
				   {
					   Order o = new Order();
					   
					  
					    o.setProductId(rs.getInt("productId"));
		                o.setProductName(rs.getString("productName"));
		                o.setProductPrice(rs.getDouble("productPrice"));
		                o.setProductQuantity(rs.getInt("productQuantity"));
		                o.setTotalAmount(rs.getDouble("totalAmount"));
		                o.setDeliveryDate(rs.getDate("deliveryDate").toLocalDate());
		                o.setOrderDateTime(rs.getTimestamp("orderDateTime").toLocalDateTime());
		                o.setCustomerID(rs.getInt("customerID"));
		                o.setName(rs.getString("name"));
		                o.setAddress(rs.getString("address"));
		                o.setPhone(rs.getString("phone"));
		                o.setEmail(rs.getString("email"));

					   orderList.add(o);
		       
		            }

		            con.close();
				   
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return orderList;
		
		
	}

}
