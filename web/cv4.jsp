<%-- 
    Document   : cv4.jsp
    Created on : 25-Oct-2023, 7:57:42 pm
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
              <link rel="stylesheet" type="text/css" href="resume4.css">
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
        <%!String d;%>
                <%!String str;%>
      <%!String de;%>
        <%!String n;%>
        <%!String y;%>
        <%!String cg;%>
        <%!String s="";%>
        <%!int a;%>
        
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
          <section class="resume">
        <div class="header">
            <h3 class="header-name"><%=name%> <%=sname%></h3>
            <div class="header-contact">
                <a><%=phn%></a><a>|</a>
                <a><%=email%></a><a>|</a>
                <a href="<%=linked%>"> LinkedIn</a><a>|</a>
                <a href=""<%=git1%>> Github</a><a>|</a>
                <a><%=city1%> <%=state1%> </a>
            </div>
        </div>
        
        <hr>
        <div class="Summary">
            <h3>Summary</h3>
  <%
                                try {
                  smt=con.createStatement();
               
            } catch (SQLException ex) {
                 out.println(ex);
          
            }
          
             query="select * from summary where email='"+email+"'";
              
      
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
            while(rs.next())
            {
            name=rs.getString("summary");
           
            
            }
                            %>
                    <p><%=name%></p>
        </div>
        <br>
        <div class="education">
            <h3>EDUCATION</h3>
            <hr>
              <%
                                       try {
                  smt=con.createStatement();
               
            } catch (SQLException ex) {
                 out.println(ex);
          
            }
          
             query="select * from education where email='"+email+"'";
              
      
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
            while(rs.next())
            {
de=rs.getString("degree");
n=rs.getString("name");
city1=rs.getString("city");
state1=rs.getString("state");
y=rs.getString("year");
cg=rs.getString("cgpa");

            
              
                      %>
            <div class="parentcgpa">
            <li class="national">
                <b><%=de%></b> 
            </li>
            <p class="cgpaclass"><b>CGPA:<%=cg%></b></p>
            <p class="info"><%=n%>, <%=y%>|<%=city1%>,<%=state1%></p>
            </div>
            <%
                }
            %>
        </div>
        <br>
        <%
                         try {
                  smt=con.createStatement();
               
            } catch (SQLException ex) {
                 out.println(ex);
          
            }
          
             query="select count(*) from job where email='"+email+"'";
              
      
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
            while(rs.next())
            {
           x=rs.getInt("count(*)");
            
            }
            if(x>0)
            {
                    %>
        <div class="education">
            <h3>WORK EXPERIENCE</h3>
            <hr>
              <%
                                       try {
                  smt=con.createStatement();
               
            } catch (SQLException ex) {
                 out.println(ex);
          
            }
          
             query="select * from job where email='"+email+"'";
              
      
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
            while(rs.next())
            {
t=rs.getString("title");
e=rs.getString("employer");
sd=rs.getString("start_date");
ed=rs.getString("end_date");
d=rs.getString("description");

            
              
                      %>
            <div class="parentcgpa"> 
           
                <b><%=t%>,<%=e%></b>
            
            <p class="cgpaclass"><b><%=sd%>-<%=ed%></b></p>
            <p class="info">
            <ul>
                <%
                                int l=d.length();
int i=0,count=1;
while(i<l)
{
  int x=d.indexOf(".",i);

  while(d.charAt(i)=='1')
  {
      i++;
  }
 
   str=d.substring(i,x+1);
 if(count%2==0)
 {
  
                            %>
                <li class="national"><%=str%></li>
                 <%
                              
 }
 count++;
  i=x+1;
    
}
                              %>
            </ul>
            </p>
            </div>
              <%
                            }
                        %>
        </div>
          <%
                            }
                        %>
        <br>
        <div class="education">
            <h3>PROJECTS</h3>
            <hr>
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
n=rs.getString("name");

