<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Order" %>

<%
Boolean isLogin = (Boolean) session.getAttribute("isLogin");

if (isLogin == null || !isLogin)
{
	response.sendRedirect("admin_login.html");
	return;
}
ArrayList<Order> orders = (ArrayList<Order>) session.getAttribute("adminOrderDetails");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | Order Details</title>

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
    box-shadow: 0 8px 22px rgba(0,0,0,0.25);
}

.navbar h2 {
    margin: 0;
    font-size: 24px;
    font-weight: 700;
}

.nav-actions {
    display: flex;
    gap: 12px;
}

.nav-btn {
    border: none;
    padding: 10px 22px;
    border-radius: 20px;
    color: white;
    font-weight: 700;
    cursor: pointer;
}

.dashboard-btn {
    background: linear-gradient(135deg, #86efac, #4ade80);
    color: #064e3b;
}

.logout-btn {
    background: linear-gradient(135deg, #ff758c, #ff7eb3);
}

.container {
    max-width: 1450px;
    margin: 40px auto;
    background: rgba(255,255,255,0.95);
    padding: 30px;
    border-radius: 24px;
    box-shadow: 0 18px 35px rgba(0,0,0,0.2);
}

h3 {
    margin-top: 0;
    color: #2d3436;
    margin-bottom: 25px;
    font-size: 26px;
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

.amount {
    font-weight: 800;
    color: #16a34a;
}

.badge {
    background: #e0e7ff;
    padding: 6px 14px;
    border-radius: 20px;
    color: #3730a3;
    font-weight: 700;
}

.status {
    color: #16a34a;
    font-weight: 800;
}

.payment {
    color: #22c55e;
    font-weight: 800;
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
    <h3>Customer Order Details</h3>

    <%
        if (orders == null || orders.isEmpty()) {
    %>
        <div class="empty">
            No orders found.
        </div> 
    <%
        } else {
    %>

    <table>
        <tr>
            <th>Product</th>
            <th>Qty</th>
            <th>Price</th>
            <th>Total</th>
            <th>Customer</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Address</th>
            <th>Order Date</th>
            <th>Delivery Date</th>
            <th>Order Status</th>
            <th>Payment</th>
           
        </tr>

        <%
            for (Order o : orders) {
        %>
        <tr>
            <td><strong><%= o.getProductName() %></strong></td>
            <td><span class="badge"><%= o.getProductQuantity() %></span></td>
            <td>₹ <%= String.format("%.2f", o.getProductPrice()) %></td>
            <td class="amount">₹ <%= String.format("%.2f", o.getTotalAmount()) %></td>
            <td><%= o.getName() %></td>
            <td><%= o.getEmail() %></td>
            <td><%= o.getPhone() %></td>
            <td><%= o.getAddress() %></td>
            <td><%= o.getOrderDateTime() %></td>
            <td><%= o.getDeliveryDate() %></td>
            <td class="status">Pending</td>
            <td class="payment">Done</td>
            
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
