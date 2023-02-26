<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LOG IN</title>
    <%@include file="Style/all_css.jsp"%>
    <link rel="stylesheet" href="./Style/Login.css">
    <link rel="stylesheet" href="./Style/Login_SignUp.css">
</head>
<body>
<%--  <form name=form1 action="CheckLoginServlet" method="post">
Username: <input type="text" name="username" />
Password: <input type="password" name="password" />
<input type="submit" name="Login" />
<input type="reset" name="Reset" />
<a href="AddUser.jsp">Sign-up</a>*/--%>
<div class="container">
    <div class="form-wrapper">
        <div class="banner">
            <h1>Hello, Friend!</h1>
            <p>Don't have an account ? Sign up here </p>
        </div>

        <div class="green-bg">
            <form action="Signup.jsp">
                <button type="submit">Sign Up</button>
            </form>
        </div>

        <form class="signup-form" action="CheckLoginServlet" method="post" autocomplete="off">
            <h1>Account Login</h1>
            <p>Enter your personal details and start journey with us</p>
            <div class="input-group">
                <i class="fas fa-user"></i>
                <input type="text" placeholder="Username" name="username" required autocomplete="off"/>
            </div>
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" placeholder="Password" name="password" required autocomplete="off"/>
            </div>
            <button type="submit">Log in</button>
        </form>
	</div>
</div>
</body>
</html>