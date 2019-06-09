<%-- 
    Document   : all-crop
    Created on : May 6, 2018, 1:08:04 PM
    Author     : saru
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
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
        
        <div class="conatiner">
        <%@include file="../head.jsp" %>
        <h1>All crops</h1>
                </div>
           <%     Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
                String str="select * from  crops order by crop_type,crop_name limit ? offset ?";
                
                
                int rowCount=0;
                String name,y;
                int id,type_id;
                
                
                String msg=request.getParameter("msg");
                
                
               
                
                int page_number=1;
                if(msg !=null){
                 page_number=Integer.parseInt(msg);
                }
                
                String strQuery ="select count(*) from  crops order by crop_type,crop_name ";
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
              <center> 
                 <table class="table clear table-striped table-bordered table-hover" id="mydata">
                     <thead>
                     <tr>
                    
                       <th>ID</th>
                       <th>Crop-Name</th>
                       <th>Crop-type</th>
                       <th>Type-id</th>
                        <th>Delete</th>
                       
                    </tr>
                     </thead>
                     <tfoot>
                         <tr>
                    
                       <th>ID</th>
                       <th>Crop-Name</th>
                       <th>Crop-type</th>
                       <th>Type-id</th>
                        <th>Delete</th>
                       
                    </tr>
                     </tfoot>
               <% 
               
               
                    while(rs.next())
                    {
                    rowCount=rs.getRow();
                    name=rs.getString("crop_name");
                    id=rs.getInt("id");
                    type_id=rs.getInt("type_id");
                    y=rs.getString("crop_type");
                    
                    
                    %>
                    <tr>
                        <td><%=id%></td>
                        <td><%=name%></td>
                        <td><%=y%></td>
                        <td><%=type_id%></td>
                        <td><a  href=<%= "\"delete-crop.jsp?id=" + rs.getInt("id") + "\"" %> ><img  border="0"  src="../../pictures/delete.png" width="20" height="20"></a></td>

                        
                    </tr>
        
            <%
                       }%>
                       
                       <%
                 int i=1;
                 while(i<=totpage+1)
                  {
                   %>
                  <a href="all-crop.jsp?msg=<%=i%>" > <%=i%> </a>
                    
                    <%  
                i++; 
                 
                 }
                 i=1;
    %>
                       
                 </table>
                       <a href="add-crop.jsp">Add more crop..</a>
              </center>
    </body>
</html>
