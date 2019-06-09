<%-- 
    Document   : add-crop
    Created on : May 6, 2018, 6:35:37 AM
    Author     : saru
--%>
<%@include file="../head.jsp" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
             <meta charset="utf-8"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <script>
           
            function crop(data)
            {
                
                if(data=="")
                    {
                        alert();
                    }
                    else
                        {
                var x;
                
                if(window.XMLHttpRequest)
                {
                    x=new XMLHttpRequest();    
                }
                else
                {
                    x=new ActiveXObject("Microsoft.XMLHTTP");
                }
                
                x.onreadystatechange=function()
                {
                    if(x.readyState==4 && x.status==200)
                    {
                        document.getElementById("newdisp").innerHTML=x.responseText;
                    }
                }
                
            x.open("get", "add-crop-middle.jsp?msg="+data, true);
            x.send();
                }
            }
        </script>
    <body>
        
             <%
            
        
             Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
                String str="select type_name from crop_types";
                
                PreparedStatement ps=con.prepareStatement(str);
                
               
                
                
                int rowCount=0;
                String x;
                ResultSet rs=ps.executeQuery();
               %> 
                
                    <form action="add-crop-db.jsp">
                    <select required name="crop1" style="height: 20px;width: 250px;" onchange="crop(this.value)">
                        <option></option>       
               <% while(rs.next())
                                   {
                    rowCount=rs.getRow();
                    x=rs.getString("type_name");
                    System.out.println(x);
                    
                    %>
    
                     <option  ><%=x%></option> 
                    
        
            <%
                       }%>
                        
                    
  
                    </select>
                      
                       <div id="newdisp">
                           
                       </div>
                      
                        </form>
                                
 <!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
     Include all compiled plugins (below), or include individual files as needed 
    <script src="../../JS/plug/bootstrap.min.js"></script>
    <script src="../../JS/plug/jquery.dataTables.min.js"></script>
    <script src="../../JS/plug/dataTables.bootstrap.min.js"></script>
    <script src="../../JS/plug/datatables.min.js"></script>
    <script src="../../JS/plug/datatables.js"></script>
    
   
  
              <script>
        $('#mydata').dataTable();
    </script>     -->   
    </body>
</html>
