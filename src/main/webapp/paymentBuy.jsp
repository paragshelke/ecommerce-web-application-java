<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Model.Customer"%>

<%
Customer c = (Customer) session.getAttribute("customerData");
if (c == null)
{
	response.sendRedirect("viewProducts");
	return;		
}
    Double totalAmount = (Double) session.getAttribute("currentBuyTotalAmount");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Payment | MyShoppingCart</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

<style>
* { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Poppins', sans-serif; }
html, body { height: 100%; }

body {
    min-height: 100vh;
    background: linear-gradient(135deg, #667eea, #764ba2, #43cea2);
    padding-top: 90px;
    padding-bottom: 70px;
}

header {
    background: linear-gradient(135deg, #fbc2eb, #a6c1ee);
    padding: 16px 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 8px 22px rgba(0,0,0,0.25);
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
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

.header-actions a,
.header-actions form button {
    padding: 10px 22px;
    border-radius: 30px;
    border: none;
    font-size: 14px;
    font-weight: 700;
    cursor: pointer;
    text-decoration: none;
    color: #fff;
    transition: 0.3s;
}

.cancel-btn { background: #ef4444; }
.logout-btn { background: #ff758c; }

.header-actions button:hover,
.header-actions a:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 18px rgba(0,0,0,0.15);
}

.container {
    width: 420px;
    background: rgba(255, 255, 255, 0.15);
    backdrop-filter: blur(14px);
    padding: 40px 32px;
    border-radius: 22px;
    box-shadow: 0 25px 45px rgba(0, 0, 0, 0.25);
    text-align: center;
    margin: auto;
    animation: fadeIn 0.8s ease-in-out;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(30px); }
    to { opacity: 1; transform: translateY(0); }
}

h2 {
    margin-bottom: 10px;
    color: #ffffff;
    font-size: 26px;
    font-weight: 600;
}

.amount {
    font-size: 22px;
    font-weight: 700;
    color: #7CFF9B;
    margin-bottom: 28px;
    text-shadow: 0 0 8px rgba(124, 255, 155, 0.6);
}

label {
    display: block;
    text-align: left;
    margin-bottom: 6px;
    font-weight: 600;
    font-size: 14px;
    color: #f8fafc;
}

input {
    width: calc(100% - 28px);
    padding: 14px;
    margin: 0 auto 18px;
    border-radius: 50px;
    border: 1px solid #ccc;
    font-size: 15px;
    outline: none;
    background: rgba(255,255,255,0.85);
    color: #333;
    display: block;
    transition: 0.3s;
}

input:focus {
    border-color: #ff9a9e;
    box-shadow: 0 0 10px rgba(255,154,158,0.5);
    background: #ffffff;
}

.btn-group {
    margin-top: 22px;
}

.btn {
    width: 100%;
    padding: 14px;
    border: none;
    border-radius: 50px;
    background: linear-gradient(135deg, #ff9a9e, #fad0c4);
    color: #333;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
    box-shadow: 0 8px 20px rgba(255,154,158,0.4);
}

.btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 12px 25px rgba(255,154,158,0.7);
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
        <a href="viewProducts" class="cancel-btn">Cancel</a>
        <form action="logout" method="get">
            <button class="logout-btn">Logout</button>
        </form>
    </div>
</header>

<div class="container">

    <h2>Payment Details</h2>

    <div class="amount">
        Amount Payable: ₹ <%= String.format("%.2f", totalAmount) %>
    </div>

    <form action="authenticate" method="post">

        <label>Card Number</label>
        <input type="text" name="cardNumber" maxlength="16" required>

        <label>Card Holder Name</label>
        <input type="text" name="cardHolder" required>

        <label>CVV</label>
        <input type="password" name="cvv" maxlength="3" required>

        <div class="btn-group">
            <button type="submit" class="btn">Pay Now</button>
        </div>

    </form>

</div>

<footer>
    © 2025 MyShoppingCart. All Rights Reserved.
</footer>

</body>
</html>
