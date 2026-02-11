<%@ page import="Model.Product" %>
<%@ page import="Model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	Customer customer = (Customer) session.getAttribute("customerData");
	if (customer == null)
	{
		response.sendRedirect("viewProducts");
		return;		
	}
    Product addedProduct = (Product) session.getAttribute("addedProduct");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product Added | MyShoppingCart</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    min-height:100vh;
    display:flex;
    flex-direction:column;
    background:linear-gradient(135deg,#667eea,#764ba2,#43cea2);
}

header{
    background:linear-gradient(135deg,#fbc2eb,#a6c1ee);
    padding:16px 30px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 8px 22px rgba(0,0,0,0.25);
}

.logo{
    color:#fff;
    font-size:30px;
    font-weight:800;
    letter-spacing:2px;
}

header form button{
    padding:10px 24px;
    border-radius:30px;
    border:none;
    font-size:14px;
    font-weight:700;
    cursor:pointer;
    background:linear-gradient(135deg,#ff758c,#ff7eb3);
    color:#fff;
    transition:0.3s;
}

header form button:hover{
    transform:translateY(-2px) scale(1.05);
    box-shadow:0 10px 25px rgba(0,0,0,0.35);
}

main{
    flex:1;
    display:flex;
    justify-content:center;
    align-items:center;
    padding:30px;
}

.container{
    background:rgba(255,255,255,0.18);
    backdrop-filter:blur(12px);
    padding:40px 60px;
    border-radius:26px;
    text-align:center;
    box-shadow:0 25px 45px rgba(0,0,0,0.3);
    max-width:500px;
}

h2{
    font-size:30px;
    color:#ffffff;
    margin-bottom:22px;
    text-shadow:0 3px 10px rgba(0,0,0,0.45);
}

.product-name{
    font-size:22px;
    font-weight:700;
    color:#facc15;
    margin-bottom:30px;
    text-shadow:0 3px 10px rgba(0,0,0,0.45);
}

button{
    margin:10px;
    padding:12px 28px;
    border-radius:14px;
    border:none;
    font-size:15px;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;
}

.btn-cart{
    background:linear-gradient(135deg,#22c55e,#4ade80);
    color:#064e3b;
}

.btn-continue{
    background:linear-gradient(135deg,#60a5fa,#3b82f6);
    color:#1e3a8a;
}

.btn-logout{
    background:linear-gradient(135deg,#ff416c,#ff4b2b);
    color:#fff;
}

button:hover{
    transform:translateY(-3px);
    box-shadow:0 12px 30px rgba(0,0,0,0.35);
}

footer{
    background:linear-gradient(135deg,#fbc2eb,#a6c1ee);
    text-align:center;
    padding:8px 0;
    font-size:14px;
    box-shadow:0 -2px 6px rgba(0,0,0,0.2);
}
</style>
</head>

<body>

<header>
    <div class="logo">MyShoppingCart</div>
    <form action="logout" method="get">
        <button type="submit">Logout</button>
    </form>
</header>

<main>
    <div class="container">
        <h2>Added to Cart !</h2>
        <div class="product-name">"<%= addedProduct.getProductName() %>"</div>

        <form action="viewCart" method="get" style="display:inline;">
            <button class="btn-cart">View Cart</button>
        </form>

        <form action="viewProducts" method="get" style="display:inline;">
            <button class="btn-continue">Continue Shopping</button>
        </form>

        
    </div>
</main>

<footer>
    © 2025 MyShoppingCart. All rights reserved.
</footer>

</body>
</html>
