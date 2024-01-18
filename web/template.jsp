<%-- 
    Document   : template
    Created on : 30-Oct-2023, 6:31:21 pm
    Author     : HUDA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <link rel="stylesheet" type="text/css" href="template.css"><!-- comment -->
        <link rel="stylesheet" type="text/css" href="bootstrap.css">
                <%!String email;%>
        <%
            email=request.getParameter("email");
        %>
        <script>
         function btnClick(p)
      {
    
        let x=document.getElementById("b2");
        x.style.visibility = 'visible';
        x.style.top="700px"
        document.getElementById("img1").src=p;
        
      }
      function btnClick1(p)
      {
        let x=document.getElementById("b2");
        x.style.visibility = 'visible';
        document.getElementById("img1").src=p;
        x.style.top="940px"

      }
      function onRelease()
      {
        document.getElementById("b2").style.visibility='hidden'
      }
      function reDirect()
      {
          let r=document.getElementById("img1").src;
       
        if(r.search("resume1.png")!==-1)
        {
             window.location.href ="cv1.jsp?email=<%=email%>";

        }
                if(r.search("resume2.webp")!==-1)
        {
             window.location.href ="cv2.jsp?email=<%=email%>";

        }
                if(r.search("resume.jpg")!==-1)
        {
             window.location.href ="cv3.jsp?email=<%=email%>";

        }
                if(r.search("resume4.png")!==-1)
        {
             window.location.href ="cv4.jsp?email=<%=email%>";

        }

      

      }
    </script>
    </head>
    <body>

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
                  <a class="nav-link" aria-current="page" href="webPage.jsp?email=<%=email%>" style="color: aliceblue;">Home</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#" style="color: aliceblue;">References</a>
                </li>
               
                <li class="nav-item">
                  <a class="nav-link" href="form1.jsp?email=<%=email%>" style="color: aliceblue;">Information</a>
                </li>
                 <li class="nav-item">
                  <a class="nav-link" href="template.jsp?email=<%=email%>" style="color: aliceblue;">Template</a>
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
<h1 id="h1">Choose an ATS-friendly resume template</h1>
<div class="container">
  <div class="row" id="r1">
    <div class="col-4" id="c2">
      <img src="pictures/resume1.png" height="450px;">
      <div class="content">
        <input type="submit" value="Use the template" id="s1" onclick="btnClick('pictures/resume1.png')">
      </div>
    </div>
    <div class="col-4" id="c2">
      <img src="pictures/resume2.webp" height="450px;">
      <div class="content">
        <input type="submit" value="Use the template" id="s1" onclick="btnClick('pictures/resume2.webp')">
      </div>
    </div>
  
    
  </div>
  <div class="row" id="r2">
    <div class="col-4" id="c2">
      <img src="pictures/resume.jpg" height="450px;" width="78%">
      <div class="content">
        <input type="submit" value="Use the template" id="s1" onclick="btnClick1('pictures/resume.jpg')" >
      </div>
    </div>
    <div class="col-4" id="c2">
      <img src="pictures/resume4.png" height="450px;" width="78%">
      <div class="content">
        <input type="submit" value="Use the template" id="s1" onclick="btnClick1('pictures/resume4.png')" >
      </div>
      
      </div>
     
  </div>
 </div>
        </div>
        <div id="b2">
<img src="pictures/resume.jpg" id="img1">
<input type="submit" value="UseTemplate" id="btn2" onClick="reDirect()">
<input type="submit" value="Not Now" id="btn2" onclick="onRelease()">
        </div>
    </body>
</html>
