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
   
   public ArrayList<Posts> getAllPosts(){
		  ArrayList<Posts> res=new ArrayList<>();
		  try {
			  String query="Select * from posts order by pid desc";
			  PreparedStatement psmt=con.prepareStatement(query);
			  ResultSet set=psmt.executeQuery();
			
			  while(set.next()) {
				  int pid=set.getInt("pid");
				  String ptitle=set.getString("ptitle");
				  String pcontent=set.getString("pcontent");
				  String pcode = set.getString("pcode");
				  String ppic=set.getString("ppic");
				  Timestamp pdate=set.getTimestamp("pdate");
				  int catid=set.getInt("catid");
				  int userid=set.getInt("userid");
				  Posts post=new Posts(pid,ptitle,pcontent,pcode,ppic,pdate,catid,userid);
				  res.add(post);
			  }
			   
		  }catch(Exception e) {
			  e.printStackTrace();
		   }
		  return res;
	  }
   
   
     public  ArrayList<Posts> getCategoryByCatId(int catId){
    	 ArrayList<Posts> res=new ArrayList<>();
    	 try {
    		 String query="select * from posts where catid=?";
    		 PreparedStatement psmt=con.prepareStatement(query);
    		 psmt.setInt(1, catId);
			  ResultSet set=psmt.executeQuery();
			  while(set.next()) {
				  int pid=set.getInt("pid");
				  String ptitle=set.getString("ptitle");
				  String pcontent=set.getString("pcontent");
				  String pcode = set.getString("pcode");
				  String ppic=set.getString("ppic");
				  Timestamp pdate=set.getTimestamp("pdate");
				  int userid=set.getInt("userid");
				  Posts post=new Posts(pid,ptitle,pcontent,pcode,ppic,pdate,catId,userid);
				  res.add(post);
			  }
    		 
    	 }catch(Exception e) {
    		 e.printStackTrace();
    	 }
    	 return res;
     }
}
