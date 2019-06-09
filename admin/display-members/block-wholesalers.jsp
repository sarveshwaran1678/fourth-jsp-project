<%-- 
    Document   : block-wholesalers
    Created on : Jul 17, 2018, 9:14:24 PM
    Author     : saru
--%>


<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%     
             Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
                
                String msg=request.getParameter("id");
                
                
                String str="update wholesalers_details set status=0 where id=?";
                PreparedStatement ps=con.prepareStatement(str);
                
                ps.setInt(1,Integer.parseInt(msg));
                
                  int ns=ps.executeUpdate();
                  if(ns>0)
                                   {response.sendRedirect("display-wholesaler.jsp");
                                                                       }
                                                                       
                                   
                
                
                %>
    </body>
</html>
