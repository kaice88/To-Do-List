<%@page import="model.BEAN.Task"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <!-- <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/dark.css"> -->
        <%@include file="Style/all_css.jsp"%>
    <link rel="stylesheet" href="Style/AddTask.css">
</head>
<body>
 			<%
				Task task = (Task)request.getAttribute("task");
   
			%>
 

        </form>--%>
        <div class="box_container">
        <a href="ShowTaskServlet?mod=today"> <button type="button" class="but_exit" >
            <i class="fa-solid fa-xmark"></i>
        </button></a>
       
        <div class="box_content">
            <div class="info_content">
            <form action="UpdateTaskServlet?ID=<%= task.getID()%>" method="post">
            <div class="title_input input input_full">
                    <i class="fa-solid fa-bars-staggered"></i>
                    <input type="text" id="title" name="Title" placeholder="Title" value="<%= task.getTitle()%>">
                </div>
                <div class="topic_input input input_full">
                    <i class="fa-regular fa-hashtag"></i>
                    <input list="topics" name="Topic" id="topic" placeholder="Topic" value="<%= task.getTopic()%>">
                    <datalist id="topics">
        			<%
					ArrayList<String>  topicList = (ArrayList<String>)session.getAttribute("topicList");
					for(int i = 0; i < topicList.size();i++){
						
					%>
                        <option value="<%=topicList.get(i)%>">
                        <%} %>
                    </datalist>
                </div>
                <div class="datetime_input">
                    <div class="date_input dt_input input">
                        <i class="fa-regular fa-calendar"></i>
                        <%String day = task.getDate().substring(9);
                		String month = task.getDate().substring(5, 7);
                		String year = task.getDate().substring(0,4);
                		String newDate = day+"-"+month+"-"+year; %>
                        <input id="date_id" placeholder="Date" name="Date" value="<%=newDate%>">
                
                    </div>
                    <div class="time_input dt_input input">
                        <i class="fa-regular fa-clock"></i>
                        <input id="time_id" placeholder="Time" name="Time" value="<%= task.getTime()%>">
                    </div>
                </div>
                <div class="note_input input input_full">
                    <i class="fa-regular fa-note-sticky"></i>
                    <textarea name="Note" id="note" cols="30" rows="5" placeholder="Notes" ><%= task.getNote()%></textarea>
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
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script>
        flatpickr("#date_id", {
            dateFormat: "d-m-Y",
        });
        flatpickr("#time_id", {
            enableTime: true,
            noCalendar: true,
            dateFormat: "H:i",
        });

    </script>
</body>
</html>