<%-- 
    Document   : add-crop-middle
    Created on : May 6, 2018, 6:41:11 AM
    Author     : saru
--%>

<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <br>
        
       <%
            String msg=request.getParameter("msg");
            System.out.println(msg);
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
            String str="select id from crop_types where type_name= ?";    
            PreparedStatement ps=con.prepareStatement(str);
            ps.setString(1, msg);
                
               ResultSet rs=ps.executeQuery();
               int x=0;
               %> 
               
               <% 
               while(rs.next())
              {
                   
                  x= rs.getInt("id");
                   
              }
                System.out.println(x);
             
                String str1="select * from crops where type_id=?";
                
                PreparedStatement ps1=con.prepareStatement(str1);
                
                ps1.setInt(1, x);
                
                ResultSet rs1=ps1.executeQuery();
                
                 
                String x1;
                String id;
                int type=0;
                
               %> 
              
            <center>    
                <table class="table clear table-striped table-bordered table-hover" id="mydata">
                    <thead>  <tr>
                       <th>Id</th>
                       <th>Crop Name</th>    
                       <th>Crop-Type-Id</th>
                      
                   </tr>   
                    </thead>
               <% 
               if (!rs1.next() ) 
               {%>
               <tr>
               <center><td colspan="4">No data Found.. Insert data</td></center>
               </tr>
                          <% 
                }
                else
                {
                    do{


                      x1=rs1.getString("crop_name");
                      id=rs1.getString("id");
                      type=rs1.getInt("type_id");
                      

                      %>
                      <tbody>  <tr>
                          <center> 
                           <td><%=id%></td>
                           <td><%=x1%></td> 
                           <td ><%=type%></td>
                           
                          <center>
                       </tr>
                          </tbody>

              <%     }while(rs1.next());
                } %>   
                  
                </table>
              </center>
            <form>
            Enter the crop name you want to insert: 
            <br>
            
            <input type="text" name="crop-type" placeholder="Enter the crop type:"  >  
            <input type="submit" value="Submit" >
            <br>
         </form>
       
</html>
