package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ViewProductsJDBC implements ViewProductsConnectivity {
	
	@Override
	public ArrayList<Product> getProductsDetails()
	{
		
		 ArrayList<Product> productList = new ArrayList<>();
		
		try {
			
			   Class.forName("com.mysql.cj.jdbc.Driver");
			   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/AJPDB","root","21122001m");
			
			   String query = "select * from products";
			   PreparedStatement pstmt = con.prepareStatement(query);
			
			   ResultSet rs = pstmt.executeQuery();

			   while (rs.next()) 
			   {
				   Product p = new Product();
				   
				   p.setProductId(rs.getInt("productID"));
				   p.setProductName(rs.getString("productName"));
				   p.setProductPrice(rs.getDouble("productPrice"));
				   p.setProductImage(rs.getString("productImage"));
				   p.setProductDescription(rs.getString("ProductDescription"));
				  
	               productList.add(p);
	       
	            }

	            con.close();
			   
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return productList;
	}
	
}
