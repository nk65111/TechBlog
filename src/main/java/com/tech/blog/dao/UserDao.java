package com.tech.blog.dao;
import java.sql.*;

import com.tech.blog.entities.User;
public class UserDao {
   private static Connection con;
   public UserDao(Connection con){
	   this.con=con;
   }
   
   public boolean saveData(User user) {
	   boolean bool=false;
	   try {
		   String query="insert into user (name,email,password,gender,about) values(?,?,?,?,?)";
		   PreparedStatement  psmt=this.con.prepareStatement(query);
		   psmt.setString(1,user.getName());
		   psmt.setString(2, user.getEmail());
		   psmt.setString(3, user.getPassword());
		   psmt.setString(4, user.getGender());
		   psmt.setString(5, user.getAbout());
		   psmt.executeUpdate();
		   bool=true;
	   }
	   catch(Exception e) {
		   
	   }
	   
	   return bool;
   }
   
   public User getUserByEmailandPassword(String email,String password) {
	   User user=null;
	   try {
		   String query="Select * from user where email=? and password=?";
		   PreparedStatement psmt= con.prepareStatement(query);
		   psmt.setString(1, email);
		   psmt.setString(2, password);
		   ResultSet set= psmt.executeQuery();
		   if(set.next()) {
			   user=new User();
			   user.setName(set.getString("name"));
			   user.setPassword(set.getString("password"));
			   user.setEmail(set.getString("email"));
			   user.setGender(set.getString("gender"));
			   user.setAbout(set.getString("about"));
			   user.setId(set.getInt("id"));
			   user.setDateTime(set.getTimestamp("rdate"));
			   user.setProfile(set.getString("profile"));
		   }
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   return user;
   }
   
   public boolean updateUser(User user) {
	   boolean flag=false;
	   try {
	     String query="update user set name=? , email=? , password=? , about=? , profile=? where id=? ";
	     PreparedStatement psmt= con.prepareStatement(query);
	     psmt.setString(1, user.getName());
	     psmt.setString(2, user.getEmail());
	     psmt.setString(3, user.getPassword());
	     psmt.setString(4, user.getAbout());
	     psmt.setString(5, user.getProfile());
	     psmt.setInt(6, user.getId());
	     psmt.executeUpdate();
	     flag=true;
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   return flag;
   }
   public User getUserByid(int userid) {
       User user=null;
       try {
    	   String query="Select * from user where id=?";
    	   PreparedStatement psmt= con.prepareStatement(query);
    	   psmt.setInt(1, userid);
    	   ResultSet set=psmt.executeQuery();
    	   if(set.next()) {
			   user=new User();
			   user.setName(set.getString("name"));
			   user.setPassword(set.getString("password"));
			   user.setEmail(set.getString("email"));
			   user.setGender(set.getString("gender"));
			   user.setAbout(set.getString("about"));
			   user.setId(set.getInt("id"));
			   user.setDateTime(set.getTimestamp("rdate"));
			   user.setProfile(set.getString("profile"));
		   }
    	   
       }catch(Exception e) {
    	   e.printStackTrace();
       }
       return user;
   }
}
