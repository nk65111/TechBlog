package com.tech.blog.dao;
import java.sql.*;
import java.util.*;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Posts;
public class CategoryDao {
   Connection con;
   public CategoryDao(Connection con) {
	   this.con=con;
   }
   
   public ArrayList<Category> getCategories(){
	   ArrayList<Category> al= null;
	   try {
		  String query="select * from categories";
		   Statement st=con.createStatement();
		    ResultSet set=st.executeQuery(query);
		    al=new ArrayList<>();
		  while(set.next()) {
			  int cid=set.getInt("cid");
			  String name=set.getString("name");
			  String desc=set.getString("description");
			  Category c=new Category(cid,name,desc);
			  al.add(c);
		  }
		  
	   }
	   catch(Exception e) {
		   
	   }
	   return al;
   }
   
   public boolean savePost(Posts post) {
	   boolean flag=false;
	   try {
		   String query ="insert into posts (ptitle,pcontent,pcode,ppic,catid,userid) value (?,?,?,?,?,?)";
		   PreparedStatement psmt=con.prepareStatement(query);
		   psmt.setString(1, post.getPtitle());
		   psmt.setString(2, post.getPcontent());
		   psmt.setString(3, post.getPcode());
		   psmt.setString(4, post.getPpic());
		   psmt.setInt(5, post.getCatid());
		   psmt.setInt(6,post.getUserid());
		   psmt.executeUpdate();
		   flag=true;
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   return flag;
   }
}
