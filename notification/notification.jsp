<%-- 
    Document   : notification
    Created on : May 10, 2018, 8:17:19 PM
    Author     : saru
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
 <% String myemail=(String)session.getAttribute("email");
        String member=(String)session.getAttribute("member");
    if(myemail==null)
                           {
                response.sendRedirect("../index.jsp");
            }%>
            
            
        <%
        
            String actor_id=request.getParameter("actor-id");
            String actor=request.getParameter("actor");
            String subject=request.getParameter("subject");
            String subject_id=request.getParameter("subject-id"); 
                    
             Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
                 String str="";
                
               str="insert into  notification (actor_id,actor,subject_id,subject) values (?,?,?,?) ";
               
                
                if(str!="" && str.length()!=0){
                PreparedStatement ps=con.prepareStatement(str);
                int status=1;
                ps.setString(1, subject_id);
                ps.setString(2, actor);
                ps.setString(3, actor_id);
                ps.setString(4, subject);
               
               
               

                
                
                
                int rowCount=0;
                
                int i=ps.executeUpdate();
                
                if(i>0)
                                   {
                    response.sendRedirect("../search/search.jsp");
                    
                    
                    %>
                    
                    
                               <%        }
                else
                                       {
                %>
                               
                <h1>
                    record not inserted
                </h1>   
                    <%
                }
                    
                                   }
                        
            
    
        %> 
     
    </body>
</html>
