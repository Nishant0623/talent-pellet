<%-- 
    Document   : form1
    Created on : 13-Oct-2023, 5:33:17 pm
    Author     : HUDA
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="myClasses.Huda"%>
<%@page import="myClasses.Information"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Personal Information</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.css"><!--  -->
        <link rel="stylesheet" type="text/css" href="form1.css">
        <script>
            
            function validate()
      {
       validateName();
       validateSurName();
       validatePhone();
       validateEmail();
       validateGit();
       validateLindein();
       validateCity();

      }
      function validateCity()
      {
        let reg=/^[A-Z][A-Za-z]+$/;
     let x=document.getElementById("city").value;
     let y=document.getElementById("p7");
     if(x==="")
        {
          
         
          y.innerHTML="It is a required field";
        }
        else{
          if(!reg.test(x))
          {
       
          y.innerHTML="City consist of alphabets";
          }
          else{

          y.innerHTML="";
          }
      }
    }
    function validateState()
      {
        let reg=/^[A-Z][A-Z a-z]+$/;
     let x=document.getElementById("state").value;
     let y=document.getElementById("p8");
     if(x==="")
        {
          
         
          y.innerHTML="It is a required field";
        }
        else{
          if(!reg.test(x))
          {
       
          y.innerHTML="State consist of alphabets";
          }
          else{

          y.innerHTML="";
          }
      }
    }
      function validateLindein()
      {
        let reg=/^(https:\/\/www.linkedin.com\/in\/|http:\/\/www.linkdein..com\/in\/)?[a-zA-Z0-9.-]+$/;
     let x=document.getElementById("linkdein").value;
     let y=document.getElementById("p5");
     if(x==="")
        {
          
         
          y.innerHTML="It is a required field";
        }
        else{
          if(!reg.test(x))
          {
       
          y.innerHTML="Enter valid Linkdein format";
          }
          else{

          y.innerHTML="";
          }
      } 
      }
      function validateGit()
      {
     let reg=/^(https:\/\/github.com\/|http:\/\/github.com)?[a-zA-Z0-9.-]+$/;
     let x=document.getElementById("git").value;
     let y=document.getElementById("p6");
     if(x==="")
        {
          
         
          y.innerHTML="It is a required field";
        }
        else{
          if(!reg.test(x))
          {
       
          y.innerHTML="Enter valid github format";
          }
          else{

          y.innerHTML="";
          }
      }
     
      }
      function validateEmail()
      {
        let reg=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        let x=document.getElementById("email").value;
        let y=document.getElementById("p4");
        if(x==="")
        {
          
         
          y.innerHTML="It is a required field";
        }
        else{
          if(!reg.test(x))
          {
       
          y.innerHTML="Enter valid email format";
          }
          else{

          y.innerHTML="";
          }
      }

      }
      
      function validatePhone()
      {
        let reg=/^[0-9]{10}/;
        let x=document.getElementById("phoneNo").value;
        let y=document.getElementById("p3");
        if(x==="")
        {
          
         
          y.innerHTML="It is a required field";
        }
        else{
          if(!reg.test(x))
          {
       
          y.innerHTML="It should contain only 10 digits";
          }
          else{

          y.innerHTML="";
          }
        }
      }
      function validateName()
      {
      
        let reg=/^[A-Z][a-z]+$/;
        let x=document.getElementById("name").value;
        let y=document.getElementById("p1");
        if(x==="")
        {
          
         
          y.innerHTML="It is a required field";
        }
        else{
          if(!reg.test(x))
          {
       
          y.innerHTML="It should contain only letters should begin with capital letter follower by smallcase letters";
          }
          else{

          y.innerHTML="";
          }
        }

      }
      function validateSurName()
      {
        let reg=/^[A-Z][a-z]+$/;
        let x=document.getElementById("surname").value;
        let y=document.getElementById("p2");
        if(x==="")
        {
          
         
          y.innerHTML="It is a required field";
        }
        else{
          if(!reg.test(x))
          {
       
          y.innerHTML="It should contain only letters should begin with capital letter follower by smallcase letters";
          }
          else{

          y.innerHTML="";
          }
      }
    }
            </script>
    </head>
    <body>
           <%!String fname;%>
      <%!String lname;%>
        <%!String city;%>
      <%!String state;%>
        <%!String phone;%>
      <%!String mail;%>
        <%!String l;%>
      <%!String g;%>
    
      <%!String m;%>
      <%
