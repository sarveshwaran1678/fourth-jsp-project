<%-- 
    Document   : drop3
    Created on : Apr 14, 2018, 4:58:24 PM
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
        <title>JSP Page</title>
    </head>
    <% String myemail=(String)session.getAttribute("email");
    if(myemail==null)
                           {
                response.sendRedirect("../index.jsp");
            }%>
    <body>
      
        
          <%
            String msg2=request.getParameter("msg");
        
            System.out.println("second "+msg2);
            
             Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
                String str="select id from crops where crop_name= ?";
                
                PreparedStatement ps=con.prepareStatement(str);
                
                ps.setString(1, msg2);
                
                ResultSet rs=ps.executeQuery();
                int x1=0;
               %> 
               
               <% while(rs.next())
                                   {
                   
                   x1= rs.getInt("id");
                   
                                      }
                System.out.println(x1);
                
                    
  String str1="select crop_variety from crop_variety where ckey=?";
                
                PreparedStatement ps1=con.prepareStatement(str1);
                
                ps1.setInt(1, x1);
                
                System.out.println(ps1);
                
                ResultSet rs1=ps1.executeQuery();
                int rowCount=0;
             
               %>
               <h4 class="heading">Select crop variety:</h4>
               <form action="../insert_farmer/insert_farmer.jsp">
                   <div class="drop">   <select required="" name="drop3" style="height: 20px;width: 250px;">
                   <option></option>
               <% while(rs1.next())
                                   
                                    {
                    rowCount=rs1.getRow();
                    String x2=rs1.getString("crop_variety");
             System.out.println(x2);       
                    
                    %>
    
                     <option ><%=x2%></option> 
                    
        
            <%
                       }%>
                  
               </select>
                       
                   </div><br>
                   <div class="part1"  >    <span class="heading" > <b> Number of quaintals:</b></span><br><br>
            <input type="number" name="quaintals" placeholder="Enter the number of quaintals" class="match" requried>
            <br></div>
                   <div class="part1">
            <span class="heading" ><b> Price of each quaintal:</b></span><br><br>
            <input type="number" name="price" placeholder="Price of one.."  class="match" requried>
                   </div>
         <%   // use javascript to multiple both and display%>
         <br>
         <input id="submit" type="submit" value="Submit" class="submit_style">
                         </form>
                       
                     
         
    </body>
</html>
