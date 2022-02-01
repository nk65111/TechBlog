<%@ page import="com.tech.blog.dao.CategoryDao" %>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.tech.blog.dao.LikeDao" %>
<%@ page import="com.tech.blog.entities.Posts" %>
<%@ page import="com.tech.blog.entities.User" %> 
<div class="row">
<%
   User user=(User)session.getAttribute("currentUser");
   CategoryDao cdao=new CategoryDao(ConnectionProvider.getConnection());
   int catid=Integer.parseInt(request.getParameter("cid"));
   ArrayList<Posts> res=null;
   if(catid==0){
	   res=cdao.getAllPosts();
   }
   else{
	   res=cdao.getCategoryByCatId(catid);
	 
   }
   if(res.size()==0){
	   out.print("<h3 class='display-3 text-center'>No Post in this Category</h3>");
	   return;
   }
   for(Posts p:res){

%>
  <div class="col-md-6">
	  <div class="card m-3">
	   
	  <img src="postpic/<%=p.getPpic() %>"  class="card-img-top" alt="...">
	  <div class="card-body">
	   <b><%= p.getPtitle() %></b>
	  </div>
	  <div class="card-footer primary-background text-center">
        <%
            LikeDao ldao=new LikeDao(ConnectionProvider.getConnection());
         %>
		<a href="#!" onClick="likePost(<%= p.getPid() %>,<%= user.getId() %>)" class="btn btn-outline-light btn-sm"><i class="fas fa-thumbs-up"></i><span id="like-count-<%= p.getPid() %>"><%= ldao.countLikePost(p.getPid()) %></span></a>
	     <a href="read-more-post.jsp?post_id=<%=p.getPid() %>" class="btn btn-outline-light btn-sm">Read More</a>
	      <a href="#!" class="btn btn-outline-light btn-sm"><i class="fas fa-comment"></i><span>20</span></a>
	  </div>
	  
	  </div>
  </div>
<% 
   }
%>
</div>