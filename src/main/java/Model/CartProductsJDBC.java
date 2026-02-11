package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CartProductsJDBC implements CartProductsConnectivity {

	@Override
	public Product productById(int productId) 
	{	
		Product product = null;
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/AJPDB","root","21122001m");
			
			   String query = "select * from products where productId = ?";

			   PreparedStatement pstmt = con.prepareStatement(query);
			   
			   pstmt.setInt(1, productId);
			  
			   ResultSet rs = pstmt.executeQuery();
			   
			   if(rs.next())
			   {
				   product = new Product();
				   
				   product.setProductId(rs.getInt("productId"));
				   product.setProductName(rs.getString("productName"));
				   product.setProductPrice(rs.getDouble("productPrice"));
				   product.setProductImage(rs.getString("productImage"));
				   product.setProductDescription(rs.getString("productDescription"));
				   
			   }
	  
			   con.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return product;
	}

}
