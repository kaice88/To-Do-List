<%@page import="java.util.ArrayList"%>
<%@page import="model.BEAN.Task"%>
<%@page import="javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    table {
        border-collapse: collapse;
        width: 100%;
        font-family: 'Comfortaa', cursive;

    }

    table td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
        vertical-align: middle;
    }

    table tr:nth-child(odd) {
        /* background-color: #DEA6A6; */

        background-color: #BCD7E3;
    }

    table tr:hover {
        background-color: #7EB7C3;
    }


    table a {
        text-decoration: none;
        color: black;
    }
</style>
</head>
<body>
<table border="1" >
<%
	ArrayList<Task>  taskList = (ArrayList<Task>)request.getAttribute("taskList");
	for(int i = 0; i < taskList.size();i++){
%>
<tr>
<td><%= taskList.get(i).getID()%></td>
<td><%= taskList.get(i).getUser_ID()%></td>
<td><%= taskList.get(i).getTitle()%></td>
<td><%= taskList.get(i).getNote()%></td>
<td><%= taskList.get(i).getTopic()%></td>
<td><%= taskList.get(i).getTime()%></td>
<td><%= taskList.get(i).getDate()%></td>
<%
if(taskList.get(i).getStatus() == true ) {%>
<td><input type="checkbox" name="status" onchange ='handleClick(this);' value="<%= taskList.get(i).getStatus()%>" checked></td>
<%} else {%>
<td><input type="checkbox" name="status" onchange ='handleClick(this);' value="<%= taskList.get(i).getStatus()%>"></td>
<% }%>
<td><a href="DeleteTaskServlet?id=<%= taskList.get(i).getID()%>">Delete</a></td>
<td><a href="UpdateTaskServlet?id=<%= taskList.get(i).getID()%>">Delete</a></td>
</tr>
<% }%>
</table>
<a href="AddTaskServlet">Create New Task</a>    
<a href="ChangePassword.jsp">Change your password</a>  
<a href="LogoutServlet">Log out</a>  
<a href="ShowTaskServlet?mod=all">Show All</a>  
<input type="date" name="Date" min="2018-01-01" max="2018-12-31" onchange="handler(event);">
<select name="topic" onchange="showTaskByTopic(this)">
<option value="null">Chon :</option>
  <%
ArrayList<String>  topicList = (ArrayList<String>)request.getAttribute("topicList");
for(int i = 0; i < topicList.size();i++){
 %>
 <option value="<%=topicList.get(i)%>"><%=topicList.get(i)%></option>
<%} %>
 </select>
 <script language="javascript">
 function showTaskByTopic(obj)
            {
            	var topic = document.getElementById('topic');
                var value = obj.value;
                if(value === 'null') {
                	
                }
                else {
                	window.location.href = "ShowTaskServlet?mod=today&topic="+value;
                }

            }
 function handleClick(cb) {
	  console.log(cb.checked);
	}
 
        </script>
</body>
</html>