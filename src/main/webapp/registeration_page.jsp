<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link  rel="stylesheet" href="css/style.css"><link>
<!-- font awsome cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
  <!-- navbar -->
   <%@include file="normal_navbar.jsp" %>
  
  <main class="primary-background">
    <div class="container">
      <div class="row">
        <div class="col-md-4 offset-md-4">
           <div class="card">
              <div class="card-header text-center primary-background text-white">
                <span class="fa fa-user-plus fa-3x"></span>
                <br>
                <p>Register Here</p>
              </div>
              <div class="card-body">
                <form  id="reg_form" action="RegisterServlet" method="POST">
                
                  <div class="mb-1">
				    <label for="username" class="form-label">User name</label>
				    <input name="username" type="username" class="form-control" id="username">
				  </div>
                
				  <div class="mb-1">
				    <label for="exampleInputEmail1" class="form-label">Email address</label>
				    <input  name="useremail" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
				    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
				  </div>
				  
				  <div class="mb-1">
				    <label for="gender" class="form-label">Gender</label>
				    <input type="radio" value="male" name="usergender"> Male
				    <input type="radio" value="female" name="usergender"> Female
				  </div>
				  
				  <div class="mb-1">
				    <textarea name="userabout" class="form-control" rows="5" placeholder="Eneter someting about yourself"></textarea>
				  </div>
				  
				  <div class="mb-1">
				    <label for="exampleInputPassword1" class="form-label">Password</label>
				    <input name="userpassword" type="password" class="form-control" id="exampleInputPassword1">
				  </div>
				  
				  <div class="mb-3 form-check">
				    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
				    <label class="form-check-label" for="exampleCheck1">Agree term and condition</label>
				  </div>
				  
				  <div class="container text-center" id="loder" style="display:none">
				    <i class="fa-solid fa-arrows-rotate fa-spin fa-4x"></i>
				    <h4>Please wait..</h4>
				  </div>
				  
				  <button  id="submit" type="submit" class="btn btn-primary">Submit</button>
				</form>
              </div>
           </div>
        </div>
      </div>
    </div>
  </main>
  
  <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<!-- jsfile -->
	<script type="text/javascript" src="js/myjs.js"></script>
	<!-- Sweet alert cdn -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
	<script>
	   $(document).ready(function(){
		   console.log("loding....");
		   $("#reg_form").on('submit',function(event){
			   event.preventDefault();
			   let form =new FormData(this);
			   
			   //send data to servelt
			   $("#loder").show();
			   $("#submit").hide();
			   $.ajax({
				   url:"RegisterServlet",
				   type:"POST",
				   data:form,
				   success:function(data){
					   console.log(data);
					   $("#loder").hide();
					   $("#submit").show();
					   if(data.trim()==="done"){
						   swal("Register successfully.. We are going redirecting you login page")
						   .then((value) => {
						      window.location="login_page.jsp"
						   });
					   }else{
						   swal(data);
					   }
					   

				   },
				   error:function(data){
					   console.log("error occur...");
					   $("#loder").hide();
					   $("#submit").show();
					   swal("Someting went wrong.. try again");
					   

				   },
				   processData:false,
				   contentType:false
			   })
			   
		   })
	   })
	</script>
</body>
</html>