package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BO.TaskBO;

/**
 * Servlet implementation class AddTaskServlet
 */
@WebServlet("/AddTaskServlet")
public class AddTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTaskServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		Integer userID = (Integer) session.getAttribute("userID");
		TaskBO taskBO = new TaskBO();
		ArrayList<String>  topicList = taskBO.getTopicList(userID);
		request.setAttribute("topicList", topicList);
		PrintWriter out = response.getWriter();
		out.println("<script type=\"text/javascript\">");
	    out.println("alert('User or password incorrect');");
	    out.println("</script>");
		request.getRequestDispatcher("AddTask.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Title = request.getParameter("Title");
		String Note = request.getParameter("Note");
		String Date = request.getParameter("Date");
		String Time = request.getParameter("Time");
		String Topic = request.getParameter("Topic");
		HttpSession session = request.getSession(true);
		Integer userID = (Integer) session.getAttribute("userID");
		TaskBO taskBO = new TaskBO();
		taskBO.addTask(Title, Note, Date, Integer.toString(userID), Time, Topic);
		response.sendRedirect("ShowTaskServlet?mod=today");
	}

}
