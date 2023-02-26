package model.DAO;
import java.sql.*;


import model.BEAN.User;
public class UserDAO {
	public boolean isExistUser(String username, String password){
		  try {
				//Ket noi su dung jdbc:odbc
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/todo","root","");
				Statement stmt = con.createStatement(); 
				String sql="SELECT password,username FROM user where password ='"+password+"' and username ='"+username+"'";
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()) {
					return true;
				}
			}catch(Exception e) {return false;}
		return false;
	  }

	public User getUserInfo(String username, String password){
		  User user = new User();
		  try {
				//Ket noi su dung jdbc:odbc
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/todo","root","");
				Statement stmt = con.createStatement(); 
				String sql="SELECT * FROM user where password ='"+password+"' and username ='"+username+"'";
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()) {
					user.setID(rs.getInt("ID"));
					user.setName(rs.getString("Name"));
					user.setEmail(rs.getString("Email"));
					user.setPassword(rs.getString("Password"));
					user.setUsername(rs.getString("Username"));
				}
			}catch(Exception e) {}
		return user;
	  }
	public boolean addUser(String id,String Name,String Email,String Password,String Username){
		  try {
				//Ket noi su dung jdbc:odbc
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/todo","root","");
				String sql="INSERT INTO user(ID, name, password, username,email) VALUES (?,?,?,?,?)";
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setString(1, id);
				stmt.setString(2, Name);
				stmt.setString(3, Password);
				stmt.setString(4, Username);
				stmt.setString(5, Email);
				stmt.executeUpdate();
			}catch(Exception e) {return false;}
		  return true;
	  }
	public boolean updateUser(String id,String Name,String Email){
		  try {
				//Ket noi su dung jdbc:odbc
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/todo","root","");
				String sql="UPDATE User SET Name = ? ,Email = ?  WHERE ID = ?";
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setString(3, id);
				stmt.setString(1, Name);
				stmt.setString(2, Email);
				stmt.executeUpdate();
			}catch(Exception e) {return false;}
		  return true;
	  }
	public boolean checkPass(String id,String password){
		  try {
				//Ket noi su dung jdbc:odbc
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/todo","root","");
				String sql="SELECT * FROM USER WHERE ID = ? AND PASSWORD = ?";
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setString(1, id);
				stmt.setString(2, password);
				ResultSet rs = stmt.executeQuery();
				while(rs.next()) {
					return true;
				}
			}catch(Exception e) {return false;}
		  return false;
	  }
	public void changePass(String userID, String newPass) {
		// TODO Auto-generated method stub
		 try {
				//Ket noi su dung jdbc:odbc
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/todo","root","");
				String sql="UPDATE user SET password = ? WHERE ID = ?";
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setString(1, newPass);
				stmt.setString(2, userID);
				stmt.executeUpdate();
			}catch(Exception e) {System.out.println(e);}
	}
}