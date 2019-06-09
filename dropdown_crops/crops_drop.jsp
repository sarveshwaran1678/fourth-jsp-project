<%-- 
    Document   : index
    Created on : Apr 8, 2018, 2:48:41 PM
    Author     : saru
--%>
<%@include file="../head.jsp" %>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../css/new.css">
        <link rel="stylesheet" type="text/css" href="../css/dropdown.css">
    </head>
    <% String myemail=(String)session.getAttribute("email");
    if(myemail==null)
                           {
                response.sendRedirect("../index.jsp");
            }%>
       <script>
           
            function getcrop(data)
            {
                
                if(data=="")
                    {
                        alert();
                    }
                    else
                        {
                var x;
                 console.log(data);
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
                        document.getElementById("disp").innerHTML=x.responseText;
                    }
                }
                
            x.open("get", "drop2.jsp?msg="+data, true);
            x.send();
                }
            }
        </script>
    <script>
       function getcrop1(data)
            {
                if(data=="")
                    {
                        alert();
                    }
                    else
                        {
                var x;
                console.log(data);
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
                        document.getElementById("disp").innerHTML=x.responseText;
                    }
                }
                
            x.open("get", "drop2.jsp?msg="+data, true);
            x.send();
                }
            }
            
     function getcrop2(data)
     {
         
         var x;
                console.log(data);
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
                        document.getElementById("disp3").innerHTML=x.responseText;
                    }
                }
                
            x.open("get", "drop3.jsp?msg="+data, true);
            x.send();

     }
            
        </script>
    <body background="back.jpg">
        <div class="container">
            
             <%
            
        
             Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
                String str="select type_name from crop_types";
                
                PreparedStatement ps=con.prepareStatement(str);
                
               
                
                
                int rowCount=0;
                String x;
                ResultSet rs=ps.executeQuery();
               %> 
                <center>
                    <h4 class="heading">Select crop type:</h4>
                    <form action="../insert_farmer/insert_farmer.jsp">
                        <div class="drop">   <select required name="drop1" style="height: 20px;width: 250px;" onchange="getcrop(this.value)">
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
                        </div>  
                       
                       
                        <div id="disp">
                           
                           
                       </div>
                          
                       <div id="disp3">
                           
                       </div>
                        </form>  
                       
                       
        </div>
    </body>
</html>
