package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BEAN.Task;
import model.BO.TaskBO;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/UpdateTaskServlet")
public class UpdateTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTaskServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ID = request.getParameter("id");
		TaskBO taskBO = new TaskBO();
		HttpSession session = request.getSession(true);
		Integer userID = (Integer) session.getAttribute("userID");
		Task task = taskBO.getTaskByID(Integer.parseInt(ID),userID);
		request.setAttribute("task", task);
		ArrayList<String>  topicList = taskBO.getTopicList(userID);
		request.setAttribute("topicList", topicList);
		request.getRequestDispatcher("UpdateTask.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ID = request.getParameter("ID");

		String Title = request.getParameter("Title");
		String Note = request.getParameter("Note");
		String Date = request.getParameter("Date");
		String Time = request.getParameter("Time");
		String Topic = request.getParameter("Topic");
		TaskBO taskBO = new TaskBO();
		HttpSession session = request.getSession(true);
		Integer userID = (Integer) session.getAttribute("userID");
		taskBO.updateTask(ID, Title, Note, Date, Integer.toString(userID), Time, Topic);
		response.sendRedirect("ShowTaskServlet?mod=today");

	}

}
