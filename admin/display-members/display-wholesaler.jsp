<%-- 
    Document   : display-wholesaler
    Created on : May 6, 2018, 9:16:11 PM
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
         <div class="conatiner">
        <%@include file="../head.jsp" %>
                </div>
        <%     Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
                String str="select * from   wholesalers_details  where status =1 order by id limit ? offset ? ";
                
                String msg=request.getParameter("msg");
                
                
                int rowCount=0;
                
                
                int id;
                String name,phone,otp,memail,lat,lng;
                 int page_number=1;
                if(msg !=null){
                 page_number=Integer.parseInt(msg);
                }
                
                String strQuery ="select count(*) from wholesalers_details where status=1 ";
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
               
        <h1>Wholesaler</h1>
                 <table class="table clear table-striped table-bordered table-hover" id="mydata">
                     <thead>
                     <tr>
                       <th>ID</th>
                       <th>name</th>
                       <th>Email</th>
                       <th>otp</th>
                       <th>phone</th>
                       <th>latitude</th>
                       <th>longitude</th>
                       <th>block?</th>
                    </tr>
                     </thead>
                     <tfoot>
                         <tr>
                             <th>ID</th>
                             <th>name</th>
                             <th>Email</th>
                             <th>otp</th>
                             <th>phone</th>
                             <th>latitude</th>
                       <th>longitude</th>
                             <th>block?</th>
                           
                         </tr>
                     </tfoot>
               <% 
               
               
                    while(rs.next())
                    {
                    rowCount=rs.getRow();
                    name=rs.getString("wholesalers_name");
                    id=rs.getInt("id");
                    phone=rs.getString("wholesalers_number");
                    otp=rs.getString("wholesalers_otp");
                    memail=rs.getString("email");
                     lat=rs.getString("latitude");
                    lng=rs.getString("longitude");
                    
                    
                    
                    %>
                    <tbody>
                        <tr>
                        <td><%=id%></td>
                        <td><%=name%></td>
                        <td><%=memail%></td>
                        <td><%=otp%></td>
                        <td><%=phone%></td>
                        <td><%=lat%></td>
                        <td><%=lng%></td>
                         <td><center><a  href=<%= "\"block-wholesalers.jsp?id=" + rs.getInt("id") + "\"" %> ><img  border="0"  src="../../Images/x.png" width="20" height="20"></a></center></td>
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
                  <a href="display-wholesaler.jsp?msg=<%=i%>" > <%=i%> </a>
                    
                    <%  
                i++; 
                 
                 }
                 i=1;
    %>
         
    <!--
    
    
    
    
    
    
    
    Blocked User
    
    
    
    
    
    
    
    
    
    
    
    
    -->
    
         <%     Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
                String str1="select * from   wholesalers_details  where status =0 order by id limit ? offset ? ";
                
                String msg1=request.getParameter("msg1");
                
                
                int rowCount1=0;
                
                
                int id1;
                String name1,phone1,otp1,memail1,lat1,lng1;
                 int page_number1=1;
                if(msg1 !=null){
                 page_number1=Integer.parseInt(msg1);
                }
                
                String strQuery1 ="select count(*) from wholesalers_details where status=0 ";
                        PreparedStatement pas1=con.prepareStatement(strQuery1);
                
                ResultSet ses1 = pas1.executeQuery();
                String Countrow1="";
                
                while(ses1.next()){
                Countrow1 = ses1.getString(1);

                }
                int total1=Integer.parseInt(Countrow1);
                System.out.println(total1);
                int perpage1=5;
                double totpage1=Math.ceil(total1/perpage1);
                int posit1=(page_number1-1)*perpage1;
                PreparedStatement ps1=con.prepareStatement(str1);
                ps1.setInt(2, posit1);
                ps1.setInt(1, perpage1);
                
                 ResultSet rs1=ps1.executeQuery();
                 
                
               %> 
               
        <h1>Blocked Wholesaler</h1>
                 <table class="table clear table-striped table-bordered table-hover" id="mydata">
                     <thead>
                     <tr>
                       <th>ID</th>
                       <th>name</th>
                       <th>Email</th>
                       <th>otp</th>
                       <th>phone</th>
                        <th>latitude</th>
                       <th>longitude</th>
                       <th>unblock?</th>
                    </tr>
                     </thead>
                     <tfoot>
                         <tr>
                             <th>ID</th>
                             <th>name</th>
                             <th>Email</th>
                             <th>otp</th>
                             <th>phone</th>
                             <th>latitude</th>
                             <th>longitude</th>
                             <th>unblock?</th>
                           
                         </tr>
                     </tfoot>
               <% 
               
               
                    while(rs1.next())
                    {
                    rowCount1=rs1.getRow();
                    name1=rs1.getString("wholesalers_name");
                    id1=rs1.getInt("id");
                    phone1=rs1.getString("wholesalers_number");
                    otp1=rs1.getString("wholesalers_otp");
                    memail1=rs1.getString("email");
                    lat1=rs1.getString("latitude");
                    lng1=rs1.getString("longitude");
                    
                    
                    
                    %>
                    <tbody>
                        <tr>
                        <td><%=id1%></td>
                        <td><%=name1%></td>
                        <td><%=memail1%></td>
                        <td><%=otp1%></td>
                        <td><%=phone1%></td>
                        <td><%=lat1%></td>
                        <td><%=lng1%></td>
                        <td> <center><a  href=<%= "\"unblock-wholesalers.jsp?id=" + rs1.getInt("id") + "\"" %> ><img  border="0"  src="../../Images/tick.png" width="20" height="20"></a></center></td>
                    </tr>
                    </tbody>
            <%
                       }%>
                       
                 </table>
                       
                <%
                 int i1=1;
                 while(i1<=totpage1+1)
                  {
                   %>
                  <a href="display-wholesaler.jsp?msg1=<%=i1%>" > <%=i1%> </a>
                    
                    <%  
                i1++; 
                 
                 }
                 i1=1;
    %>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   Include all compiled plugins (below), or include individual files as needed 
    <script src="../../JS/plug/bootstrap.min.js"></script>
    <script src="../../JS/plug/jquery.dataTables.min.js"></script>
    <script src="../../JS/plug/dataTables.bootstrap.min.js"></script>
    <script src="../../JS/plug/datatables.min.js"></script>
    <script src="../../JS/plug/datatables.js"></script>
    
    <script>
        $('#mydata').dataTable();
    </script>
   
  -->
    </body>
</html>
