<%-- 
    Document   : add-crop-db
    Created on : May 6, 2018, 6:35:58 AM
    Author     : saru
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
          String msg=request.getParameter("crop1");
            String msg1=request.getParameter("crop-type");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
            String str="select id from crop_types where type_name= ?";    
            PreparedStatement ps=con.prepareStatement(str);
            ps.setString(1, msg);
                
               ResultSet rs=ps.executeQuery();
               int x=0;
               %> 
               
               <% 
               while(rs.next())
              {
                   
                  x= rs.getInt("id");
                   
              }
               String str2="select distinct crop_name from crops where upper(crop_name) like upper(?)";
               
                
                PreparedStatement ps2=con.prepareStatement(str2);
                ps2.setString(1,msg1);
                int rowCount=0;
                
                ResultSet rs2=ps2.executeQuery();
                while(rs2.next())
                          {
                                rowCount=rs2.getRow();
                          }
                System.out.println(rowCount);
                if(rowCount==0 && msg1!="" && msg1.length()!=0){
               
                String str1="insert into crops (crop_name,type_id,crop_type )values(?,?,?) ";
                
                PreparedStatement ps1=con.prepareStatement(str1);
                
                ps1.setString(1, msg1);
                ps1.setInt(2, x);
                ps1.setString(3,msg);
                  
                ps1.executeUpdate();
                
                
               response.sendRedirect("all-crop.jsp");
                             }
                else
                                       {
                response.sendRedirect("add-crop.jsp");
                }
                    
                    %>
              
    </body>
</html>
