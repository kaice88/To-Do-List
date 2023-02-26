<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form name=form1 action="ChangePasswordServlet" method="post">
Pass: <input type="text" name="password" />
New Pass: <input type="text" name="newpass" />
Confirm Pass: <input type="password" name="confirmpass" />
<input type="submit" name="Change" />
<input type="reset" name="Reset" />
</form>
</body>
</body>
</html>