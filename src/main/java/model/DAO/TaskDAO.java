package model.DAO;
import java.sql.*;

import java.util.ArrayList;
import model.BEAN.Task;

public class TaskDAO {
	
	public ArrayList<Task> getTaskList(Integer User_ID) {
		  ArrayList<Task> list = new ArrayList<Task>();
		  try {
				//Ket noi su dung jdbc:odbc
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/todo","root","");
				Statement stmt = con.createStatement(); 
				String sql="SELECT * FROM task WHERE User_ID = "+ User_ID+" ORDER by date DESC,Time ASC ";
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()) {
					Task task = new Task();
					task.setID(rs.getInt("ID"));
					task.setUser_ID(rs.getInt("User_ID"));
					task.setTitle(rs.getString("Title"));
					task.setNote(rs.getString("Note"));
					task.setDate(rs.getString("Date"));
					task.setStatus(rs.getBoolean("Status"));
					task.setTime(rs.getString("Time"));
					task.setTopic(rs.getString("Topic"));

					list.add(task);
				}
			}catch(Exception e) {}
		
		return list;
		  
	  }
	
	public void deleteTask(String id){
		  try {
				//Ket noi su dung jdbc:odbc
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/todo","root","");
				String sql="delete from task where id = ? ";
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setString(1, id);
				stmt.executeUpdate();
			}catch(Exception e) {
				System.out.println(e);
			}
	  }
	public void addTask(String Title,String Note,String Date,String userID,String Time,String Topic){
		  try {
				//Ket noi su dung jdbc:odbc
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/todo","root","");
				String sql="INSERT INTO task( User_ID, Title, Note, Date,Time,Topic) VALUES (?,?,?,?,?,?)";
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setString(1, userID);
				stmt.setString(2, Title);
				stmt.setString(3, Note);
				stmt.setString(4, Date);
				stmt.setString(5, Time);
				stmt.setString(6, Topic);
				stmt.executeUpdate();
			}catch(Exception e) {System.out.println(e);}
	  }
	public void updateTask(String id,String Title,String Note,String Date,String userID,String Time, String Topic){
		  try {
				//Ket noi su dung jdbc:odbc
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/todo","root","");
				String sql="UPDATE task SET Title = ? ,Note = ? ,Date  = ?,Time  = ?,Topic  = ?  WHERE ID = ? AND User_ID = ?";
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setString(1, Title);
				stmt.setString(2, Note);
				stmt.setString(3, Date);
				stmt.setString(4, Time);
				stmt.setString(5, Topic);
				stmt.setString(6, id);
				stmt.setString(7, userID);
				stmt.executeUpdate();
			}catch(Exception e) {System.out.println(e);}
	  }
	public void updateTaskStatus(String id, String Status){
		  try {
				//Ket noi su dung jdbc:odbc
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/todo","root","");
				String sql="UPDATE task SET Status  = ?  WHERE ID = ?";
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setString(1, Status);
				stmt.setString(2, id);
				stmt.executeUpdate();
			}catch(Exception e) {System.out.println(e);}
	  }
}


