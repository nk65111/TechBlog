<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.tech.blog.entities.Message" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link  rel="stylesheet" href="css/style.css"><link>
<!-- font awsome cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <%@include file="normal_navbar.jsp" %>
  
    <main class="d-flex align-items-center primary-background" style="height:92vh">
      <div class="container">
         <div class="row">
            <div class="col-md-4 offset-md-4">
               <div class="card">
                 <div class="card-header primary-background text-white text-center">
                   <span class="fa fa-user-circle fa-3x"></span>
                   <br>
                   <p>Login Here</p>
                 </div>
                 
                 <%
                   Message msg=(Message)session.getAttribute("msg");
                   if(msg!=null){
                 %>
                	<div class="alert <%= msg.getCssSelector() %>" role="alert">
                        <%=msg.getMessage() %>
                   </div>   
                <%
                    session.removeAttribute("msg");
                    }
                 
                 %>
                 <div class="card-body">
                     <form action="LoginServlet" method="POST">
					  <div class="mb-3">
					    <label for="exampleInputEmail1" class="form-label">Email address</label>
					    <input name="useremail" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
					    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
					  </div>
					  <div class="mb-3">
					    <label for="exampleInputPassword1" class="form-label">Password</label>
					    <input name="userpassword" type="password" class="form-control" id="exampleInputPassword1">
					  </div>
					  <div class="container text-center">
					     <button type="submit" class="btn btn-primary">Submit</button>
					  </div>
					  
					</form>
                 </div>
               </div>
            </div>
         </div>
      </div>
    </main>
   
   
    <!--javascript cdn-->
	 <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<!-- jsfile -->
	<script type="text/javascript" src="js/myjs.js"></script>
</body>
</html>