y=rs.getString("org");
de=rs.getString("dat");
d=rs.getString("description");


                       %>
        
                <b><%=n%>|<%=y%>|<%=de%></b>
           
            <p class="info">
            <ul>
                 <%
                                int l=d.length();
int i=0,count=1;
while(i<l)
{
  int x=d.indexOf(".",i);

  while(d.charAt(i)=='1')
  {
      i++;
  }
 
   str=d.substring(i,x+1);
 if(count%2==0)
 {
  
                            %>
                <li class="national"><%=str%></li>
                <%
                              
 }
 count++;
  i=x+1;
    
}
                              %>
            </ul>
            </p>
            <br>

           
            
        </div>
                                        <%
                                }
                            %>
        <br>
        <div class="education">
            <h3>TECHNICAL SKILLS</h3>
            <hr>
              <%
                            
                            try {
                  smt=con.createStatement();
               
            } catch (SQLException ex) {
                 out.println(ex);
          
            }
          
             query="select count(*) from programming_langauge where language in(select skill from skills where email='"+email+"')";
              
      
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
            while(rs.next())
            {
            a=rs.getInt("count(*)");
            
                            }
                            if(a>0)
                            {
                            query="select language from programming_langauge where language in(select skill from skills where email='"+email+"')";
                                         try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
            while(rs.next())
            {
            a--;
            t=rs.getString("language");
            if(a==0)
            {
            s=s+t;
                            }
                            else
                            {
                             s=s+t+",";
                            }
           
            
            
                            }
              
                            
       

                        %>
                        <li class="national">Programming Language:<%=s%></li>
                        <%
                            }
s="";
 try {
                  smt=con.createStatement();
               
            } catch (SQLException ex) {
                 out.println(ex);
          
            }
          
             query="select count(*) from systems where name in(select skill from skills where email='"+email+"')";
              
      
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
            while(rs.next())
            {
            a=rs.getInt("count(*)");
            
                            }
                            if(a>0)
                            {
                            query="select name from systems where name in(select skill from skills where email='"+email+"')";
                                         try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
            while(rs.next())
            {
            a--;
            t=rs.getString("name");
            if(a==0)
            {
            s=s+t;
                            }
                            else
                            {
                             s=s+t+",";
                            }
           
            
            
                            }
              
                            
       

                        %>
                        <li class="national">Systems:<%=s%></li>
                        <%
                            }
s="";
 try {
                  smt=con.createStatement();
               
            } catch (SQLException ex) {
                 out.println(ex);
          
            }
          
             query="select count(*) from library where name in(select skill from skills where email='"+email+"')";
              
      
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
            while(rs.next())
            {
            a=rs.getInt("count(*)");
            
                            }
                            if(a>0)
                            {
                            query="select name from library where name in(select skill from skills where email='"+email+"')";
                                         try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
            while(rs.next())
            {
            a--;
            t=rs.getString("name");
            if(a==0)
            {
            s=s+t;
                            }
                            else
                            {
                             s=s+t+",";
                            }
           
            
            
                            }
              
                            
       

                        %>
                        <li class="national">Library:<%=s%></li>
                        %>
                            <%
                                }
s="";
try {
                  smt=con.createStatement();
               
            } catch (SQLException ex) {
                 out.println(ex);
          
            }
          
             query="select count(*) from framework where name in(select skill from skills where email='"+email+"')";
              
      
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
            while(rs.next())
            {
            a=rs.getInt("count(*)");
            
                            }
                            if(a>0)
                            {
                            query="select name from framework where name in(select skill from skills where email='"+email+"')";
                                         try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
            while(rs.next())
            {
            a--;
            t=rs.getString("name");
            if(a==0)
            {
            s=s+t;
                            }
                            else
                            {
                             s=s+t+",";
                            }
           
            
            
                            }
              
                            
       

                        %>
                        <li class="national">Framework:<%=s%></li>
                        %>
                            <%
                                }
