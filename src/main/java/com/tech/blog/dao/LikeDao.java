package com.tech.blog.dao;

import java.sql.*;


public class LikeDao {
  Connection con;
  public LikeDao(Connection con) {
	  this.con=con;
  }
   public boolean insertLike(int uid,int pid) {
	   boolean flag=false;
	   try {
		   String query="insert into likepost (pid,userid) value(?,?)";
		   PreparedStatement  psmt=con.prepareStatement(query);
		   psmt.setInt(1, pid);
		   psmt.setInt(2,uid);
		   psmt.executeUpdate();
		   flag=true;
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   return flag;
   }
   
   public int countLikePost(int pid) {
	   int count=0;
	   try {
		   String query="Select count(*) from likepost where pid=?";
		   PreparedStatement  psmt=con.prepareStatement(query);
		   psmt.setInt(1, pid);
		   ResultSet set=psmt.executeQuery();
		   if(set.next()) {
			   count=set.getInt("count(*)");
		   }
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   return count;
   }
   
   public boolean isLikedByUser(int pid,int uid) {
	   boolean flag=false;
	   try {
		   String query="Select * from likepost where pid=? and userid=?";
		   PreparedStatement  psmt=con.prepareStatement(query);
		   psmt.setInt(1, pid);
		   psmt.setInt(2,uid);
		   ResultSet set=psmt.executeQuery();
		   if(set.next()) {
			   flag=true;
		   }
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   return flag;
   }
   
   public boolean deleteLike(int pid,int uid) {
	   boolean flag=false;
	   try {
		   String query="delete from likepost where pid=? and userid=?";
		   PreparedStatement  psmt=con.prepareStatement(query);
		   psmt.setInt(1, pid);
		   psmt.setInt(2,uid);
		   psmt.executeUpdate();
		   flag=true;
		   
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   return flag;
   }
}
