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

import model.BEAN.Task;
import model.BEAN.User;
import model.BO.TaskBO;
import model.BO.UserBO;

/**
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserBO userBO = new UserBO();
		HttpSession session = request.getSession(true);
		Integer userID = (Integer) session.getAttribute("userID");
		String Name = request.getParameter("name");
		String Email = request.getParameter("email");
		
		boolean check = userBO.updateUser(Integer.toString(userID), Name, Email);
		if(check == true )
		{
			session.setAttribute("email", Email);
			session.setAttribute("name", Name);
			response.sendRedirect("ShowTaskServlet?mod=today");
		}
		else {
			PrintWriter out = response.getWriter();
			 out.println("<script type=\"text/javascript\">");
			   out.println("alert('Email already exists! Please enter again');");
			   out.println("location='Profile.jsp';");
			   out.println("</script>");
		    
		}
		
	}

}
