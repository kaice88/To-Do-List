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
 <link rel="stylesheet" href="./Style/ShowTaskToday.css">
  <link rel="stylesheet" href="./Style/Today_Schedule.css">
    <%@include file="/Style/all_css.jsp"%>
</head>
<body>
<div class="main_today">
    <div class="center">
    
        <p class="center_above">Welcome <%=session.getAttribute("username")%>! </p>
        <p class="center_below">Become focused and organized. </p>
    </div>
    <div class="content ">
        <ul class="todoList custom-scrollbar-js">
        <%
        SimpleDateFormat ft1 = new SimpleDateFormat ("hh:mm a");
        SimpleDateFormat ft2 = new SimpleDateFormat ("hh:mm:ss");
	ArrayList<Task>  taskList = (ArrayList<Task>)request.getAttribute("taskList");
	for(int i = 0; i < taskList.size();i++){
		%>
            <li>
                <label class="sub-todoList todoList_cb container_cb">
                <%
				if(taskList.get(i).getStatus() == true ) {
				%>
                    <input type="checkbox" checked="checked" onchange ='handleUpdateStatus(this,<%= taskList.get(i).getID()%>);' name="status">
                 <% } else {%>
                    <input type="checkbox" onchange ='handleUpdateStatus(this,<%= taskList.get(i).getID()%>);' name="status">
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
            <%} %>

        </ul>
    </div>
    <div class="butAdd">
    	<form action="AddTaskServlet" method="get">
    	<button type="submit">Add Tasks</button>
    	</form>
        
    </div>
</div>
 <script language="javascript">
 function handleUpdateStatus(cb,i)
            {
            	var value = cb.checked;
            	if(value == true) {
            		value = 1;
            	} else value = 0;
            		
                window.location.href = "UpdateTaskStatus?mod=today&value="+value+"&id="+i;
            }

        </script>

</body>
</html>