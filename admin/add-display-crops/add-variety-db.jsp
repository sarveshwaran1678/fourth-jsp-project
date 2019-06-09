<%-- 
    Document   : add-variety-db
    Created on : May 6, 2018, 2:06:11 PM
    Author     : saru
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../css/new.css">
        <link rel="stylesheet" type="text/css" href="../../css/droplist.css">
       <link href="../../css/plug/bootstrap.min.css" rel="stylesheet">
        <link href="../../css/plug/dataTables.bootstrap.min.css" rel="stylesheet">
        <link href="../../css/plug/datatables.min.css" rel="stylesheet">
        
        <link href="../../css/plug/datatables.css" rel="stylesheet">

          <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JSP Page</title>
    </head>
    <body>
       <%
          String type=request.getParameter("crop-type");
            String name=request.getParameter("crop-name");
            String variety=request.getParameter("crop-variety");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
            String str="select id from crops where crop_name= ?";    
            PreparedStatement ps=con.prepareStatement(str);
            ps.setString(1, name);
            
                
               ResultSet rs=ps.executeQuery();
               int x=0;
               %> 
               
               <% 
               while(rs.next())
              {
                   
                  x= rs.getInt("id");
                   
              }
               System.out.println(x);
               String str2="select distinct crop_variety from  crop_variety where upper(crop_variety) like upper(?)";
               
                
                PreparedStatement ps2=con.prepareStatement(str2);
                ps2.setString(1,variety);
                int rowCount=0;
                
                ResultSet rs2=ps2.executeQuery();
                while(rs2.next())
                          {
                                rowCount=rs2.getRow();
                          }
                System.out.println(rowCount);
                if(rowCount==0 && variety!="" && variety.length()!=0){
               
                String str1="insert into crop_variety (ckey,crop_variety,crop_name,crop_type )values(?,?,?,?) ";
                
                PreparedStatement ps1=con.prepareStatement(str1);
                ps1.setInt(1, x);
                ps1.setString(2, variety);

               ps1.setString(3,name);
               ps1.setString(4,type);
                  
                ps1.executeUpdate();
                
                
               response.sendRedirect("all-variety.jsp");
                             }
                else
                                       {
               // response.sendRedirect("add-variety.jsp");
                }
                    
                    %>
              
    </body>
</html>
