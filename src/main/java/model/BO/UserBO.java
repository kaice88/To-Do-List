package model.BO;


import model.DAO.UserDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.BEAN.User;

public class UserBO {
	UserDAO userDAO = new UserDAO();
	public boolean isValidUser(String username, String password)
	{
		return userDAO.isExistUser(username, password);
		
	}

	public User getUserInfo(String username, String password){
		return userDAO.getUserInfo(username, password);
	  }
	
	public boolean updateUser(String id,String name, String email){
		return userDAO.updateUser(id,name, email);
	  }
	public boolean addUser(String id,String Name,String Email,String Password,String Username){
		return userDAO.addUser(id, Name,Email, Password, Username);
	  }
	public boolean checkPass(String id,String password,String newPass,String confirmPass){
		 if(userDAO.checkPass(id, password)) {
			 if(newPass.equals(confirmPass)) {
				 return true;
			 }
		 }
		 return false;
	  }

	public void changePass(String userID, String newPass) {
		// TODO Auto-generated method stub
		userDAO.changePass(userID,newPass);
	}
}
