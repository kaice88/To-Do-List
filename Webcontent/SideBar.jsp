<%@page import="java.util.*"%>
<%@page import="model.BEAN.Task"%>
<%@page import="java.text.*"%>
<%@page import="javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="./Style/SideBar.css">
    <%@include file="Style/all_css.jsp"%>
</head>
<body>
<div class="sidebar">
        <div class="sidebar_profile">
            <table>
                <tbody>
                    <tr>
                        <td class="td_icon-tb" rowspan="2">
                            <div>
                                <i class="fa-solid fa-circle-user td_icon-ava"></i>
                            </div>
                        </td>
                        <td class="td_txt-tb">
                            <p>Do-it</p>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_txt-tb">
                            <p>Quynh Linh</p>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="container_box">
                <div class="box"></div>
            </div>
        </div>
        <div class="sidebar_nav">
            <a class="sidebar_nav-sub" target="main" href="ShowTaskServlet?mod=today">
                <div class="td active td_today">
                    <div class="td_icon">
                        <i class="fa-regular fa-calendar-check"></i>
                    </div>
                    <div class="td_txt">
                        <p>Today tasks</p>
                    </div>
                </div>
            </a>
            <div class="topic_sidebar_container">
             <%
				ArrayList<Task>  topicList = (ArrayList<Task>)request.getAttribute("topicList");
				for(int i = 0; i < topicList.size();i++){
			%>
                <a class="" target="main" href="">
                    <div class="sidebar_topic">
                        <div class="sidebar_topic-dot">
                            <i class="fa-sharp fa-solid fa-circle"></i>
                        </div>
                        <div class="sidebar_topic-txt">
                             <%= topicList.get(i)%>
                        </div>
                    </div>
                </a>
			<% }%>
            </div>
            <a class="sidebar_nav-sub" target="main" href="ShowTaskServlet?mod=all">
                <div class="td">
                    <div class="td_icon">
                        <i class="fa-regular fa-calendar"></i>
                    </div>
                    <div class="td_txt">
                        <p>Scheduled tasks</p>
                    </div>
                </div>
            </a>
            <a class="sidebar_nav-sub" target="main" href="./main_scheduled.jsp">
                <div class="td">
                    <div class="td_icon">
                        <i class="fa-regular fa-user"></i>
                    </div>
                    <div class="td_txt txt_profile">
                        <p>Profile</p>
                    </div>
                </div>
            </a>
            <div class="container_box container_box-logout ">
                <div class="box box_logout"></div>
            </div>

            <div class="logout_container">
                <i class="fa-solid fa-right-from-bracket logout_icon"></i>
                <p class="logout_txt">Log out</p>
            </div>
        </div>
    </div>
    <script>
        const $ = document.querySelector.bind(document);
        const $$ = document.querySelectorAll.bind(document);

        const tabs = $$('.td');
        const tabs_topic = $$('.sidebar_topic');

        const tabActive = $('.td.active');
        const tabActive_topic = $('.sidebar_topic.active');


        tabs.forEach((tab) => {

            tab.onclick = function () {
                console.log(this);
                $('.td.active').classList.remove('active');
                this.classList.add('active');
            };
        });
    </script>

</body>
</html>