<%-- 
    Document   : add-variety-middle1
    Created on : May 6, 2018, 2:01:29 PM
    Author     : saru
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
            String msg=request.getParameter("msg");
        
            System.out.println(msg);
            
             Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
               
                
                    
  String str1="select crop_name from crops where crop_type=?";
                
                PreparedStatement ps1=con.prepareStatement(str1);
                
                ps1.setString(1, msg);
                
                ResultSet rs1=ps1.executeQuery();
                int rowCount=0;
             
               %> 
               <h4 class="heading">Select crop name:</h4>
               <form >
                   <div class="drop"> <select required="" name="crop-name" style="height: 20px;width: 250px;" onchange="crop2(this.value)">
                   <option></option>
               <% while(rs1.next())
                                   
                                    {
                    rowCount=rs1.getRow();
                    String x1=rs1.getString("crop_name");
                 
                    
                    %>
    
                     <option ><%=x1%></option> 
                    
        
            <%
                       }%>
                  
               </select>
                       
                       </div>
               </form>
                       <br>
    </body>
</html>
