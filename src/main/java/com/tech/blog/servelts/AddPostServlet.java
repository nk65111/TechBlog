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

import com.tech.blog.dao.CategoryDao;
import com.tech.blog.dao.ProfileEdit;
import com.tech.blog.entities.Posts;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;


@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String ptitle=request.getParameter("post-title");
		String pcontent=request.getParameter("post-content");
		String pcode=request.getParameter("post-code");
		Part p=request.getPart("post-pic");
		HttpSession s=request.getSession();
		User u=(User)s.getAttribute("currentUser");
		int catid=Integer.parseInt(request.getParameter("cid"));
		CategoryDao cd=new CategoryDao(ConnectionProvider.getConnection());
//		out.println(ptitle+" "+pcontent+" "+pcode+" "+p.getSubmittedFileName()+" "+catid+" "+u.getId());
		Posts post=new Posts(ptitle,pcontent,pcode,p.getSubmittedFileName(),catid,u.getId());
		boolean check1=cd.savePost(post);
		String path=request.getRealPath("/")+"postpic"+File.separator+p.getSubmittedFileName();
		boolean check2=ProfileEdit.savePhoto(p.getInputStream(), path);
		if(check1&&check2) {
			out.print("done");
		}else {
			out.print("error");
		}
	
	}

}
