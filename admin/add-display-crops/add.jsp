<%-- 
    Document   : add
    Created on : May 6, 2018, 5:25:06 AM
    Author     : saru
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
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
    <body>
        <div class="conatiner">
        <%@include file="../head.jsp" %>
        </div>
                   <form action="add-db.jsp">
                     <center>    
                         <table>
                              <tr>
                                  <th>Enter crop type:</th>
                              </tr>
                               <tr>
                                   <th><input type="text" name="crop-type" placeholder="Enter the crop type:"  ></th>
                               </tr>
                         </table>
                         <input type="submit" value="Submit" >
                     </center>
                   </form>
        <br>
         <%
            
        
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
                String str="select * from crop_types limit ? offset ?";
                
                
                int rowCount=0;
                String x;
                String y;
                
                
                String msg=request.getParameter("msg");
                
                
                
                int id;
                
                int page_number=1;
                if(msg !=null){
                 page_number=Integer.parseInt(msg);
                }
                
                String strQuery ="select count(*) from crop_types  ";
                        PreparedStatement pas=con.prepareStatement(strQuery);
                
                ResultSet ses = pas.executeQuery();
                String Countrow="";
                
                while(ses.next()){
                Countrow = ses.getString(1);

                }
                int total=Integer.parseInt(Countrow);
                System.out.println(total);
                int perpage=5;
                double totpage=Math.ceil(total/perpage);
                int posit=(page_number-1)*perpage;
                PreparedStatement ps=con.prepareStatement(str);
                ps.setInt(2, posit);
                ps.setInt(1, perpage);
                
                 ResultSet rs=ps.executeQuery();
                 
               %> 
              
                 <table  class="table clear table-striped table-bordered table-hover" id="mydata">
                   
                     <thead><tr>
                       <th>ID</th>
                       <th>Crop-Type</th>
                      
                    </tr>
                     </thead>
                      <tfoot><tr>
                       <th>ID</th>
                       <th>Crop-Type</th>
                      
                    </tr>
                     </tfoot>
               <% 
               
               
                    while(rs.next())
                    {
                    rowCount=rs.getRow();
                    x=rs.getString("type_name");
                    y=rs.getString("id");
                    
                    
                    %>
                    <tbody>
                        <tr>
                        <td><%=y%></td>
                        <td><%=x%></td>
                        
                    </tr>
                    </tbody>
            <%
                       }%>
                       
                 </table>
                          <%
                 int i=1;
                 while(i<=totpage+1)
                  {
                   %>
                  <a href="add.jsp?msg=<%=i%>" > <%=i%> </a>
                    
                    <%  
                i++; 
                 
                 }
                 i=1;
    %>
    
              
                     
                       <br>
                       
  <!--                      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
                        

    <!-- Include all compiled plugins (below), or include individual files as needed 
    <script src="../../JS/plug/bootstrap.min.js"></script>
    <script src="../../JS/plug/jquery.dataTables.min.js"></script>
    <script src="../../JS/plug/dataTables.bootstrap.min.js"></script>
    <script src="../../JS/plug/datatables.min.js"></script>
    <script src="../../JS/plug/datatables.js"></script>
    
    <script> $('#mydata').dataTable();   </script>
            -->
                      
        
                
    </body>
</html>
