package com.tech.blog.dao;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;

import com.tech.blog.entities.Posts;

public class ProfileEdit {
  public static boolean deletePhoto(String path) {
	  boolean  flag=false;
	  try {
		  File file=new File(path);
		  flag=file.delete();
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	  
	  return flag;
  }
  
  public static boolean savePhoto(InputStream is,String path) {
	  boolean flag=false;
	  try {
		  byte[] b=new byte[is.available()];
		  is.read(b);
		  FileOutputStream fout=new FileOutputStream(path);
		  fout.write(b);
		  fout.flush();
		  fout.close();
		  flag=true;
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	  return flag;
  }
  
 

}
