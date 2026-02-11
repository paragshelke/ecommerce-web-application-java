package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AddProductsJDBC implements AddProductsConnectivity {

	@Override
	public boolean setAddProduct(int productId, String productName, double productPrice, String productImage,
			String productDescription) 
	{
		boolean isAdded = false;

		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/AJPDB", "root", "21122001m");

			String query = "insert into products (productId, productName, productPrice, productImage, productDescription) values (? , ?, ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			
			 	pstmt.setInt(1, productId);
	            pstmt.setString(2, productName);
	            pstmt.setDouble(3, productPrice);
	            pstmt.setString(4, productImage);
	            pstmt.setString(5, productDescription);

	            int rows = pstmt.executeUpdate();

	            if (rows>0) 
	            {
	                isAdded = true;
	            }

	            pstmt.close();
	            con.close();
						
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isAdded;
	}

}
