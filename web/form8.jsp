<%-- 
    Document   : form8.jsp
    Created on : 15-Nov-2023, 4:11:36 pm
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" type="text/css" href="frm8.css">
                  <link rel="stylesheet" type="text/css" href="bootstrap.css">

    </head>
    <body>
    <%!String email;%>
    <%!String v;%>
    <%!String j;%>
    <%!String m;%>
    <%!String s;%>
    <%!String t="";%>
     <%!String r="";%>
     <%!int x;%>
    
         <%
             email=request.getParameter("email");
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
            
          
            String query="select * from summary where email='"+email+"'";
              
            rs=smt.executeQuery(query);
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
                while(rs.next())
                {
m=rs.getString("summary");
v=rs.getString("image");
                }
         query="select skill from skills where email='"+email+"'";
           rs=smt.executeQuery(query);
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
                while(rs.next())
                {
s=rs.getString("skill");
t=t+s+",";
                }
                r="I posses skills such as"+t+" give me job role in one word";
                j=Main.chatGPT(r);
                
            %>

                
           
      <div class="container-fluid">
        <div class="row">
            <div class="col-3" id="c1" style="color:white;">
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
                        <li><a href="form1.jsp?email=<%=email%>" class="nav-link active" href="#">Header</a></li>
                      <li><a href="form2.jsp?email=<%=email%>" class="nav-link active" href="#">Experience</a></li>
                      <li><a href="form3.jsp?email=<%=email%>" class="nav-link active" href="#">Education</a></li>
                      <li><a href="form4.jsp?email=<%=email%>" class="nav-link active" href="#">Projects</a></li>
                      
                      <li><a href="certificate.jsp?email=<%=email%>" class="nav-link active" href="#">Certifications</a></li>                    
                      <li><a href="form6.jsp?email=<%=email%>" class="nav-link active" href="#">Skills</a></li> 
                      <li><a href="form7.jsp?email=<%=email%>" class="nav-link active">Acheivements</a></li>
                                            <li><a href="#" class="nav-link active">Summary</a></li>
 <li><a href="webPage.jsp?email=<%=email%>" class="nav-link">Home</a></li>

                    </ul>
                  </nav>
                   

               </div>
        <div class="panel-body">
      
    <table id="tbl-student" class="table table-responsive table-bordered" cellpadding="0">
                  <thead>
                    <tr>
                      
                      <th>Delete</th>
                    </tr>
                  </thead>
              
             
        
        <%!String name;%>
       
     
             
            
            <%
             
          try {
                  smt=con.createStatement();
               
            } catch (SQLException ex) {
                 out.println(ex);
          
            }
            
          
            query="select count(*) from summary where email='"+email+"'";
              
            rs=smt.executeQuery(query);
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
                while(rs.next())
                {
x=rs.getInt("count(*)");
                }
                if(x!=0)
                {
                
            %>
            <tr>
           
          
            <td><a href="http://localhost:8088/WebApplication2/DeleteS?email=<%=email%>"><input type="button" id="b4" value="Delete" name="edit"></a></td>
            
            </tr>
          <%
              }
          %>
            
           </table>
      
    
               </div>
              
             
        
       
            </div>
            <div class="col-9">
              <div class="container-fluid c2">
                <h1>Let me know about yourself</h1>
                <p>Write brief introduction about yourself</p>
              </div>
<div class="container">
  <div class="contact-form row">
      <form action="http://localhost:8088/WebApplication2/SaveS" method="post" enctype="multipart/form-data">
    <div class="from-field col-lg-30">
        <p><label for="Write about your summary roughly">Write your summary</label></p>
 <input id="Give your Project a Title" class="input-text" type="text" name="a" value="<%=m%>">
      </div>
            <div class="from-field col-lg-8">
        <label for="Project URL" class="label">Job Role</label>
        <input id="Project URL" class="input-text" type="text" name="j" value="<%=j%>">
      </div>
          <div class="from-field col-lg-8">
        <label for="Project URL" class="label">Project photo</label>
        <input id="Project URL" class="input-text" type="file" name="file" value="<%=v%>">
   
      </div>
          
    <div class="from-field col-lg-6">
        
          <input type="submit" id="b1" class="Submit" value="Submit">
      </div>
    
        <div class="from-field col-lg-6">
      
                          <input id="Job Title" class="input-text" type="text" name="email" value="<%=email%>">
    </div>
  </form>
    </div>
  </div>
</div>
               
            </div>
        </div>

    </div>

   
    </body>
</html>
