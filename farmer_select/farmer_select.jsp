
<%-- 
    Document   : farmer_select
    Created on : Apr 28, 2018, 5:51:13 AM
    Author     : saru
--%>
<%@include file="../head.jsp" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../css/select_crops.css">
        <link rel="stylesheet" type="text/css" href="../css/new.css">
    </head>
    <body background="back.jpg">
        <br>
        <br>
        <div >
         <% 
          String myemail="",member="";
          try
         { 
              myemail=(String)session.getAttribute("email");
              member=(String)session.getAttribute("member");
      
    if(myemail==null)
                           {
                response.sendRedirect("../index.jsp");
            }
} catch (Exception e)
      {
                response.sendRedirect("../index.jsp");

}
%>
      
     <%
      Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
                String str="";
                if(member.equalsIgnoreCase("farmer")){
                str="select id,crop_type,crop_name,crop_variety,quintals,price_of_each_quintals from  farmers_crops where farmers_key=? and status=1 order by crop_type,crop_name,crop_variety";
                               }
                if(member.equalsIgnoreCase("wholesaler")){
                str="select id,crop_type,crop_name,crop_variety,quintals,price_of_each_quintals from  wholesalers_crops where wholesalers_key=? and status=1 order by crop_type,crop_name,crop_variety ";
                               }
                if(str!="" && str.length()!=0){
                PreparedStatement ps=con.prepareStatement(str);
                
            ps.setString(1, myemail);   
            
            
            
            ResultSet rs=ps.executeQuery();
            
            int rowCount=0;
            
            while(rs.next())
            {
                rowCount=rs.getRow();
                int id=rs.getInt("id");
                String type=rs.getString("crop_type");
                String name=rs.getString("crop_name");
                String variety=rs.getString("crop_variety");
                String quintals=rs.getString("quintals");
                String price=rs.getString("price_of_each_quintals");
               
                
                
                
                
                
                %>
                
                <div class="crop_disp clear" >
                    <ul class="ul_crop_disp">
                        <li class="crop_type"><span>crop_type</span>: <%=type %></li>
                        <hr>
                        <li class="left2"><span>crop_name</span>: <%=name %></li>
                        <li class="right2 move "><span>quintals</span>: <%=quintals %></li>
                        
                        <li class="left2 look1 clear "><span>crop_variety</span>: <%=variety %></li> 
                        <li class="right2 look1"> <span>price_of_each_quintals</span>: <%=price %></li>
                        <li class="clear"></li>
                        <br>
                        
                        <li> <a  href=<%= "\"delete.jsp?id=" + rs.getInt("id") + "\"" %> ><img  class="look"border="0"  src="../pictures/delete.png" width="20" height="20"></a>
                           
                        
                        </li>
                       
                    
                </div>  
        
                   
           <%     
            }
            
                      }
        %> 
        </div>
    </body>
</html>
