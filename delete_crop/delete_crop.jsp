<%-- 
    Document   : delete_crop
    Created on : May 8, 2018, 9:20:17 PM
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
        <link rel="stylesheet" type="text/css" href="../css/new.css">
              <link href="../css/plug/bootstrap.min.css" rel="stylesheet">
        <link href="../css/plug/dataTables.bootstrap.min.css" rel="stylesheet">
        <link href="../css/plug/datatables.min.css" rel="stylesheet">
        
        <link href="../css/plug/datatables.css" rel="stylesheet">

          <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JSP Page</title>
    </head>
    <body>
          <%@include file="../head.jsp" %>
      <% 
              String myemail=(String)session.getAttribute("email");
       String member=(String)session.getAttribute("member");
      
    if(myemail==null)
                           {
                response.sendRedirect("../index.jsp");
            }%>
            <%
            String msg=request.getParameter("msg");
        Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
                String str="",strQuery="";
                if(member.equalsIgnoreCase("farmer")){
                str="select id,crop_type,crop_name,crop_variety,quintals,price_of_each_quintals,status from  farmers_crops where farmers_key=?  order by status,crop_type,crop_name,crop_variety limit ? offset ?";
                      strQuery ="select count(*) from  farmers_crops where farmers_key=?"; 
                        }
                if(member.equalsIgnoreCase("wholesaler")){
                str="select id,crop_type,crop_name,crop_variety,quintals,price_of_each_quintals,status from  wholesalers_crops where wholesalers_key=?  order by crop_type,crop_name,crop_variety limit ? offset ?";
                      strQuery ="select count(*) from  wholesalers_crops where wholesalers_key=?  ";
                              }
                
                if(str!="" && str.length()!=0 && strQuery!="" && strQuery.length()!=0 ){
                
                
                
                int rowCount=0,status;
                 String name,type,variety;
                 int price_of_each_quintals,quintals;
                 int page_number=1;
                if(msg !=null){
                 page_number=Integer.parseInt(msg);
                }
                
                
                        PreparedStatement pas=con.prepareStatement(strQuery);
                            pas.setString(1,myemail);
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
                ps.setString(1,myemail);
                ps.setInt(3, posit);
                ps.setInt(2, perpage);
                
                 ResultSet rs=ps.executeQuery();
                 
               
               %> 
             
                 <table class="table clear table-striped table-bordered table-hover" border="1"  style="border-collapse:collapse;">
                     <thead>  <tr>
                       
                       <th>Crop-type</th>
                       <th>Crop-Name</th>
                       <th>Crop-Variety</th>
                       <th>Quintals</th>
                       <th>Price_of_each_quintals</th>
                       <th>Status</th>
                       
                  
                       
                    </tr>
                     </thead>
               <% 
               
               
                    while(rs.next())
                    {
                    rowCount=rs.getRow();
                    name=rs.getString("crop_name");
                    type=rs.getString("crop_type");
                    variety=rs.getString("crop_variety");
                    price_of_each_quintals=rs.getInt("price_of_each_quintals");
                    quintals=rs.getInt("quintals");
                    status=rs.getInt("status");
                    
                    
                    %>
                    <tbody> <tr>
                        <td><%=name%></td>
                        <td><%=type%></td>
                        <td><%=variety%></td>
                        <td><%=quintals%></td>
                        <td><%=price_of_each_quintals%></td>
                        <% 
                        if(status == 0)
                        {
                        %>
                        <td><span style="background-color:rgba(236, 69, 43, 0.99)">DELETED</span></td>
                        <%
                        }
                        else if( status == 2)
                        {
                         %>
                         <td><span style="background-color:rgba(42, 176, 32, 0.99);">SOLD</span></td>
                        
                        <%   
                        }
                    else
                     {
                    %>
                    <td><span style="background-color:rgba(198, 226, 13, 0.99);">IN CART</span></td>  
                        <%
                    }
                        
                        


%>
                        
                    </tr>
                    </tbody>
        
            <%
                       }
                 %>
            
                       <%
                 int i=1;
                 while(i<=totpage+1)
                  {
                   %>
                  <a href="delete_crop.jsp?msg=<%=i%>" > <%=i%> </a>
                    
                    <%  
                i++; 
                 
                 }
                 i=1;
    %>           
                    
                    <%
       }%>
                       
                
       
         
              
    </body>
</html>
