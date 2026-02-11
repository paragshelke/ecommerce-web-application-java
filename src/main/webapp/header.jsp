<%@ page contentType="text/html;charset=UTF-8" %>

<style>
/* GLOBAL RESET */
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: 'Poppins', sans-serif;
}

/* HEADER */
header {
    width: 100%;
    background: linear-gradient(135deg, #fbc2eb, #a6c1ee);
    padding: 16px 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 8px 22px rgba(0,0,0,0.25);
    position: sticky;
    top: 0;
    z-index: 1000;
    overflow: hidden; /* prevents button overflow */
}

/* LOGO */
.logo {
    color: #ffffff;
    font-size: 32px;
    font-weight: 800;
    letter-spacing: 2px;
    text-shadow: 2px 2px 8px rgba(0,0,0,0.25);
}

/* ACTIONS */
.nav-actions {
    display: flex;
    align-items: center;
}

/* LOGOUT BUTTON */
.logout {
    padding: 10px 24px;
    border-radius: 30px;
    border: none;
    font-size: 14px;
    font-weight: 700;
    cursor: pointer;
    background: linear-gradient(135deg, #ff758c, #ff7eb3);
    color: #fff;
    transition: 0.3s ease;
    white-space: nowrap;
}

.logout:hover {
    transform: translateY(-2px) scale(1.08);
    box-shadow: 0 10px 25px rgba(0,0,0,0.35);
}
</style>

<header>
    <div class="logo">MyShoppingCart</div>

    <div class="nav-actions">
        <form action="logout" method="get">
            <button type="submit" class="logout">Logout</button>
        </form>
    </div>
</header>
