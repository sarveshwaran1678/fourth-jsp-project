<%-- 
    Document   : delete
    Created on : May 8, 2018, 8:36:56 PM
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
                 
                String str="delete from crops where id=?";
                if(str!="" && str.length()!=0){
                PreparedStatement ps=con.prepareStatement(str);
                
                ps.setInt(1, msg1);
               
               
                
                
                
                
                int rowCount=0;
                
                int i=ps.executeUpdate();
                
                if(i>0)
                                   {response.sendRedirect("all-crop.jsp");
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
