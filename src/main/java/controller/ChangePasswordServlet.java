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
 * Servlet implementation class ChangePasswordServlet
 */
@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServlet() {
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
		String Password = request.getParameter("password");
		String newPass = request.getParameter("newpass");
		String confirmPass = request.getParameter("confirmpass");
		HttpSession session = request.getSession(true);
		Integer userID = (Integer) session.getAttribute("userID");
		UserBO userBO = new UserBO();
		
		if(userBO.checkPass(Integer.toString(userID),Password,newPass,confirmPass)) {
			userBO.changePass(Integer.toString(userID),newPass);
			response.sendRedirect("ShowTaskServlet?mod=today");
		}else {
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
		    out.println("alert('User or password incorrect');");
		    out.println("location='Profile.jsp';");
		    out.println("</script>");
		 
		}

	}

}
