<%-- 
    Document   : newjsp
    Created on : Jul 18, 2018, 8:17:47 PM
    Author     : saru
--%>

<%@page import="java.sql.ResultSet"%>
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
          String myemail="",member="";
          try
         { 
              myemail=(String)session.getAttribute("email");
              member=(String)session.getAttribute("member");
      
    if(myemail==null)
                           {
                response.sendRedirect("../index.jsp");
            }
} catch (Exception e)
      {
                response.sendRedirect("../index.jsp");

}
%>
       <%
        String latitude=request.getParameter("la");
        String logitude=request.getParameter("ln");
        
        
        Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
                String str="";
               
               
                 if( member.toLowerCase().equals("farmer"))
            {
                   str="update farmers_details set latitude=?,longitude=?  where email = ?; ";
            }
            if( member.toLowerCase().equals("wholesaler"))
            {
                   str="update wholesalers_details set latitude=?,longitude=? where email = ?;";
            }
              
                
              PreparedStatement ps=con.prepareStatement(str);
              ps.setString(1,latitude);   
              ps.setString(2, logitude);   
              ps.setString(3, myemail);   
              
            int rs=ps.executeUpdate();
            if(rs>=0)
                               {
                
                response.sendRedirect("profile.jsp");
            }
             
            

%>
    </body>
</html>
