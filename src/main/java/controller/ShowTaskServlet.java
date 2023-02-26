package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BEAN.Task;
import model.BO.TaskBO;

/**
 * Servlet implementation class ShowTaskServlet
 */
@WebServlet("/ShowTaskServlet")
public class ShowTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowTaskServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String destination = null;
		String show = request.getParameter("mod");
		String topic = request.getParameter("topic");
		HttpSession session = request.getSession(true);
		Integer userID = (Integer) session.getAttribute("userID");
		TaskBO taskBO = new TaskBO();
		ArrayList<Task> taskList = null;
		ArrayList<ArrayList> taskListSchedule = new ArrayList<ArrayList>();
		ArrayList<String>  topicList = taskBO.getTopicList(userID);
		ArrayList<String>  dateList = taskBO.getDateList(userID) ;
		Collections.sort(dateList, (o1, o2) -> o2.compareTo(o1));
		request.setAttribute("topicList", topicList);
		
		if(topic == null) {
			if(show.equals("today")) {
				taskList = taskBO.getTaskListToday(userID,null);
				request.setAttribute("taskList", taskList);
				destination = "/ShowTaskToday.jsp";
				request.getRequestDispatcher(destination).forward(request, response);
			}
			else if(show.equals("all")) {
				for(int i = 0 ; i < dateList.size(); i++) {
					taskList = taskBO.getTaskListSchedule(userID, dateList.get(i));
					System.out.println(dateList.get(i));
					taskListSchedule.add(taskList);
				}
				request.setAttribute("taskListSchedule", taskListSchedule);
				request.setAttribute("dateList", dateList);
				destination = "/ShowTaskSchedule.jsp";
				request.getRequestDispatcher(destination).forward(request, response);
			}
		}
		else {
				taskList = taskBO.getTaskListToday(userID,topic);
				request.setAttribute("taskList", taskList);
				destination = "/ShowTaskToday.jsp";
				request.getRequestDispatcher(destination).forward(request, response);
			}

		
		
	}

}
