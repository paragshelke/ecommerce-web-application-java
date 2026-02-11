package Model;

public class AdminLoginBusiness {

	public boolean isAdminValid(String email, String password) {
		
		AdminLoginConectivity ref = new AdminLoginJDBC();
		return ref.checkAdmin(email,password);
	}

	 
}
