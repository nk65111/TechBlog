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
}
