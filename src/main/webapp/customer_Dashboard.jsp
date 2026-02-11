<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Customer" %>

<!DOCTYPE html>
<html>
<head>
    <title>Customer Dashboard</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: "Poppins", sans-serif;
            min-height: 100vh;
            background: linear-gradient(135deg, #667eea, #764ba2, #43cea2);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .dashboard-wrapper {
            width: 90%;
            max-width: 1100px;
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(14px);
            border-radius: 24px;
            padding: 50px;
            box-shadow: 0 30px 60px rgba(0,0,0,0.35);
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .welcome-box {
            text-align: center;
            color: #fff;
            margin-bottom: 45px;
        }

        .welcome-box h2 {
            font-size: 34px;
            margin-bottom: 10px;
            font-weight: 600;
        }

        .welcome-box p {
            font-size: 16px;
            opacity: 0.95;
        }

        .action-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 30px;
            margin-top: 40px;
        }

        .card {
            background: rgba(255,255,255,0.9);
            border-radius: 18px;
            padding: 35px 25px;
            text-align: center;
            box-shadow: 0 15px 30px rgba(0,0,0,0.2);
            transition: 0.3s ease;
        }

        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.3);
        }

        .card h3 {
            margin-bottom: 20px;
            font-size: 22px;
            color: #333;
        }

        .btn {
            padding: 14px 35px;
            font-size: 16px;
            border-radius: 30px;
            border: none;
            cursor: pointer;
            font-weight: 600;
            color: #fff;
            transition: 0.3s;
        }

        .btn-products {
            background: linear-gradient(135deg, #5dade2, #3498db);
        }

        .btn-products:hover {
            box-shadow: 0 10px 25px rgba(52,152,219,0.5);
        }

        .btn-cart {
            background: linear-gradient(135deg, #58d68d, #2ecc71);
        }

        .btn-cart:hover {
            box-shadow: 0 10px 25px rgba(46,204,113,0.5);
        }

        .btn-logout {
            background: linear-gradient(135deg, #ff6b6b, #ff3b3b);
        }

        .btn-logout:hover {
            box-shadow: 0 10px 25px rgba(255,59,59,0.5);
        }

        form {
            display: inline;
        }

        a {
            text-decoration: none;
        }

        @media (max-width: 768px) {
            .dashboard-wrapper {
                padding: 35px 25px;
            }

            .welcome-box h2 {
                font-size: 28px;
            }
        }
    </style>
</head>

<body>

<%
    Customer customer = (Customer) session.getAttribute("customerData");
    if (customer == null) {
        response.sendRedirect("customer_login.html");
        return;
    }
%>

<div class="dashboard-wrapper">

    <div class="welcome-box">
        <h2>Welcome, <%= customer.getName() %> 👋</h2>
        <p>Manage your shopping, explore products, and track your cart from here</p>
    </div>

    <div class="action-cards">

        <div class="card">
            <h3>Browse Products</h3>
            <form action="viewProducts" method="get">
                <button class="btn btn-products">View Products</button>
            </form>
        </div>

        <div class="card">
            <h3>Your Cart</h3>
            <form action="viewCart" method="get">
                <button class="btn btn-cart">View Cart</button>
            </form>
        </div>

        <div class="card">
            <h3>Exit Dashboard</h3>
            <a href="logout">
                <button class="btn btn-logout">Logout</button>
            </a>
        </div>

    </div>

</div>

</body>
</html>
