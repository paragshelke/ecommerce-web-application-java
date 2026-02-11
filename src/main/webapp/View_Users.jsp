<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Customer" %>

<%
Boolean isLogin = (Boolean) session.getAttribute("isLogin");

if (isLogin == null || !isLogin)
{
	response.sendRedirect("admin_login.html");
	return;
}
    ArrayList<Customer> customers = (ArrayList<Customer>) session.getAttribute("customerDetails");
        
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | Customer Details</title>

<style>
body {
    margin: 0;
    font-family: "Poppins", Arial, sans-serif;
    background: linear-gradient(135deg, #fde2e4, #e0c3fc, #c2e9fb);
    padding-bottom: 70px;
}

.navbar {
    background: linear-gradient(135deg, #fbc2eb, #a6c1ee);
    padding: 16px 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: white;
}

.navbar h2 {
    margin: 0;
    font-size: 24px;
    font-weight: 600;
}

.nav-actions {
    display: flex;
    gap: 12px;
}

.nav-actions form {
    margin: 0;
}

.nav-btn {
    border: none;
    padding: 10px 20px;
    border-radius: 10px;
    color: white;
    font-weight: 600;
    cursor: pointer;
}

.dashboard-btn {
    background: #22c55e;
}

.dashboard-btn:hover {
    background: #16a34a;
}

.logout-btn {
    background: #ef4444;
}

.logout-btn:hover {
    background: #dc2626;
}

.container {
    max-width: 1200px;
    margin: 40px auto;
    background: white;
    padding: 30px;
    border-radius: 20px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.1);
}

h3 {
    margin-top: 0;
    color: #1f2937;
    margin-bottom: 25px;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background: #eef2ff;
    color: #4338ca;
    padding: 14px;
    font-size: 14px;
    text-align: left;
}

td {
    padding: 14px;
    border-bottom: 1px solid #e5e7eb;
    font-size: 14px;
    color: #374151;
}

tr:hover {
    background: #f9fafb;
}

.badge {
    background: #e0e7ff;
    padding: 6px 14px;
    border-radius: 20px;
    color: #3730a3;
    font-weight: 600;
}

.empty {
    text-align: center;
    padding: 40px;
    color: #6b7280;
    font-size: 16px;
}

footer {
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
    background: linear-gradient(135deg, #fbc2eb, #a6c1ee);
    text-align: center;
    padding: 16px 0;
    font-size: 14px;
    font-weight: 600;
    box-shadow: 0 -4px 15px rgba(0,0,0,0.15);
}
</style>
</head>

<body>

<div class="navbar">
    <h2>MyShoppingCart • Admin</h2>

    <div class="nav-actions">
        <form action="adminServlet" method="post">
            <button class="nav-btn dashboard-btn">Admin Dashboard</button>
        </form>

        <form action="logout" method="get">
            <button class="nav-btn logout-btn">Logout</button>
        </form>
    </div>
</div>

<div class="container">
    <h3>Registered Customers</h3>

    <%
        if (customers == null || customers.isEmpty()) {
    %>
        <div class="empty">
            No customers found.
        </div>
    <%
        } else {
    %>

    <table>
        <tr>
            <th>Customer ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Address</th>
        </tr>

        <%
            for (Customer c : customers) {
        %>
        <tr>
            <td><span class="badge"><%= c.getCustomerID() %></span></td>
            <td><strong><%= c.getName() %></strong></td>
            <td><%= c.getEmail() %></td>
            <td><%= c.getPhone() %></td>
            <td><%= c.getAddress() %></td>
        </tr>
        <%
            }
        %>
    </table>

    <%
        }
    %>
</div>

<footer>
    © 2025 MyShoppingCart. All Rights Reserved.
</footer>

</body>
</html>
