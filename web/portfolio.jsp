<%-- 
    Document   : portfolio.jsp
    Created on : 16-Nov-2023, 11:25:27 pm
    Author     : HUDA
--%>

<%@page import="myClasses.Main"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portfolio</title>
      
    <link rel="stylesheet" href="portfolio.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  
    <script src="https://unpkg.com/typed.js@2.0.16/dist/typed.umd.js"></script>
    <script>
        
        var typed = new Typed(".text",{
    strings:["Frontent Developer","Web Developer"],
    typeSpeed:100,
    backSpeed:100,
    backDelay:1000,
    loop:true
})
        </script>
</head>
<body>
      <%!String email="shaikhhuda2810@gmail.com";%>
        <%!String name;%>
         <%!String sname;%>
          <%!String city1;%>
           <%!String state1;%>
     <%!String phn;%>
        <%!String linked;%>
        <%!String git1;%>
        <%!String summary;%>
        <%!int x;%>
        <%!String t;%>
        <%!String e;%>
        <%!String sd;%>
        <%!String ed;%>
        <%!String pname;%>
                <%!String str;%>
      <%!String de;%>
        <%!String n;%>
        <%!String y;%>
        <%!String cg;%>
        <%!String s="";%>
        <%!String url;%>
        <%!String img;%>
        <%!String desc;%>
        

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
          
            String query="select * from user where email='"+email+"'";
              
      
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
            while(rs.next())
            {
            name=rs.getString("firstname");
            sname=rs.getString("lastname");
            city1=rs.getString("city");
            state1=rs.getString("state");
            linked=rs.getString("linkedin");
            git1=rs.getString("git");
            phn=rs.getString("phone");
            
            }
            
            
        %>
    <header class="header">
        <a href="#" class="logo">Portfolio</a>
        <nav class="navbar">
            <a href="#home" style="--i:1"class="active">Home</a>
            <a href="#about" style="--i:2">About</a>
            <a href="#services" style="--i:3">Skill</a>
            <a href="#project" style="--i:4">Project</a>
            <a href="#contact" style="--i:5">Contact</a>
        </nav>
    </header>
    <section class="home" id="home">
        <div class="home-content">
            <h3>Hello, It's Me</h3>
            <h1><%=name%> <%=sname%></h1>
            <%
                  try {
                  smt=con.createStatement();
               
            } catch (SQLException ex) {
                 out.println(ex);
          
            }
          
            query="select summary,image,job from summary where email='"+email+"'";
              
      
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
            while(rs.next())
            {
            de=rs.getString("summary");
          img=rs.getString("image");
            n=rs.getString("job");
            }
            
            
            %>
            <h3>And I'm a <span class="text"><%=n%></span></h3>
            
            <p>
                <%=de%>
            </p>
            
            <div class="home-sci">
                <a href="<%=git1%>" style="--i:7"><i class='bx bxl-github'></i></a>

                <a href="<%=linked%>" style="--i:9"><i class='bx bxl-whatsapp'></i></a>
                <a href="<%=phn%>" style="--i:10"><i class='bx bxl-linkedin' ></i></a>
            </div>
            <a href="Resume.pdf" class="btn-box">More About Me</a>
        </div>
        <span class="home-imgHover"></span>
    </section>
    <section class="about" id="about">
        <div class="about-img">
            <img src="pictures/<%=img%>">
        </div>
        <div class="about-text">
            <h2>About<span>Me</span></h2>
            <h4><%=n%>!</h4>
            <%
                y=Main.chatGPT("Here is my summary please elaborate it in about 100-120 words "+de);
            %>
            <p><%=y%></p>

                <a href="#" class="btn-box">More About Me</a>
        </div>
    </section>
            <%
                
            %>

    <section>
        <div class="services" id="services">
            <div class="container">
                <h1 class="sub-title">My <span>Skills</span></h1>
                <div class="portfolio-content services-list">
                     <%
                  try {
                  smt=con.createStatement();
               
            } catch (SQLException ex) {
                 out.println(ex);
          
            }
          
            query="select image from skills where email='"+email+"'";
              
      
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
            while(rs.next())
            {
            img=rs.getString("image");
          
            
            
            
            %>
                    <div class="row">
                        <img src="pictures/<%=img%>">
                    
                    </div>
                  <%
                      }
                  %>
                  
                </div>
            </div>
            </div>
        </div>
    </section>
  
<section>
    <div id="portfolio" id="project">
        <div class="main-text" id="project">
            <h2>Latest<span> Project</span></h2>
            <br><br>
            <div class="portfolio-content">
                <%
                              try {
                  smt=con.createStatement();
               
            } catch (SQLException ex) {
                 out.println(ex);
          
            }
          
            query="select * from project where email='"+email+"'";
              
      
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
            while(rs.next())
            {
            pname=rs.getString("name");
            url=rs.getString("purl");
            desc=rs.getString("description");
            img=rs.getString("image");
            
                %>
                <div class="row">
                    <img src="pictures/<%=img%>">
                    <div>
                        <h3 id="heading"><%=pname%></h3>
                   
                    </div>
                    <div class="layer">
                        <p id="para">
                        <%=desc%>
                        </p>
                        <a href="<%=url%>">GitHub</a>                        
                    </div>
                </div>
             
            <%
                }
            %>
              
            </div>
        </div>
    </div>
</section>

<section class="contact" id="contact">
    <div class="contact-text">
        <h2>Contact <span>Me</span></h2>
        <h4>Let's work Together</h4>
        <p>Excited to work with you.Write me an email</p>
        <div class="contact-list">
            <li><i class='bx bxs-send'></i><%=email%></li>
            <li><i class='bx bxs-phone'></i><%=phn%></li>
        </div>
        <div class="contact-icons">
            <a href="git1" style="--i:7"><i class='bx bxl-github'></i></a>
              
                <a href="<%=linked%>" style="--i:9"><i class='bx bxl-whatsapp'></i></a>
                <a href="<%=phn%>" style="--i:10"><i class='bx bxl-linkedin' ></i></a>
        </div>
    </div>
    <div class="contact-form">
        <form action="http://localhost:8088/WebApplication2/EmailServlet?mail=<%=email%>" method="post">
            <input type="text" placeholder="Enter Your Name" required name="yname">
            <input type="email" placeholder="Enter Your Email" required name="semail">
            <input type="" placeholder="Enter Your Subject" required name="sub">
            <textarea  cols="40" rows="10" placeholder="Enter Your Message" required name="message"></textarea>
        <input type="submit" value="submit" class="send">
        </form>
    </div>
</section>
<div class="last-text">
    <p>Developed with love by <%=name%> <%=sname%> © 2023</p>
</div>
<a href="#" class="top"><i class="bx bx-up-arrow-alt"></i></a>







    <script src="portfolio.js"></script>
</body>
</html>
