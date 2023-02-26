<%@page import="model.BEAN.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./Style/Profile.css">
    <%@include file="Style/all_css.jsp"%>
</head>
<body>
<%
	
	String email = (String)session.getAttribute("email");
	String name = (String)session.getAttribute("name");
%>
<div class="box_container">
        <div class="box_content">
            <div class="info_content">
                <div class="edit_prf title_lable">
                    <i class="fa-regular fa-address-card"></i>
                    <p>Edit Profile</p>
                </div>
                <div class="container_box">
                    <div class="box"></div>
                </div>
                <form name=form1 action="UpdateUserServlet" method="post">
                <div class="title_input input input_full">
                    <i class="fa-solid fa-address-book"></i>
                    <input type="text" id="name_id" name="name" placeholder="Name" value="<%=name%>">
                </div>
                <div class="title_input input input_full">
                    <i class="fa-solid fa-envelope"></i>
                    <input type="email" id="email_id" name="email" placeholder="Email" value="<%=email%>">
                </div>
                <div class="button_edit">
                    <div class="butAdd">
                        <button type="reset">Reset</button>
                    </div>
                    <div class="butAdd">
                        <button type="submit">Save</button>
                    </div>
                    </form>
                </div>
                <div class="change_pass title_lable">
                    <i class="fa-solid fa-gears"></i>
                    <p>Change Password</p>
                </div>
                <div class="container_box">
                    <div class="box"></div>
                </div>
                <form name=form1 action="ChangePasswordServlet" method="post">
                <div class="title_input input input_full">
                    <i class="fas fa-lock"></i>
                    <input type="password" id="pass_current" name="password" placeholder="Current Password">
                </div>
                <div class="title_input input input_full">
                    <i class="fa-solid fa-unlock"></i>
                    <input type="password" id="pass_new" name="newpass" placeholder="New Password">
                </div>
                <div class="title_input input input_full">
                    <i class="fa-solid fa-clipboard-check"></i>
                    <input type="password" id="pass_conf" name="confirmpass" placeholder="Confirm Password">
                </div>
                <div class="butAdd">
                    <button type="submit">Save</button>
                </div>
                </form>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</body>
</html>