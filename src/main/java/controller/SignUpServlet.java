package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BO.TaskBO;
import model.BO.UserBO;

/**
 * Servlet implementation class AddTaskServlet
 */
@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpServlet() {
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
		String ID = request.getParameter("id");
		String Name = request.getParameter("name");
		String Username = request.getParameter("username");
		String Password = request.getParameter("password");
		String Email = request.getParameter("email");
		UserBO userBO = new UserBO();
		boolean check = userBO.addUser(ID, Name,Email, Password, Username) ;
		if(check == true )
		{
			response.sendRedirect("Login.jsp");
		}
		else {
			PrintWriter out = response.getWriter();
			 out.println("<script type=\"text/javascript\">");
			   out.println("alert('Username or Email already exists! Please enter again');");
			   out.println("location='Signup.jsp';");
			   out.println("</script>");
		    
		}
		
	}

}
