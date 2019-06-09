<%-- 
    Document   : add-variety
    Created on : May 6, 2018, 1:52:17 PM
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
                
            x.open("get", "add-variety-middle1.jsp?msg="+data, true);
            x.send();
                }
            }
            function crop2(data)
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
                        document.getElementById("newdisp1").innerHTML=x.responseText;
                    }
                }
                
            x.open("get", "add-variety-middle2.jsp?msg="+data, true);
            x.send();

     }
        </script>
    <body>
        
        <div class="conatiner">
        <%@include file="../head.jsp" %>
        </div>
         <% 
         String mess=request.getParameter("msg1");
              
              
                
                session.setAttribute("message", mess);
                  
                      if(mess == null){                        
                   session.setAttribute("message", 1);
                                     }
                    
                                       
        
             Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
                String str="select type_name from crop_types";
                
                PreparedStatement ps=con.prepareStatement(str);
              
                
                int rowCount=0;
                String x;
                ResultSet rs=ps.executeQuery();
               %> 
               
               
                    <form action="add-variety-db.jsp">
                        <br>  <h3>Select crop type:</h3><br>
                    <select required name="crop-type" style="height: 20px;width: 250px;" onchange="crop(this.value)">
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
                       <div id="newdisp1">
                           
                       </div>
                       
                        </form>
                            <%
                           
                           int totpage=Integer.parseInt(session.getAttribute("page").toString());
                           
                            System.out.println("total page "+totpage);
                                                                  
                           
                                   int i=1;
                            while(i<=totpage)
                             {
                              %>
                             <a href="add-variety.jsp?msg1=<%=i%>" > <%=i%> </a>

                               <%  
                           i++; 

                            }
                           // i=1;
                                
                            
               
    %>        
    </body>
</html>
