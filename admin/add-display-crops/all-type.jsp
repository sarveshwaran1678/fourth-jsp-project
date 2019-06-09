<%-- 
    Document   : all-type
    Created on : May 9, 2018, 12:10:10 PM
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
                  <%     Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
                String str="select * from  crop_types order by type_name";
                
                PreparedStatement ps=con.prepareStatement(str);
                int rowCount=0;
                String name,y,type,variety;
                int id,type_id;
                ResultSet rs=ps.executeQuery();
               %> 
              <center> 
                 <table border="1"  style="border-collapse:collapse;">
                    <tr>
                       <th>ID</th>
                       <th>Crop-Type</th>
                       <td>Delete</td>
                    </tr>
               <% 
               
               
                    while(rs.next())
                    {
                    rowCount=rs.getRow();
                    id=rs.getInt("id");
                   type=rs.getString("type_name");
                    
                    
                    
                    %>
                    <tr>
                        <td><%=id%></td>
                        
                        <td><%=type%></td>
                        <td><a  href=<%= "\"delete-type.jsp?id=" + rs.getInt("id") + "\"" %> ><img  border="0"  src="../../pictures/delete.png" width="20" height="20"></a></td>

                    </tr>
        
            <%
                       }%>
                       
                 </table>
                       <a href="add-variety.jsp">Add more variety..</a>
              </center>
    </body>
</html>
