# E-Commerce Web Application 
Java-based e-commerce web application

This is a full-stack dynamic e-commerce website built using Java, Servlets, JSP, JDBC, and MySQL, following the MVC architecture. The application supports both customer and admin functionalities with secure authentication, shopping cart management, order processing, and simulated credit card payments. Object-oriented principles, exception handling, and session management are used throughout the project.

---

## Technologies and Tools Used

- Frontend: HTML, CSS, JSP
- Backend: Java, Servlets
- Database: MySQL (connected using JDBC)
- Architecture: MVC
- Application Layers: Presentation Layer, Service Layer, Business Layer, DAO Layer, Data Persistence Layer
- Features: OOP concepts, exception handling, session management, request dispatching
- Server: Apache Tomcat
- IDE: Eclipse

---

## Features

### Customer Features

- Registration and login system with session-based access control
- Customer dashboard to view available products and manage cart
- Add products to cart, remove products, and view cart contents
- Purchase products from cart (single product or all items)
- View previous order history
- Payment simulation using credit card with balance check and authentication
- Logout functionality, with session termination for security

### Admin Features

- Admin login with dashboard for management
- View registered customers with full details (name, email, phone, address)
- View all customer orders with product details, timestamps, delivery address, payment status, and order status
- Add, update, and remove products from inventory

---

## Project Architecture

The project follows MVC architecture:

- Model: Represents the data and application objects
- View: JSP pages for all user interfaces
- Controller: Servlets handling requests, controlling the flow between view and model
- Data Layer: DAO and persistence layer handling database operations
- Service Layer: Application logic coordinating between controller and DAO

---

## How to Run the Project

1. **Clone the repository** from GitHub: 
2. **Open Eclipse IDE** and go to File → Import → Existing Dynamic Web Project. Select the cloned project folder.

3. **Configure Tomcat Server** in Eclipse:
- Ensure Tomcat is installed (version 9 or higher recommended)
- Right-click the project → Run As → Run on Server → Select Apache Tomcat

4. **Set up MySQL Database**:
- Open MySQL Workbench or phpMyAdmin
- Create a new database (e.g., `ecommerce_db`)
- Import the provided `database.sql` file included in the project

5. **Update Database Connection**:
- Open the database connection file (e.g., `DBConnection.java`)
- Update the database URL, username, and password according to your setup

6. **Run the Application**:
- Start Tomcat server in Eclipse
- Open a browser and go to:

  ```
  http://localhost:8080/ecommerce-web-application-java
  ```

7. **Login as Customer or Admin**:
- Customer can register and use all shopping features
- Admin can log in to manage products and view customer orders

8. **Payment Simulation**:
- While purchasing, enter credit card details
- The system will verify balance and complete the purchase

---

## Folder Structure

- `src/` → Java source files including Servlets, DAO, Service, and Utility classes
- `WebContent/` → JSP pages, HTML, CSS, JS files
- `database.sql` → SQL script to create database and tables
- `README.md` → Project documentation

---

## Key Highlights

- Full-stack dynamic e-commerce application
- Implements all five layers for modularity and scalability
- Session management ensures secure access to pages
- Credit card payment is validated before processing
- Exception handling implemented for reliability
- MVC design pattern used for clean architecture
- Easily extendable for additional features like product categories, search, or email notifications

---

## Future Improvements

- Integration of other real payment gateways
- Product categories, search, and filtering

********************************************************Thank You For Visiting*************************************************************************************************