s="";
try {
                  smt=con.createStatement();
               
            } catch (SQLException ex) {
                 out.println(ex);
          
            }
          
             query="select count(*) from machinelearning where algo in(select skill from skills where email='"+email+"')";
              
      
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
            while(rs.next())
            {
            a=rs.getInt("count(*)");
            
                            }
                            if(a>0)
                            {
                            query="select algo from machinelearning where algo in(select skill from skills where email='"+email+"')";
                                         try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
            while(rs.next())
            {
            a--;
            t=rs.getString("algo");
            if(a==0)
            {
            s=s+t;
                            }
                            else
                            {
                             s=s+t+",";
                            }
           
            
            
                            }
              
                            
       

                        %>
                        <li class="national">Machine Learning:<%=s%></li>
                        %>
                            <%
                                }
s="";
try {
                  smt=con.createStatement();
               
            } catch (SQLException ex) {
                 out.println(ex);
          
            }
          
             query="select count(*) from db where dname in(select skill from skills where email='"+email+"')";
              
      
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
            while(rs.next())
            {
            a=rs.getInt("count(*)");
            
                            }
                            if(a>0)
                            {
                            query="select dname from db where dname in(select skill from skills where email='"+email+"')";
                                         try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
            while(rs.next())
            {
            a--;
            t=rs.getString("dname");
            if(a==0)
            {
            s=s+t;
                            }
                            else
                            {
                             s=s+t+",";
                            }
           
            
            
                            }
              
                            
       

                        %>
                        <li class="national">Databases:<%=s%></li>
                        %>
                            <%
                                }
s="";
try {
                  smt=con.createStatement();
               
            } catch (SQLException ex) {
                 out.println(ex);
          
            }
          
             query="select count(*) from tools where name in(select skill from skills where email='"+email+"')";
              
      
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
            while(rs.next())
            {
            a=rs.getInt("count(*)");
            
                            }
                            if(a>0)
                            {
                            query="select name from tools where name in(select skill from skills where email='"+email+"')";
                                         try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
            while(rs.next())
            {
            a--;
            t=rs.getString("name");
            if(a==0)
            {
            s=s+t;
                            }
                            else
                            {
                             s=s+t+",";
                            }
           
            
            
                            }
              
                            
       

                        %>
                        <li class="national">Tools:<%=s%></li>
                        %>
                            <%
                                }
s="";
%>



                           
                                  


        </div>
        <br>
        <%
                         try {
                  smt=con.createStatement();
               
            } catch (SQLException ex) {
                 out.println(ex);
          
            }
          
             query="select count(*) from certificate where email='"+email+"'";
              
      
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
            while(rs.next())
            {
           x=rs.getInt("count(*)");
            
            }
            if(x>0)
            {
                    %>
        <div class="education">
            <h2>Certificate</h2>
            <hr>
             <%
                          try {
                  smt=con.createStatement();
               
            } catch (SQLException ex) {
                 out.println(ex);
          
            }
          
             query="select name from certificate where email='"+email+"'";
              
      
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
            while(rs.next())
            {
de=rs.getString("name");

                       %>
            <li class="national"><%=de%></li>
              <%
                           }
                       %>
        </div>
                            <%
                        }
                    %>
                    <%
                         try {
                  smt=con.createStatement();
               
            } catch (SQLException ex) {
                 out.println(ex);
          
            }
          
             query="select count(*) from achivement where email='"+email+"'";
              
      
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
            while(rs.next())
            {
           x=rs.getInt("count(*)");
            
            }
            if(x>0)
            {
                    %>
                     <div class="education">
            <h2>HONORS ANS AWARDS</h2>
            <hr>
             <%
                          try {
                  smt=con.createStatement();
               
            } catch (SQLException ex) {
                 out.println(ex);
          
            }
          
             query="select * from achivement where email='"+email+"'";
              
      
             try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);
              
            }
            while(rs.next())
            {
de=rs.getString("aceive");

                       %>
            <li class="national"><%=de%></li>
              <%
                           }
                       %>
        </div>
        <%
            }
        %>
                   
    </section>
    </body>
</html>
