package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminLoginJDBC implements AdminLoginConectivity{

	@Override
	public boolean checkAdmin(String email, String password)
	{
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/AJPDB","root","21122001m");
			
			   String query = "select * from admin where email=? AND password=?";

			   PreparedStatement pstmt = con.prepareStatement(query);
			   
			   pstmt.setString(1, email);
			   pstmt.setString(2, password);

			   ResultSet rs = pstmt.executeQuery();
			   
			   return rs.next();
			   
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return false;
	}

}
