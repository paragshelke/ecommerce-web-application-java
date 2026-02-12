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

## ScreenShots
<img width="1920" height="1080" alt="Screenshot (25)" src="https://github.com/user-attachments/assets/19569529-c3ac-40d0-97fa-40859aae1bc2" />
<img width="1920" height="1080" alt="Screenshot (25)" src="https://github.com/user-attachments/assets/70e890d0-1b78-43db-9d7d-783f75d5f926" />
<img width="1920" height="1080" alt="Screenshot (32)" src="https://github.com/user-attachments/assets/5ade6184-bbe5-4a2c-acef-fd39b61bcb28" />
<img width="1920" height="1080" alt="Screenshot (30)" src="https://github.com/user-attachments/assets/05ef7810-dfa7-42db-85f2-32ffe60949d4" />
<img width="1920" height="1080" alt="Screenshot (38)" src="https://github.com/user-attachments/assets/84b99973-aa07-4e6e-8669-978d52fbf00a" />
<img width="1920" height="1080" alt="Screenshot (37)" src="https://github.com/user-attachments/assets/b9397426-5b9c-4d8e-97d8-891fb0a0a1d0" />
<img width="1920" height="1080" alt="Screenshot (33)" src="https://github.com/user-attachments/assets/5bc322d8-19f5-4788-854b-d1299f6b2331" />
<img width="1920" height="1080" alt="Screenshot (36)" src="https://github.com/user-attachments/assets/2a1ed541-c3a6-4f5d-bdf8-16affaf2a724" />
<img width="1920" height="1080" alt="Screenshot (35)" src="https://github.com/user-attachments/assets/0440e32e-7e13-4704-ae1a-306ab04100da" />
<img width="1920" height="1080" alt="Screenshot (28)" src="https://github.com/user-attachments/assets/5a7b677c-8bdb-48f0-85be-f702b0464dbf" />
<img width="1920" height="1080" alt="Screenshot (31)" src="https://github.com/user-attachments/assets/e606e5b5-e660-4cc0-9ecd-8bcaabc6bb11" />
<img width="1920" height="1080" alt="Screenshot (27)" src="https://github.com/user-attachments/assets/bb929e05-1fc2-4028-b09d-a17307766b08" />
<img width="1920" height="1080" alt="Screenshot (26)" src="https://github.com/user-attachments/assets/af5c2b3d-6b67-4aad-a72c-22e4f38ff3ea" />
<img width="1920" height="1080" alt="Screenshot (34)" src="https://github.com/user-attachments/assets/6b2176ae-6376-4038-a82f-e134504dd109" />
<img width="1920" height="1080" alt="Screenshot (39)" src="https://github.com/user-attachments/assets/14e5bfb5-c8e9-40c7-9982-e36bc7bbf571" />
<img width="1920" height="1080" alt="Screenshot (40)" src="https://github.com/user-attachments/assets/44248759-b66b-461c-a95c-0a9f0a52ec77" />




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

