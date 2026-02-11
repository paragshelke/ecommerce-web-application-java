<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
Boolean isLogin = (Boolean) session.getAttribute("isLogin");

if (isLogin == null || !isLogin)
{
	response.sendRedirect("admin_login.html");
	return;
}
    String productId = request.getParameter("productid");
    session.setAttribute("productID", productId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Update Product | MyShoppingCart</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:"Poppins",sans-serif;
}

html, body {
    height: 100%;
}

body{
    min-height:100vh;
    background: linear-gradient(135deg,#e0f7fa,#ffe0f0);
    padding-top:90px;
    padding-bottom:70px;
}

header{
    background: linear-gradient(135deg, #fbc2eb, #a6c1ee);
    padding:16px 30px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 8px 22px rgba(0,0,0,0.25);
    position:fixed;
    top:0;
    left:0;
    width:100%;
    z-index:1000;
}

.logo{
    color:#fff;
    font-size:30px;
    font-weight:800;
    letter-spacing:2px;
    text-shadow:2px 2px 8px rgba(0,0,0,0.25);
}

.header-actions{
    display:flex;
    gap:12px;
}

.header-actions a,
.header-actions form button{
    padding:10px 22px;
    border-radius:30px;
    border:none;
    font-size:14px;
    font-weight:700;
    cursor:pointer;
    text-decoration:none;
    color:#fff;
    transition:0.3s;
}

.home-btn{
    background:#22c55e;
}

.logout-btn{
    background:#ff758c;
}

.header-actions button:hover,
.header-actions a:hover{
    transform:translateY(-2px);
    box-shadow:0 6px 18px rgba(0,0,0,0.15);
}

.main-content{
    min-height:calc(100vh - 160px);
    display:flex;
    justify-content:center;
    align-items:center;
}

.form-card{
    width:380px;
    padding:28px;
    border-radius:20px;
    background: linear-gradient(135deg,#ffffff,#f0f4ff);
    box-shadow:0 6px 18px rgba(0,0,0,0.08);
}

h3{
    text-align:center;
    color:#2c3e50;
    font-size:22px;
    margin-bottom:24px;
}

.input-group{
    margin-bottom:16px;
}

label{
    display:block;
    font-size:14px;
    font-weight:600;
    color:#34495e;
    margin-bottom:6px;
}

input, textarea{
    width:100%;
    padding:12px 14px;
    border-radius:12px;
    border:1px solid #cfd8dc;
    background:#f9f9ff;
    font-size:14px;
    color:#2c3e50;
    outline:none;
}

textarea{
    resize:none;
    height:80px;
}

input:focus,
textarea:focus{
    border-color:#74b9ff;
    background:#ffffff;
}

.action-btn{
    width:100%;
    padding:14px;
    margin-top:10px;
    border-radius:16px;
    border:none;
    cursor:pointer;
    font-size:15px;
    font-weight:600;
    color:#ffffff;
    background: linear-gradient(135deg,#ff6b6b,#feca57);
    transition:0.3s;
}

.action-btn:hover{
    background: linear-gradient(135deg,#ff5252,#ffb347);
}

footer{
    background: linear-gradient(135deg, #fbc2eb, #a6c1ee);
    text-align:center;
    padding:16px 0;
    font-size:14px;
    font-weight:600;
    color:#000;
    box-shadow:0 -4px 15px rgba(0,0,0,0.15);
    position:fixed;
    bottom:0;
    left:0;
    width:100%;
}
</style>
</head>

<body>

<header>
    <div class="logo">MyShoppingCart</div>
    <div class="header-actions">
    	 <form action="adminServlet" method="post">
            <button class="home-btn">Admin Dashboard</button>
        </form>
        <form action="logout" method="get">
            <button class="logout-btn">Logout</button>
        </form>
    </div>
</header>

<div class="main-content">
    <div class="form-card">
        <h3>Update Product</h3>

        <form action="updateProduct" method="post" enctype="multipart/form-data">
            <input type="hidden" name="productId" value="<%= productId %>">

            <div class="input-group">
                <label>Product Name</label>
                <input type="text" name="productName">
            </div>

            <div class="input-group">
                <label>Product Price</label>
                <input type="number" step="0.01" name="productPrice">
            </div>

            <div class="input-group">
                <label>Product Image</label>
                <input type="file" name="productImage" accept="image/*" required>
            </div>

            <div class="input-group">
                <label>Product Description</label>
                <textarea name="productDescription"></textarea>
            </div>

            <button type="submit" class="action-btn">Update Product</button>
        </form>
    </div>
</div>

<footer>
    © 2025 MyShoppingCart. All Rights Reserved.
</footer>

</body>
</html>
