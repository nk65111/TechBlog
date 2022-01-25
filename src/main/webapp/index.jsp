<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title >Tech Blog</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link  rel="stylesheet" href="css/style.css"><link>
<!-- font awsome cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
     <!--navbar-->
     <%@include file="normal_navbar.jsp" %>
     
     <!-- banner -->
      <div class="container-fluid m-0 p-0 text-light ">
       <div class="jumbo primary-background banner-background">
          <div class="container">
           <h3 class="display-3">Welcome in Tech Blog</h3>
           <p>Tech blog,world of technolgy</p>
           <p> It is better to wait for a productive programmer to become available than it is to wait for the first available programmer to become productive </p>
           <button class="btn btn-outline-light btn-lg"><i class="fas fa-sign-in-alt"></i> Start! Its Free</button>
           <a class="btn btn-outline-light btn-lg" href="login_page.jsp"><i class="fas fa-user-circle fa-spin"></i> Login</a>
           </div>
       </div>
      </div>
     
     <!-- cards -->
     <div class="container">
       <div class="row m-2">
          <div class="col-md-4 mb-1">
            <div class="card">
               <div class="card-body">
                <h5 class="card-title">Java Programming</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Read More</a>
               </div>
            </div>
          </div>
          
          <div class="col-md-4 mb-1">
            <div class="card">
               <div class="card-body">
                <h5 class="card-title">Java Programming</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Read More</a>
               </div>
            </div>
          </div>
          
          <div class="col-md-4 mb-1">
            <div class="card">
               <div class="card-body">
                <h5 class="card-title">Java Programming</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Read More</a>
               </div>
            </div>
          </div>
       </div>
       
        <div class="row m-2">
          <div class="col-md-4 mb-1">
            <div class="card">
               <div class="card-body">
                <h5 class="card-title">Java Programming</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Read More</a>
               </div>
            </div>
          </div>
          
          <div class="col-md-4 mb-1">
            <div class="card">
               <div class="card-body">
                <h5 class="card-title">Java Programming</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Read More</a>
               </div>
            </div>
          </div>
          
          <div class="col-md-4 mb-1">
            <div class="card">
               <div class="card-body">
                <h5 class="card-title">Java Programming</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Read More</a>
               </div>
            </div>
          </div>
       </div>
       
     </div>
     <%!
       Connection con=ConnectionProvider.getConnection();
     %>
     <!--javascript cdn-->
	 <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<!-- jsfile -->
	<script type="text/javascript" src="js/myjs.js"></script>
</body>
</html>