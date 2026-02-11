package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteProductsJDBC implements DeleteProductsConnectivity {

	@Override
	public boolean deleteProducts(int productID) 
	{
		boolean isDeleted = false;

		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/AJPDB", "root", "21122001m");

			String sql = "DELETE FROM products WHERE productId = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, productID);

			int rows = pstmt.executeUpdate();

			if (rows > 0) 
			{
				isDeleted = true;
			}

			con.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isDeleted;
	}

}
