<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="Model.Product" %>
<%@ page import="Model.Customer" %>

<%
	Customer c = (Customer) session.getAttribute("customerData");
	if (c == null)
	{
		response.sendRedirect("viewProducts");
		return;		
	}
    ArrayList<Product> cart = (ArrayList<Product>) session.getAttribute("cartData");
   

    LocalDateTime now = LocalDateTime.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
    String orderDateTime = now.format(formatter);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Payment Summary | MyShoppingCart</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

<style>
* { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Poppins', sans-serif; }
html, body { height: 100%; }

body {
    min-height: 100vh;
    background: #f2f2f2;
    padding-bottom: 70px;
}

header {
    background: linear-gradient(135deg, #fbc2eb, #a6c1ee);
    padding: 16px 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 8px 22px rgba(0,0,0,0.25);
    position: sticky;
    top: 0;
    z-index: 1000;
}

.logo {
    color: #fff;
    font-size: 32px;
    font-weight: 800;
    letter-spacing: 2px;
    text-shadow: 2px 2px 8px rgba(0,0,0,0.25);
}

.header-actions {
    display: flex;
    gap: 12px;
}

.header-actions form button,
.header-actions a {
    padding: 10px 22px;
    border-radius: 30px;
    border: none;
    font-size: 14px;
    font-weight: 700;
    cursor: pointer;
    text-decoration: none;
    transition: 0.3s;
}

.pay-btn { background: #22c55e; color: #fff; }
.cancel-btn { background: #ef4444; color: #fff; }
.logout-btn { background: #ff758c; color: #fff; }

.header-actions button:hover,
.header-actions a:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 18px rgba(0,0,0,0.15);
}

.content {
    padding: 40px 20px;
    background: linear-gradient(135deg, #eef5ff, #ffffff);
}

.container {
    max-width: 1100px;
    margin: auto;
}

.card {
    background: white;
    padding: 30px;
    border-radius: 22px;
    box-shadow: 0 12px 30px rgba(0,0,0,0.08);
}

.card h2 {
    margin-bottom: 25px;
    color: #2d3436;
    text-align: center;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background: #f1f5ff;
    color: #3f51b5;
    padding: 14px;
    text-align: left;
}

td {
    padding: 16px;
    border-bottom: 1px solid #eef1f5;
    color: #444;
}

.product-name {
    font-weight: 600;
}

.qty-badge {
    background: #e8f0ff;
    color: #3f51b5;
    padding: 6px 14px;
    border-radius: 20px;
    font-weight: 600;
}

.total-row td {
    font-size: 18px;
    font-weight: 700;
    color: #22c55e;
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
        <form action="paymentBuy.jsp" method="post">
            <button class="pay-btn">Proceed to Payment</button>
        </form>
        <a href="viewCart" class="cancel-btn">Cancel</a>
        <form action="logout" method="get">
            <button class="logout-btn">Logout</button>
        </form>
    </div>
</header>

<div class="content">
<div class="container">
<div class="card">

<h2>Order Details</h2>

<div style="margin-bottom:25px; background:#f8fbff; padding:20px; border-radius:16px;">
    <h3 style="margin-top:0; color:#3f51b5;">Customer & Order Information</h3>
    <table>
        <tr><td><strong>Customer ID:</strong></td><td><%= c.getCustomerID() %></td></tr>
        <tr><td><strong>Name:</strong></td><td><%= c.getName() %></td></tr>
        <tr><td><strong>Email:</strong></td><td><%= c.getEmail() %></td></tr>
        <tr><td><strong>Phone:</strong></td><td><%= c.getPhone() %></td></tr>
        <tr><td><strong>Address:</strong></td><td><%= c.getAddress() %></td></tr>
        <tr><td><strong>Order Date & Time:</strong></td><td><%= orderDateTime %></td></tr>
    </table>
</div>

<table>
<tr>
    <th>Product</th>
    <th>Quantity</th>
    <th>Price</th>
    <th>Total</th>
</tr>

<%
    double grandTotal = 0;
    if (cart != null) {
        for (Product p : cart) {
            double total = p.getProductPrice() * p.getProductQuantity();
            grandTotal += total;
%>
<tr>
    <td class="product-name"><%= p.getProductName() %></td>
    <td><span class="qty-badge"><%= p.getProductQuantity() %></span></td>
    <td>₹ <%= String.format("%.2f", p.getProductPrice()) %></td>
    <td>₹ <%= String.format("%.2f", total) %></td>
</tr>
<%
        }
    }
    session.setAttribute("currentBuyTotalAmount", grandTotal);
%>

<tr class="total-row">
    <td colspan="3">Grand Total</td>
    <td>₹ <%= String.format("%.2f", grandTotal) %></td>
</tr>
</table>

</div>
</div>
</div>

<footer>
    © 2025 MyShoppingCart. All Rights Reserved.
</footer>

</body>
</html>
