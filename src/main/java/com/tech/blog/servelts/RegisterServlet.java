package com.tech.blog.servelts;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@WebServlet("/RegisterServlet")

@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("username");
		String email=request.getParameter("useremail");
		String gender=request.getParameter("usergender");
		String password=request.getParameter("userpassword");
		String about=request.getParameter("userabout");
		String check=request.getParameter("check");
		PrintWriter out=response.getWriter();
		if(check!=null){
			UserDao ud=new UserDao(ConnectionProvider.getConnection());
		    User user=new User(name,email,password,gender,about);
		    boolean bool=ud.saveData(user);
		    if(bool) {
		    	out.println("done");
		    }else {
		    	out.println("error");
		    }
		     
		}else{
			out.println("Please agree term and condition");
		}
	    
		
	}

}
