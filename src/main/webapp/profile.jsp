<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.tech.blog.entities.User" %>    
<%@ page errorPage="error_page.jsp" %>    
 <%
   User user=(User)session.getAttribute("currentUser");
   if(user==null){
	   response.sendRedirect("login_page.jsp");
   }
 %>   
<!DOCTYPE html>
<html>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link  rel="stylesheet" href="css/style.css"><link>
<!-- font awsome cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<meta charset="ISO-8859-1">
<title>Page</title>
</head>
<body>
    
  <!-- navbar start -->
    <nav class="navbar navbar-expand-lg navbar-dark primary-background">
      <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp"><span class="fas fa-blog"></span>Tech Blog</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#"><i class="fas fa-home"></i>Home</a>
            </li>
           
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fa fa-list-alt"></i>Catagory
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#">Development</a></li>
                <li><a class="dropdown-item" href="#">Data Structure</a></li>
                <li><a class="dropdown-item" href="#">Core</a></li>
              </ul>
            </li>
            
             <li class="nav-item">
              <a class="nav-link" href="#"><i class="fas fa-address-book"></i>Contact</a>
            </li>
            
            
          </ul>
          <ul class="navbar-nav me-right mb-2 mb-lg-0">
          
              <li class="nav-item">
              <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#profile-modal"><i class="fas fa-user-circle"></i><%= user.getName() %></a>
              </li>
              <li class="nav-item">
              <a class="nav-link" href="LogoutServlet"><i class="fas fa-user-plus"></i>Logout</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  <!-- navbar end -->
  
  
  <!-- modal open -->
		<!-- Modal -->
		<div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header primary-background text-white">
		        <h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <div class="container text-center">
		        
		         <img alt="profile" src="profilepic/<%= user.getProfile() %>" style="border-radius:50%; width:125px">
		         <br>
		         <h4><%= user.getName() %></h4>
		         <div id="profile_details">
		         <!-- table -->
		         <table class="table">
				  <tbody>
				    <tr>
				      <th scope="row">Id</th>
				      <td><%= user.getId() %></td>
				    </tr>
				    <tr>
				      <th scope="row">Email</th>
				      <td><%= user.getEmail() %></td>
				    </tr>
				    <tr>
				      <th scope="row">Gender</th>
				      <td><%= user.getGender() %></td>
				    </tr>
				    <tr>
				      <th scope="row">Status</th>
				      <td><%= user.getAbout() %></td>
				    </tr>
				    <tr>
				      <th scope="row">Registration Date</th>
				      <td><%= user.getDateTime().toString() %></td>
				    </tr>
				    
				  </tbody>
				</table>
				</div>
				
				<div id="profile_edit" style="display:none">
				 <h4>Editing..</h4>
				</div>
		         
		        </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button id="edit_details" type="button" class="btn btn-primary">Edit</button>
		      </div>
		    </div>
		  </div>
		</div>
  
  <!-- modal end -->
  
  <!--javascript cdn-->
	 <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<!-- jsfile -->
	<script type="text/javascript" src="js/myjs.js"></script>
	<script>
	  $(document).ready(function(){
		  let flag=false;
		  
		  $('#edit_details').click(function(){
			 if(flag==false){
				 $("#profile_edit").show();
				 $("#profile_details").hide();
				 $("#edit_details").html('Back');
				 flag=true;
			 }else{
				 $("#profile_edit").hide();
				 $("#profile_details").show();
				 $("#edit_details").html('Edit');
				 flag=false; 
			 }
		  }) 
		  
	  });
	</script>
</body>
</html>