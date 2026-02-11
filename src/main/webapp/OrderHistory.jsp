<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Order"%>
<%@ page import="Model.Customer"%>

<%	
	Customer c = (Customer) session.getAttribute("customerData");
	if (c == null)
	{
		response.sendRedirect("viewProducts");
		return;		
	}
    ArrayList<Order> orders =
        (ArrayList<Order>) session.getAttribute("customerOrderHistoryDetails");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>My Orders | MyShoppingCart</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

<style>
* { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Poppins', sans-serif; }
html, body { height: 100%; }

body {
    min-height: 100vh;
    background: linear-gradient(135deg, #fde2e4, #e0c3fc, #c2e9fb);
    padding-bottom: 70px;
}

header {
    background: linear-gradient(135deg, #fbc2eb, #a6c1ee);
    padding: 16px 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: #fff;
    box-shadow: 0 8px 22px rgba(0,0,0,0.25);
    position: sticky;
    top: 0;
    z-index: 1000;
}

.logo {
    font-size: 28px;
    font-weight: 800;
    letter-spacing: 2px;
    text-shadow: 2px 2px 8px rgba(0,0,0,0.25);
}

.header-actions {
    display: flex;
    gap: 12px;
}

.header-actions form button {
    border: none;
    padding: 10px 22px;
    border-radius: 20px;
    font-size: 14px;
    font-weight: 700;
    cursor: pointer;
    color: #fff;
    transition: 0.3s;
}

.home-btn {
    background: linear-gradient(135deg, #fbbf24, #f97316);
    color: #7c2d12;
}

.logout-btn {
    background: linear-gradient(135deg, #ff758c, #ff7eb3);
}

.header-actions button:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 18px rgba(0,0,0,0.15);
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
    background: linear-gradient(135deg, #fbc2eb, #a6c1ee);
    text-align: center;
    padding: 16px 0;
    font-size: 14px;
    font-weight: 600;
    color: #000;
    box-shadow: 0 -4px 15px rgba(0,0,0,0.15);
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
}
</style>
</head>

<body>

<header>
    <div class="logo">MyShoppingCart</div>
    <div class="header-actions">
        <form action="viewProducts" method="get">
            <button class="home-btn">Home</button>
        </form>
        <form action="logout" method="get">
            <button class="logout-btn">Logout</button>
        </form>
    </div>
</header>

<div class="container">
    <h3>Order History</h3>

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
            <th>Order Date</th>
            <th>Delivery Date</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Status</th>
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
            <td><%= o.getOrderDateTime() %></td>
            <td><%= o.getDeliveryDate() %></td>
            <td><%= o.getAddress() %></td>
            <td><%= o.getPhone() %></td>
            <td><%= o.getEmail() %></td>
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
