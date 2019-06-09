<%-- 
    Document   : index
    Created on : Apr 8, 2018, 11:49:01 AM
    Author     : Galaxy
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
        <title>JSP Page</title>
    </head>
    <% String myemail=(String)session.getAttribute("email");
    if(myemail==null)
                           {
                response.sendRedirect("../index.jsp");
            }%>
   <script>
  
        </script>
        
    
    <body>
        
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
               
               <% while(rs.next())
                                   {
                   
                   x= rs.getInt("id");
                   
                                      }
                System.out.println(x);
                
                    
  String str1="select crop_name from crops where type_id=?";
                
                PreparedStatement ps1=con.prepareStatement(str1);
                
                ps1.setInt(1, x);
                
                ResultSet rs1=ps1.executeQuery();
                int rowCount=0;
             
               %> 
               <br>
               <h4 class="heading">Select crop name:</h4>
               <form action="../insert_farmer/insert_farmer.jsp">
                   <div class="drop"> <select required="" name="drop2" style="height: 20px;width: 250px;" onchange="getcrop2(this.value)">
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
                    
       
                     
                    
    </body>
                
</html>
