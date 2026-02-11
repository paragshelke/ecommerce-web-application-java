package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class SaveOrderDetailsJDBC implements SaveOrderDetailsConnectivity{

	@Override
	public void saveOrder(int productId, String productName, double productPrice, int productQuantity,
			double totalAmount, LocalDate deliveryDate, LocalDateTime orderDateTime, int customerID, String name,
			String address, String phone, String email)
	{
		
		try {
			
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/AJPDB","root","21122001m");
			
			   String query = "insert into orders (productId, productName, productPrice, productQuantity, totalAmount,deliveryDate, orderDateTime, customerID, name, address, phone, email) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
			   
			   PreparedStatement pstmt = con.prepareStatement(query);
			   
			   	pstmt.setInt(1, productId);
	            pstmt.setString(2,productName);
	            pstmt.setDouble(3, productPrice);
	            pstmt.setInt(4, productQuantity);
	            pstmt.setDouble(5, totalAmount);
	            pstmt.setDate(6, java.sql.Date.valueOf(deliveryDate));
	            pstmt.setTimestamp(7, java.sql.Timestamp.valueOf(orderDateTime));
	            pstmt.setInt(8, customerID);
	            pstmt.setString(9,name);
	            pstmt.setString(10, address);
	            pstmt.setString(11, phone);
	            pstmt.setString(12, email);

	            pstmt.executeUpdate();

	            con.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

			
	}

	

}
