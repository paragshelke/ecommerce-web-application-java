package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UpdateProductsJDBC implements UpdateProductsConnectivity {

	@Override
	public boolean updateproduct(int productId, String productName, double productPrice, String productImage,
			String productDescription) {

		boolean isUpdated = false;

		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/AJPDB", "root", "21122001m");

			String query = "UPDATE products SET productName = ?, productPrice = ?, productImage = ?, productDescription = ? WHERE productId = ?";


			PreparedStatement pstmt = con.prepareStatement(query);

			pstmt.setString(1, productName);
			pstmt.setDouble(2, productPrice);
			pstmt.setString(3, productImage);
			pstmt.setString(4, productDescription);
			pstmt.setInt(5, productId);

			int rows = pstmt.executeUpdate();

			if (rows > 0) 
			{
				isUpdated = true;
			}

			return isUpdated;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isUpdated;

	}

}
