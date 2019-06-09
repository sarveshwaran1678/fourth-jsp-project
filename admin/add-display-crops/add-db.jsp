<%-- 
    Document   : add-db
    Created on : May 6, 2018, 5:37:45 AM
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
         String name=request.getParameter("crop-type");
      Class.forName("com.mysql.jdbc.Driver");
        
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
                String str="select distinct type_name from crop_types where upper(type_name) like upper(?)";
                
                PreparedStatement ps=con.prepareStatement(str);
                ps.setString(1,name);
                int rowCount=0;
                
                ResultSet rs=ps.executeQuery();
                while(rs.next())
                          {
                                rowCount=rs.getRow();
                          }
                System.out.println(rowCount);
                  if( rowCount==0 && name!="" && name.length()!=0)
                {
            
                    String str1="insert into   crop_types ( type_name)values (?) ";

                    PreparedStatement ps1=con.prepareStatement(str1);

                    ps1.setString(1, name);

                    ps1.executeUpdate();

                   response.sendRedirect("add.jsp");
                    
                                  }
              else
                                       {
                    
                    response.sendRedirect("add.jsp");    
                                                    }
                
                        
            
    
        %> 
    </body>
</html>
