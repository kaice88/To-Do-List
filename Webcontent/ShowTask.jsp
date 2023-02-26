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
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        outline: none;
        font-family: 'Quicksand', sans-serif;
    }

    html {
        font-size: 62.5%;
    }

    .container {
        width: 100%;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .form-wrapper {
        width: 100rem;
        height: 70rem;
        background-color: #fff;
        border-radius: 3rem;
        box-shadow: 0 2rem 6rem rgba(0, 0, 0, 0.3);
        position: relative;
        overflow: hidden;
        border: 5px solid;
        border-color: #A18AFF;
        display: flex;
    }

    .left_frame {
        width: 25rem;
        float: left;
        height: 70rem;
    }

    .right_frame {
        width: 75rem;
        float: left;
        height: 70rem;
    }
</style>
<body>
<div class="container">
    <div class="form-wrapper">
        <div class="left_frame">
        
           <%-- <iframe src="SideBar.jsp" width="100%" height="100%" frameborder="0">
            </iframe>
          <jsp:include page="SideBar.jsp" flush="true" />--%>
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
				ArrayList<String>  topicList = (ArrayList<String>)session.getAttribute("topicList");
				for(int i = 0; i < topicList.size();i++){
			%>
                <a class="" target="main" href="ShowTaskServlet?mod=today&topic=<%=topicList.get(i)%>">
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
            <a class="sidebar_nav-sub" target="main" href="./Profile.jsp">
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
                <a class="logout_txt" href="LogoutServlet">Log out</a>
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
        const tabContainer_topic = $('.topic_sidebar_container');


        tabs.forEach((tab) => {

            tab.onclick = function () {
                console.log(this);
                $('.td.active').classList.remove('active');
                this.classList.add('active');
            };
        }); 
       
    </script>
          
        </div>
        <div class="right_frame">
            <iframe src="ShowTaskServlet?mod=today" width="100%" height="100%" frameborder="0" name="main">
            </iframe>
        </div>
    </div>
</div>

</body>
</html>