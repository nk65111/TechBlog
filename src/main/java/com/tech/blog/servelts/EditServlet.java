package com.tech.blog.servelts;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.ProfileEdit;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;


@WebServlet("/EditServlet")

@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("user-email");
		String password=request.getParameter("user-password");
		String name=request.getParameter("user-name");
		String about=request.getParameter("user-about");
		Part part=request.getPart("user-profile-photo");
		String fname=part.getSubmittedFileName();
		HttpSession s=request.getSession();
		User user=(User)s.getAttribute("currentUser");
		user.setEmail(email);
		user.setPassword(password);
		user.setName(name);
		user.setAbout(about);
		String oldname=user.getProfile();
		user.setProfile(fname);
		
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		PrintWriter out=response.getWriter();
		boolean bool=dao.updateUser(user);
		if(bool) {
			out.print("done bhai..");
			String path=request.getRealPath("/")+"profilepic"+File.separator+user.getProfile();
			String oldpath=request.getRealPath("/")+"profilepic"+File.separator+oldname;
			if(!oldname.equals("default.png")){
		       ProfileEdit.deletePhoto(oldpath);
			}
			if(ProfileEdit.savePhoto(part.getInputStream(), path)) {
				Message msg=new Message("Profile details updated","success","alert-success");
				HttpSession se=request.getSession();
				se.setAttribute("msg", msg);
				
			}else {
				
			}
		}else {
			Message msg=new Message("Someting went wrong.. profile update again","error","alert-danger");
			HttpSession se=request.getSession();
			se.setAttribute("msg", msg);
			
		}
		response.sendRedirect("profile.jsp");
		
	}

}
