<%-- 
    Document   : delete-variety
    Created on : May 9, 2018, 12:06:13 PM
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
       
          <%
        
           String msg=request.getParameter("id");
           int msg1= Integer.parseInt(msg);
                   int res= Integer.parseInt(msg) ;
             Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
                 
                String str="delete from crop_variety where id=?";
                if(str!="" && str.length()!=0){
                PreparedStatement ps=con.prepareStatement(str);
                
                ps.setInt(1, msg1);
               
               
                
                
                
                
                int rowCount=0;
                
                int i=ps.executeUpdate();
                
                if(i>0)
                                   {response.sendRedirect("all-variety.jsp");
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
