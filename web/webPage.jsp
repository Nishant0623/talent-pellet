<%-- 
    Document   : webPage
    Created on : 13-Oct-2023, 2:18:14 pm
    Author     : HUDA
--%>

<%@page import="myClasses.User"%>
<%@page import="myClasses.Huda"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="webPage.css"><!-- comment -->
        <link rel="stylesheet" type="text/css" href="bootstrap.css"><!-- comment -->
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
              <script src="bootstrap.min.js"></script>
    </head>
    <%!String email;%>
    <%
        email=request.getParameter("email");
    %>
    <%!String n;%>
<%
                Connection con=null;
                Statement smt=null;
                ResultSet rs=null;
                try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                
          
            }
            
            try {
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project?zeroDateTimeBehavior=CONVERT_TO_NULL","root","root");
               
            } catch (SQLException ex) {
                 out.println(ex);
               
            }
                try {
                  smt=con.createStatement();
               
            } catch (SQLException ex) {
                 out.println(ex);
          
            }
            
          
            String query="select name from login where email='"+email+"'";
              
         
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
                while(rs.next())
                {
n=rs.getString("name");
    }  
            %>
        
         <div class="container-fluid bg">
                    <nav class="navbar navbar-expand-lg navbar dark justify-content-end">
                      <div class="container-fluid">
                        
                        <a class="navbar-brand" href="#" style="color: aliceblue;">
                          <img src="pictures/documnet.png" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
                        
                    TallentPallets</a>
                        
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                          <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                          <ul class="navbar-nav me-auto mb-2 mb-lg-0 nav justify-content-end">
                            <li class="nav-item">
                              <a class="nav-link" aria-current="page" href="#" style="color: aliceblue;">Home</a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" href="ex.jsp" style="color: aliceblue;">References</a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" aria-current="page" href="form1.jsp?email=<%=email%>" style="color: aliceblue;">
                              Information
                              </a>

                            </li>
                             <li class="nav-item">
                              <a class="nav-link" aria-current="page" href="template.jsp?email=<%=email%>" style="color: aliceblue;">
                              Templates
                              </a>

                            </li>
                            <li class="nav-item">
                              <a class="nav-link" style="color: aliceblue;" href="portfolio.jsp?email=<%=email%>">Portfolio</a>
                            </li>
                          </ul>
                          <span class="navbar-text" style="color:aliceblue" >
                            
                              
                              Hello <%=n%>
                                  
                          </span>
                          
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
                   
                    <div class="container">
                      <div class="m1">
                      <h1 id="h1">
                        Professional resumes approved by <br>recruiters and loved by job <br>seekers
                      </h1>
                      <p id="p2">
                        Land your next interview with a high-quality resume that’s perfectly <br>formatted and easy to customize. With Resume Now’s builder, you can <br>make a beautifully-designed, expert-backed document in minutes!
                      </p>
                    </div>
                   </div>
                   <div class="container">
                   <div class="services">
                    <h1 id="h1">
                      Take your resume <br>to next level
                                          </h1>
                                          <div class="row row-cols-1 row-cols-md-3 g-4" id="r2">
                                            <div class="col">
                                              <div class="card h-100 border-light">
                                                <img src="pictures/infographic-resume-template-header.png" height="250px" class="card-img-top" alt="...">
                                                <div class="card-body">
                                                  <h5 class="card-title">Choose from vivid range of template</h5>
                                                  <p class="card-text">Allows user to choose from a vivid range of ATS friendly resume templates to create impactful resumes that gets you hired</p>
                                                </div>
                                              </div>
                                            </div>
                                        
                                            <div class="col">
                                              <div class="card h-100 border-light">
                                                <img src="pictures/images.jpg" height="250px" class="card-img-top" alt="...">
                                                <div class="card-body">
                                                  <h5 class="card-title">Create resume based on job description</h5>
                                                  <p class="card-text">Create resume from existing user data based on the given job description and add the skills relevant to job profile</p>
                                                </div>
                                              </div>
                                            </div>
                                            <div class="col">
                                              <div class="card h-100 border-light">
                                                <img src="pictures/hired.jpg" height="250px" class="card-img-top" alt="...">
                                                <div class="card-body">
                                                  <h5 class="card-title">References</h5>
                                                  <p class="card-text">Provide a vivid range of resumes selected by different companies for user's reference</p>
                                                </div>
                                              </div>
                                            </div>
                                            
                                            <div class="col">
                                              <div class="card h-100 border-light">
                                                <img src="pictures/resumeTricks.jpg" height="250px" class="card-img-top" alt="...">
                                                <div class="card-body">
                                                  <h5 class="card-title">Provide tip and format for building correct resume</h5>
                                                  <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                                </div>
                                                
                                              </div>
                                            </div>
                                            <div class="col">
                                              <div class="card h-100 border-light">
                                                <img src="pictures/generatesSummary.jpg" height="250px" class="card-img-top" alt="...">
                                                <div class="card-body">
                                                  <h5 class="card-title">Generates Summary</h5>
                                                  <p class="card-text">Generates well versed profile and project summary based on given description</p>
                                                </div>
                                              </div>
                                            </div>
                                            <div class="col">
                                              <div class="card h-100 border-light">
                                                <img src="pictures/resume-strength.png" height="250px" class="card-img-top" alt="...">
                                                <div class="card-body">
                                                  <h5 class="card-title">Resume review</h5>
                                                  <p class="card-text">Review your resume to help acheive carrer goals and provide comprehensive feedback on overall format layout.Analyze the content of each section and offers valuable suggestions</p>
                                                </div>
                                              </div>
                                            </div>
                                          </div>
                                        
                                        </div>
                                        <div class="s1">
                                          <div class="container s2">
