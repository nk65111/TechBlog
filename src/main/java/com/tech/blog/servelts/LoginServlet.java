package com.tech.blog.servelts;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

import java.io.*;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		out.println("Hello World");
		String email=request.getParameter("useremail");
		String password=request.getParameter("userpassword");
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		User u=dao.getUserByEmailandPassword(email, password);
		if(u==null) {
			Message msg=new Message("Incorrect email or password! try another one","error","alert-danger");
			HttpSession se=request.getSession();
			se.setAttribute("msg", msg);
			response.sendRedirect("login_page.jsp");
		}else {
			HttpSession s=request.getSession();
			s.setAttribute("currentUser", u);
			response.sendRedirect("profile.jsp");
		}
		
		
	}

}
