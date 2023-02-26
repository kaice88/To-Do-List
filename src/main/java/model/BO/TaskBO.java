package model.BO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

import model.DAO.TaskDAO;
import model.BEAN.Task;


public class TaskBO {
	TaskDAO taskDAO = new TaskDAO();
	
	public  ArrayList<Task> getTaskList(Integer UserID) { 
		return taskDAO.getTaskList(UserID);  
	  }
	public  ArrayList<Task> getTaskListToday(Integer UserID,String Topic) { 
		Date today = new Date(System.currentTimeMillis());
		String strToday = null;
		if(today.getDate()<10) {
			 strToday = (today.getYear()+1900)+"-"+(today.getMonth()+1)+"-"+"0"+today.getDate();
		}
		else {
			 strToday = (today.getYear()+1900)+"-"+(today.getMonth()+1)+"-"+today.getDate();
		}
		ArrayList<Task> taskList = taskDAO.getTaskList(UserID);
		ArrayList<Task> taskListToday = new ArrayList<Task>();
		for(int i = 0; i < taskList.size();i++){
			String date =taskList.get(i).getDate();
			String topic =taskList.get(i).getTopic();
			if(Topic == null) {
				if(date.equals(strToday)) {
				    taskListToday.add(taskList.get(i));
				}
			}
			else if(date.equals(strToday) && Topic.equals(topic)) {
			    taskListToday.add(taskList.get(i));
			}
		}
		return taskListToday; 
	  }
	public  ArrayList<Task> getTaskListSchedule(Integer UserID,String Date) { 
		ArrayList<Task> taskList = taskDAO.getTaskList(UserID);
		ArrayList<Task> taskListSchedule = new ArrayList<Task>();
		for(int i = 0; i < taskList.size();i++){

				if(Date.equals(taskList.get(i).getDate())) {
				    taskListSchedule.add(taskList.get(i));
				}		
		}
		return taskListSchedule; 
	  }
	public void deleteTask(String id){
		 taskDAO.deleteTask(id);
	  }
	
	public void addTask(String Title,String Note,String Date,String userID,String Time,String Topic) {
		String day = Date.substring(0, 2);
		String month = Date.substring(3, 5);
		String year = Date.substring(6);
		String newDate = year+"-"+month+"-"+day;
		taskDAO.addTask(Title, Note, newDate, userID, Time,Topic); 
	  }
	public void updateTask(String id,String Title,String Note,String Date,String userID,String Time, String Topic){
		String day = Date.substring(0, 2);
		String month = Date.substring(3, 5);
		String year = Date.substring(6);
		String newDate = year+"-"+month+"-"+day;
		taskDAO.updateTask(id, Title, Note, newDate, userID, Time, Topic);
	  }
	public Task getTaskByID(Integer ID,Integer UserID){
		ArrayList<Task> taskList = taskDAO.getTaskList(UserID);
		for(int i = 0; i < taskList.size();i++){
			String tID =Integer.toString(taskList.get(i).getID());
			
			if(tID.equals(Integer.toString(ID))) {
				return taskList.get(i);
			}
		}
		return null;
	  }
	public  ArrayList<String> getTopicList(Integer UserID) {
		ArrayList<Task> taskList = taskDAO.getTaskList(UserID);
		ArrayList<String> listWithDuplicate = new ArrayList<String>();
		for(int i = 0; i < taskList.size();i++){
			listWithDuplicate.add(taskList.get(i).getTopic());
		}
		Set<String> set = new HashSet<String>(listWithDuplicate);
		ArrayList<String> listWithoutDuplicate = new ArrayList<String>(set);
		return listWithoutDuplicate;
		  
	  }
	public  ArrayList<String> getDateList(Integer UserID) {
		ArrayList<Task> taskList = taskDAO.getTaskList(UserID);
		ArrayList<String> listWithDuplicate = new ArrayList<String>();
		for(int i = 0; i < taskList.size();i++){
			listWithDuplicate.add(taskList.get(i).getDate());
		}
		Set<String> set = new HashSet<String>(listWithDuplicate);
		ArrayList<String> listWithoutDuplicate = new ArrayList<String>(set);
		return listWithoutDuplicate;
		  
	  }
	public void updateTaskStatus(String id, String Status){
		 taskDAO.updateTaskStatus(id, Status);;
	  }
	//
	
}
