<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="Model.Product" %>
<%@ page import="Model.Customer"%>

<%
Customer c = (Customer) session.getAttribute("customerData");
if (c == null)
{
	response.sendRedirect("viewProducts");
	return;		
}
    ArrayList<Product> cart = (ArrayList<Product>) session.getAttribute("cartData");
    Double total = (Double) session.getAttribute("cartproductsTotalAmount");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:"Poppins",sans-serif;
}

body{
    background: linear-gradient(135deg, #fdfbfb, #ebedee);
    padding-top:90px;
    padding-bottom:70px;
}

header{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    background: linear-gradient(135deg, #fbc2eb, #a6c1ee);
    padding:16px 30px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 8px 22px rgba(0,0,0,0.25);
    z-index:1000;
}

.logo{
    color:#fff;
    font-size:26px;
    font-weight:800;
}

.header-actions{
    display:flex;
    gap:12px;
}

.header-actions a{
    text-decoration:none;
    padding:10px 22px;
    border-radius:30px;
    font-size:14px;
    font-weight:700;
    color:white;
    transition:0.3s;
}

.continue-btn{
    background:#22c55e;
}

.logout-btn{
    background:#ef4444;
}

.header-actions a:hover{
    transform:translateY(-2px);
    box-shadow:0 6px 16px rgba(0,0,0,0.2);
}

.container{
    max-width:1100px;
    margin:auto;
}

.cart-header{
    background:#ffffff;
    padding:25px;
    border-radius:18px;
    box-shadow:0 10px 25px rgba(0,0,0,0.08);
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:30px;
}

.cart-header h2{
    color:#2c3e50;
}

.total{
    font-size:20px;
    font-weight:600;
    color:#27ae60;
}

.btn{
    padding:12px 26px;
    border:none;
    border-radius:12px;
    font-size:15px;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;
}

.btn-buy{
    background: linear-gradient(135deg, #667eea, #764ba2);
    color:white;
}

.btn-buy:hover{
    transform:scale(1.05);
    box-shadow:0 8px 20px rgba(118,75,162,0.4);
}

.cart-item{
    background:#ffffff;
    padding:20px;
    border-radius:18px;
    box-shadow:0 8px 22px rgba(0,0,0,0.08);
    display:flex;
    gap:20px;
    margin-bottom:20px;
}

.cart-item img{
    width:140px;
    height:140px;
    object-fit:cover;
    border-radius:14px;
    background:#f2f2f2;
}

.details{
    flex:1;
}

.details h3{
    margin-bottom:10px;
    color:#34495e;
}

.price{
    font-size:18px;
    font-weight:600;
    color:#2ecc71;
}

.qty{
    display:inline-block;
    background:#e8f0fe;
    color:#3f51b5;
    padding:6px 14px;
    border-radius:20px;
    font-weight:600;
    margin:8px 0;
}

.delivery{
    background:#f5f6fa;
    padding:6px 14px;
    border-radius:14px;
    color:#636e72;
    display:inline-block;
    margin-top:8px;
    font-size:14px;
}

.actions{
    margin-top:15px;
}

.btn-small{
    padding:10px 20px;
    border-radius:10px;
    margin-right:10px;
}

.btn-remove{
    background: linear-gradient(135deg, #ff512f, #dd2476);
    color:white;
}

.btn-remove:hover{
    transform:translateY(-2px);
    box-shadow:0 6px 16px rgba(221,36,118,0.4);
}

footer{
    position:fixed;
    bottom:0;
    left:0;
    width:100%;
    background: linear-gradient(135deg, #fbc2eb, #a6c1ee);
    text-align:center;
    padding:16px 0;
    font-size:14px;
    font-weight:600;
    box-shadow:0 -4px 15px rgba(0,0,0,0.15);
}
</style>
</head>

<body>

<header>
    <div class="logo">MyShoppingCart</div>
    <div class="header-actions">
        <a href="viewProducts" class="continue-btn">Continue Shopping</a>
        <a href="logout" class="logout-btn">Logout</a>
    </div>
</header>

<div class="container">

<div class="cart-header">
    <h2>Your Shopping Cart</h2>
    <div>
        <span class="total">Total: ₹ <%= String.format("%.2f", total) %></span>
        &nbsp;&nbsp;
        <form action="buyAll" method="post" style="display:inline;">
            <button class="btn btn-buy">Buy All</button>
        </form>
    </div>
</div>

<%
    int i = 0;
    for (Product p : cart) {
        LocalDate deliveryDate = LocalDate.now().plusDays(2 + i);
        i++;
%>
<div class="cart-item">
    <img src="<%=request.getContextPath()%>/ProductsImages/<%=p.getProductImage()%>" alt="<%=p.getProductName()%>">
    <div class="details">
        <h3><%= p.getProductName() %></h3>
        <div class="price">
            ₹ <%= String.format("%.2f", p.getProductPrice() * p.getProductQuantity()) %>
        </div>
        <div class="qty">
            Quantity: <%= p.getProductQuantity() %>
        </div>
        <div class="delivery">
            Delivery by <strong><%= deliveryDate %></strong>
        </div>
        <div class="actions">
            <form action="buy" method="post" style="display:inline;">
                <input type="hidden" name="productId" value="<%= p.getProductId() %>">
                <button class="btn btn-small btn-buy">Buy Now</button>
            </form>
            <form action="removeFromCart" method="post" style="display:inline;">
                <input type="hidden" name="productId" value="<%= p.getProductId() %>">
                <button class="btn btn-small btn-remove">Remove</button>
            </form>
        </div>
    </div>
</div>
<%
    }
%>

</div>

<footer>
    © 2025 MyShoppingCart. All Rights Reserved.
</footer>

</body>
</html>
