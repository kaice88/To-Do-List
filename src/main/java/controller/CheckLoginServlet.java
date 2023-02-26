package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BO.TaskBO;
import model.BO.UserBO;

/**
 * Servlet implementation class CheckLoginServlet
 */
@WebServlet("/CheckLoginServlet")
public class CheckLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckLoginServlet() {
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
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Integer userID = null;
		UserBO userBO = new UserBO();
		TaskBO taskBO = new TaskBO();
		
		if(userBO.isValidUser(username, password)) {
			userID = userBO.getUserInfo(username, password).getID();
			HttpSession session = request.getSession(true);
			session.setAttribute("userID", userID);
			session.setAttribute("username", username);
			session.setAttribute("email", userBO.getUserInfo(username, password).getEmail());
			session.setAttribute("name", userBO.getUserInfo(username, password).getName());
			ArrayList<String>  topicList = taskBO.getTopicList(userID);
			session.setAttribute("topicList", topicList);
			System.out.println(topicList);
			request.getRequestDispatcher("ShowTask.jsp").forward(request, response);
			}
		else {
			response.sendRedirect("Login.jsp");
		}
	}

}