<h1 id="h2">20 Resumes have been <br>created on Tallent Palllets Uptill nOw!!</h1>
                                          </div>
                                        </div>
                                        <div class="s3">
                                          <div class="container">
                                            <h1 id="h1">
                                              Create a custom resume now in 4 simple<br>steps
                                            </h1>
                                            <div class="card border-light">
                                              <div class="row">
                                                <div class="col-md-4">
                                                  <img src="pictures/gettyimages-1300177621-612x612.jpg" class="img-fluid rounded-start" alt="...">
                                                </div>
                                                <div class="col-md-8">
                                                  <div class="card-body">
                                                    <h5 class="card-title">Fill in the information</h5>
                                                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                                    
                                                  </div>
                                                  <div class="card-body">
                                                    <h5 class="card-title">Choose the templates</h5>
                                                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                                    
                                                  </div>
                                                  <div class="card-body">
                                                    <h5 class="card-title">Choose how to create Resume</h5>
                                                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                                    
                                                  </div>
                                                  <div class="card-body">
                                                    <h5 class="card-title">Get Review</h5>
                                                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                                    
                                                  </div>
                                                </div>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                       <div class="container-fluid">
                                        <div class="review">
<h1 id="h1">Real Stories from our<br>most valued user</h1>
<div class="testimonials">
  <div id="carouselExampleIndicators" class="carousel slide">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <div class="card mb-3" style="max-width: 600px;" id="c1">
          <div class="row g-0">
            <div class="col-md-4">
              <img src="pictures/nishantSharma.jpg" class="img-fluid" id="i1">
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h5 class="card-title">Nishant Sharma</h5>
                <p class="card-text">A great website that generates resume and portfolio with just one click.</p>
                <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
              </div>
            </div>
          </div>
        </div>
      </div>
          <div class="carousel-item">
        <div class="card mb-3" style="max-width: 600px;" id="c1">
          <div class="row g-0">
            <div class="col-md-4">
              <img src="pictures/HudaShaikh.png" class="img-fluid rounded-start" id="i1">
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h5 class="card-title">Huda Shaikh</h5>
                <p class="card-text">Makes wonderful use of prompt engineering and generates resume & portfolio in single click.</p>
                <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <div class="card mb-3" style="max-width: 600px;" id="c1">
          <div class="row g-0">
            <div class="col-md-4">
              <img src="pictures/kartikpatidar.jpg" class="img-fluid rounded-start" id="i1">
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h5 class="card-title">Kartik Patidar</h5>
                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
              </div>
            </div>
          </div>
        </div>
      </div>
         <div class="carousel-item">
        <div class="card mb-3" style="max-width: 600px;" id="c1">
          <div class="row g-0">
            <div class="col-md-4">
              <img src="pictures/dheerajPatidar.jpg" class="img-fluid rounded-start" id="i1">
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h5 class="card-title">Dheeraj Patidar</h5>
                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
              </div>
            </div>
          </div>
        </div>
      </div>
  
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
</div>
                                        </div>
                                        
                                       </div>
                                       <div class="container-fluid" id="quote">
                                        <div class="card">
                                          <div class="card-header">
                                            Quote
                                          </div>
                                          <div class="card-body">
                                            <blockquote class="blockquote mb-0">
                                              <p>Your resume is the chief envagelist of your carrer.</p>
                                              <footer class="blockquote-footer"> <cite title="Source Title">Jessics Hernades</cite></footer>
                                            </blockquote>
                                          </div>
                                        </div>
                                       </div>
                                          
    

