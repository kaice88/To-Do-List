<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 11/29/2022
  Time: 9:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.util.*"%>
<%@page import="model.BEAN.Task"%>
<%@page import="java.text.*"%>
<%@page import="javax.servlet.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="./Style/ShowTaskSchedule.css">
    <link rel="stylesheet" href="./Style/Today_Schedule.css">
    <%@include file="Style/all_css.jsp"%>
</head>
<body>
<div class="main_today">
        <div class="content">
        <%
        SimpleDateFormat ft1 = new SimpleDateFormat ("hh:mm a");
        SimpleDateFormat ft2 = new SimpleDateFormat ("hh:mm:ss");
	ArrayList<ArrayList>  taskListSchedule = (ArrayList<ArrayList>)request.getAttribute("taskListSchedule");
        ArrayList<String>  dateList = (ArrayList<String>)request.getAttribute("dateList");
	for(int j = 0; j < taskListSchedule.size();j++){
		%>
            <ul class="todoList">
                <div class="center">
                    <p class="center_above"><%= dateList.get(j)%></p>
                </div>
                <% ArrayList<Task>  taskList = (ArrayList<Task>)taskListSchedule.get(j);
					for(int i = 0;i < taskList.size();i++){
				%>
                <li class="totoLi">
                <label class="sub-todoList todoList_cb container_cb">
                <%
				if(taskList.get(i).getStatus() == true ) {
				%>
                    <input type="checkbox" checked="checked" onchange='handleUpdateStatus(this,<%= taskList.get(i).getID()%>);' name="status">
                 <% } else {%>
                    <input type="checkbox" name="status" onchange='handleUpdateStatus(this,<%= taskList.get(i).getID()%>);'>
                 <% }%>
                    <span class="checkmark"></span>
                </label>
                <p class="sub-todoList todoList_txt" >
                   <%= taskList.get(i).getTitle()%>
                </p>
                <div class="sub-todoList todoList_dot">
                    <i class="fa-sharp fa-solid fa-circle"></i>
                </div>
                <p class="sub-todoList todoList_topic">
                    <%= taskList.get(i).getTopic()%>
                </p>
                <p class="sub-todoList todoList_time">
                    <%= ft1.format(ft2.parse(taskList.get(i).getTime()))%>
                </p>
                <div class="sub-todoList todoList_icon">
                	
                 		<button type="button" class="icon edit" >
                 			<a href="UpdateTaskServlet?id=<%= taskList.get(i).getID()%>" class="icon edit">
                 				<i class="fa-solid fa-pen-to-square"></i>
                 			</a>
                 		</button>
    	                  
                 		<button type="submit" class="icon delete">
                 			<a href="DeleteTaskServlet?id=<%= taskList.get(i).getID()%>" class="icon delete">
                 				<i class="fa-sharp fa-solid fa-trash"></i>
                 			</a>
                 		</button>
    	    		
                </div>
            </li>
              
			
			<%}%></ul><%} %>
        </div>
    </div>
    <script language="javascript">
 function handleUpdateStatus(cb,i)
            {
            	var value = cb.checked;
            	if(value == true) {
            		value = 1;
            	} else value = 0;
            		
                window.location.href = "UpdateTaskStatus?mod=all&value="+value+"&id="+i;
            }

        </script>
</body>
</html>
