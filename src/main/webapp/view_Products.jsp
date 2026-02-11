<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Product" %>
<%@ page import="Model.Customer" %>

<%
    ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("productsData");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyShoppingCart</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

<style>
* { box-sizing: border-box; }
body {
    margin: 0;
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(135deg, #fde2e4, #e0c3fc, #c2e9fb);
    min-height: 100vh;
    padding-bottom: 50px; /* space for sticky footer */
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
    color: #ffffff;
    font-size: 32px;
    font-weight: 800;
    letter-spacing: 2px;
    text-shadow: 2px 2px 8px rgba(0,0,0,0.25);
}
.nav-actions { display: flex; gap: 14px; }
.nav-actions form button {
    padding: 10px 24px;
    border-radius: 30px;
    border: none;
    font-size: 14px;
    font-weight: 700;
    cursor: pointer;
    transition: 0.3s ease;
}
.view-cart { background: linear-gradient(135deg, #34d399, #10b981); color: #fff; }
.order-history { background: linear-gradient(135deg, #60a5fa, #3b82f6); color: #fff; }
.login { background: linear-gradient(135deg, #fbbf24, #f59e0b); color: #fff; }
.logout { background: linear-gradient(135deg, #ff758c, #ff7eb3); color: #fff; }
.nav-actions button:hover {
    transform: translateY(-2px) scale(1.08);
    box-shadow: 0 10px 25px rgba(0,0,0,0.35);
}
h1 { text-align: center; margin: 40px 0 28px; font-size: 42px; font-weight: 800; color: #2d3436; }
.container {
    width: 95%;
    max-width: 1300px;
    margin: auto;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 30px;
    padding-bottom: 60px;
}
.card {
    background: rgba(255,255,255,0.95);
    border-radius: 24px;
    overflow: hidden;
    box-shadow: 0 18px 35px rgba(0,0,0,0.2);
    transition: 0.4s ease;
}
.card:hover {
    transform: translateY(-10px);
    box-shadow: 0 30px 55px rgba(0,0,0,0.35);
}
.card img {
    width: 100%;
    height: 220px;
    object-fit: cover;
}
.card-content {
    padding: 20px;
    text-align: center;
}
.card-content h3 {
    margin: 10px 0;
    font-size: 20px;
    font-weight: 700;
    color: #2c3e50;
}
.card-content p {
    font-size: 14px;
    color: #555;
    min-height: 52px;
}
.price {
    margin-top: 8px;
    font-size: 22px;
    font-weight: 800;
    color: #22c55e;
}
.action-row {
    display: flex;
    justify-content: center;
    gap: 14px;
    margin-top: 18px;
}
.card-content button {
    padding: 12px 26px;
    border-radius: 30px;
    border: none;
    font-size: 14px;
    font-weight: 800;
    cursor: pointer;
    transition: 0.3s ease;
    box-shadow: 0 8px 18px rgba(0,0,0,0.25);
}
.add-cart { background: linear-gradient(135deg, #86efac, #4ade80); color: #064e3b; }
.buy-now { background: linear-gradient(135deg, #93c5fd, #60a5fa); color: #1e3a8a; }
.card-content button:hover {
    transform: scale(1.12);
    box-shadow: 0 14px 35px rgba(0,0,0,0.4);
}
footer {
    position: fixed;
    bottom: 0;
    width: 100%;
    background: linear-gradient(135deg, #fbc2eb, #a6c1ee);
    color:black;
    text-align: center;
    padding: 8px 0; /* minimal height */
    box-shadow: 0 -2px 6px rgba(0,0,0,0.2);
    z-index: 1000;
    font-family: 'Poppins', sans-serif;
    font-size: 14px;
}
@media (max-width: 768px) {
    h1 { font-size: 32px; }
    .logo { font-size: 26px; }
    .nav-actions form button { padding: 8px 18px; font-size: 13px; }
}
</style>
</head>

<body>

<header>
    <div class="logo">MyShoppingCart</div>
    <div class="nav-actions">
        <form action="viewCart" method="get">
            <button type="submit" class="view-cart">View Cart</button>
        </form>
        <form action="orderHistory" method="post">
            <button type="submit" class="order-history">Order History</button>
        </form>
        <form action="login.html" method="get">
            <button type="submit" class="login">Login</button>
        </form>
        <form action="login.html" method="get">
            <button type="submit" class="logout">Logout</button>
        </form>
    </div>
</header>

<h1>Products</h1>

<div class="container">
<%
    if (products != null) {
        for (Product p : products) {
%>
    <div class="card">
    <img src="<%=request.getContextPath()%>/ProductsImages/<%=p.getProductImage()%>" 
     alt="<%=p.getProductName()%>">
        <div class="card-content">
            <h3><%=p.getProductName()%></h3>
            <p><%=p.getProductDescription()%></p>
            <div class="price">&#8377; <%=String.format("%.2f", p.getProductPrice())%></div>

            <div class="action-row">
                <form action="addToCart" method="post">
                    <input type="hidden" name="productid" value="<%=p.getProductId()%>">
                    <button class="add-cart">Add to Cart</button>
                </form>

                <form action="viewProductsBuy" method="post">
                    <input type="hidden" name="productId" value="<%=p.getProductId()%>">
                    <button class="buy-now">Buy</button>
                </form>
            </div>
        </div>
    </div>
<%
        }
    }
%>
</div>

<footer>
    &copy; 2025 MyShoppingCart. All rights reserved.
   
</footer>

</body>
</html>
