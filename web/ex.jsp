<%-- 
    Document   : ex
    Created on : 05-Dec-2023, 10:26:05 pm
    Author     : HUDA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <link rel="stylesheet" type="text/css" href="ex.css"><!-- comment -->
        <link rel="stylesheet" type="text/css" href="bootstrap.css"><!-- comment -->
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
              <script src="bootstrap.min.js"></script>
    </head>
    <body>
        <%!String email;%>
        <%
            email=request.getParameter("email");
        %>
          <div class="container-fluid bg">
        <nav class="navbar navbar-expand-lg navbar dark justify-content-end">
          <div class="container-fluid">
            
            <a class="navbar-brand" href="#" style="color: aliceblue;">
              <img src="favicon.jpg" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
            
        TallentPallets</a>
            
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav me-auto mb-2 mb-lg-0 nav justify-content-end">
                <li class="nav-item">
                  <a class="nav-link" aria-current="page" href="webPage.jsp?email=<%=email%>" style="color: aliceblue;">Home</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="ex.jsp?email=<%=email%>" style="color: aliceblue;">References</a>
                </li>
                  <li class="nav-item">
                  <a class="nav-link" href="form1.jsp.jsp?email=<%=email%>" style="color: aliceblue;">Information</a>
                </li>
                  <li class="nav-item">
                  <a class="nav-link" href="template.jsp?email=<%=email%>" style="color: aliceblue;">Templates</a>
                </li>
                  <li class="nav-item">
                  <a class="nav-link" href="portfolio.jsp?email=<%=email%>" style="color: aliceblue;">Portfolio</a>
                </li>


              </ul>
              
            </div>
          </div>
        </nav>
        <div class="card bg-transparent">
          <div class="row">
            <div class="col-md-4">
             <img src="pictures/resume.jpg" height="400px" id="i1"> 
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h1 class="card-title" style="color:aliceblue" id="h1">Get Resume Help from the <br>Experts at Resume Now</h5>
                <p class="card-text" style="color:aliceblue" id="p1">Resume Now’s free-to-use builder makes creating a professional <br>resume easy. Our resume help includes recruiter-approved <br>examples and templates tailored to the job you want and expert <br>writing tips to customize your resume quickly.<p>
                
              </div>
            </div>
          </div>
        </div>
       </div>
  
        <div class="container-fluid carou">
<h1 id="h1">Resume Reference</h1>
<div class="container">
  <div id="carouselExample" class="carousel slide">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="pictures/resume1.png" class="d-block w-100" alt="slide 1" height="850px;" >
      </div>
      <div class="carousel-item">
          <img src="pictures/r1.jpg" class="d-block w-100" alt="slide 2" height="850px;"> 
      </div>
      <div class="carousel-item">
        <img src="pictures/r2.jpg" class="d-block w-100" alt="slide 3" height="850px;">
      </div>
          <div class="carousel-item">
        <img src="pictures/r3.jpg" class="d-block w-100" alt="slide 3" height="850px;">
      </div>
          <div class="carousel-item">
        <img src="pictures/resume.jpg" class="d-block w-100" alt="slide 3" height="850px;">
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
</div>
        </div>

    </body>
</html>
