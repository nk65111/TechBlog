package com.tech.blog.servelts;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.LikeDao;
import com.tech.blog.helper.ConnectionProvider;


@WebServlet("/LikeServelt")
public class LikeServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LikeServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operation=request.getParameter("operation");
		int pid=Integer.parseInt(request.getParameter("pid"));
		int uid=Integer.parseInt(request.getParameter("uid"));
		LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
		PrintWriter out=response.getWriter();
		if(operation.equals("like")) {
			boolean bool=ld.insertLike(uid, pid);
			out.println(bool);
		}
	}

}
