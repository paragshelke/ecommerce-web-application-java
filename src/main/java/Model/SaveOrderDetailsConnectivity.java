package Model;

import java.time.LocalDate;
import java.time.LocalDateTime;

public interface SaveOrderDetailsConnectivity {

	public void saveOrder(int productId, String productName, double productPrice, int productQuantity,
			double totalAmount, LocalDate deliveryDate, LocalDateTime orderDateTime, int customerID, String name,
			String address, String phone, String email);
}
