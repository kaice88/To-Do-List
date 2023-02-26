<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SIGN UP</title>
 <%@include file="Style/all_css.jsp"%>
    <link rel="stylesheet" href="./Style/SignUp.css">
    <link rel="stylesheet" href="./Style/Login_SignUp.css">
</head>
<body>

 <div class="container">
    <div class="form-wrapper">
        <div class="banner">
            <h1>Hello, Friend!</h1>
            <p>If you are already a member, you can login here</p>
        </div>

        <div class="green-bg">
            <form action="Login.jsp">
                <button type="submit">Log in</button>
            </form>
        </div>

        <form class="signup-form" action="SignUpServlet" method="post">
            <h1>Create Account</h1>
            <p>Enter your personal details and start journey with us</p>
            <div class="input-group">
                <i class="fa-solid fa-address-book"></i>
                <input type="text" placeholder="Name" name="name"  required autocomplete="off"/>
            </div>
            <div class="input-group">
                <i class="fa-solid fa-address-book"></i>
                <input type="text" placeholder="Email" name="email"  required autocomplete="off"/>
            </div>
            <div class="input-group">
                <i class="fas fa-user"></i>
                <input type="text" placeholder="Username" name="username" required autocomplete="off"/>
            </div>
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" placeholder="Password" name="password" required autocomplete="off"/>
            </div>
            <button type="submit">Sign up</button>
        </form>
    </div>
</div>
</body>
</html>