m=request.getParameter("email");



      
          
      %>
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
          
            String query="select * from user where email='"+m+"'";
              
            rs=smt.executeQuery(query);
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
                while(rs.next())
                {
        fname=rs.getString("firstname");
        lname=rs.getString("lastname");
        city=rs.getString("city");
        state=rs.getString("state");
        phone=rs.getString("phone");
        mail=rs.getString("mail");
        l=rs.getString("linkedin");
        g=rs.getString("git");
           }  
            %>
         <div class="container-fluid">
        <div class="row">
            <div class="col-2" id="c1" style="color:white;">
               <div class="container">
                <nav class="navbar bg-body-dark">
                    <div class="container-fluid">
                      <a class="navbar-brand" href="#">
                        <img src="pictures/document-management-big.png" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
                        <h4 style="color:white;">TalentPallets</h4>
                      </a>
                    </div>
                  </nav>
                  <nav class="navmenu">
                    <ul>
                      <li><a class="nav-link active" href="#">Header</a></li>
                      <li><a href="#">Experience</a></li>
                      <li><a href="#">Education</a></li>
                      <li><a href="#">Projects</a></li>
                      <li><a href="#">Courses & <br>Certifications</a></li>
                      <li><a href="#">Summary</a></li>
                      <li><a href="#">Finalize</a></li>
                    </ul>

                  </nav>
                  
               </div>
            </div>
            <div class="col-10">
              <div class="container-fluid c2">
                <h1>Let's Start With Your Header Section</h1>
                <p>Include your full name and atleast one way recruiter can reach you</p>
              </div>
                
<div class="container">
    <form action="http://localhost:8088/WebApplication2/SaveInformation" mathod="post">
        
    
  <div class="contact-form row">
    <div class="from-field col-lg-4">
      <label for="name" class="label">Name</label>
   
      <input id="name" class="input-text" type="text" name="firstname" value=<%=fname%>>
      
       
      <div id="p1"></div>
    </div>
    <div class="from-field col-lg-4">
        
      <label for="surname" class="label">Surname</label>
      <input id="surname" class="input-text" type="text" name="lastname" value=<%=lname%> >
      <div id="p2"></div>
    </div>
    <div class="from-field col-lg-4">
      <label for="city" class="label">city</label>
      <input id="city" class="input-text" type="text" name="city" value=<%=city%>>
      <div id="p7"> </div>
    </div>
      <div class="from-field col-lg-4">
        <label for="state" class="label">State</label>
        <input id="state" class="input-text" type="text" name="state" value=<%=state%>>
        <div id="p8"></div>
      </div>
      <div class="from-field col-lg-4">
        <label for="phoneNo" class="label">PhoneNo</label>
        <input id="phoneNo" class="input-text" type="text" name="phone" value=<%=phone%>>
        <div id="p3"></div>
      </div>
      <div class="from-field col-lg-4">
        <label for="email" class="label">email</label>
        <input id="email" class="input-text" type="text" name="mail" value=<%=mail%>>
        <div id="p4"></div>
      </div>
      <div class="from-field col-lg-4">
        <label for="linkdein" class="label">LinkdeIn url</label>
        <input id="linkdein" class="input-text" type="url" name="l" value=<%=l%>>
        <div id="p5"></div>
      </div>
      <div class="from-field col-lg-4">
        <label for="git" class="label">GitHub Profile url</label>
        <input id="git" class="input-text" type="url" name="g" value=<%=g%>>
        <div id="p6"></div>
      </div>
              
       
          <div class="from-field col-lg-4">
        
        <input id="email" class="input-text" type="text" style="visibility:hidden" name="email" value=<%=m%>>
        <div id="p4"></div>
      </div>
      <div class="from-field col-lg-6">
        
        <input class="Submit" type="submit" value="Submit" id="b1" onclick="validate()">
      </div>
      <div class="from-field col-lg-6">
        
        <input class="Submit" type="submit" value="Back" id="b2">
      </div>
    </div>
</form>
  </div>
                
</div>
               
            </div>
        </div>

    </div>
    </body>
</html>
