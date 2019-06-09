<%-- 
    Document   : delete
    Created on : May 8, 2018, 8:36:56 PM
    Author     : saru
--%>

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
        
           String msg=request.getParameter("id");
           
                   int res= Integer.parseInt(msg) ;
             Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
                 String str="";
                if(member.equalsIgnoreCase("farmer")){
               str="UPDATE farmers_crops SET status = 0 WHERE id=? ";
                               }
                if(member.equalsIgnoreCase("wholesaler")){
                 str="UPDATE wholesalers_crops SET status = 0 WHERE id=?  ";
                               }
                if(str!="" && str.length()!=0){
                PreparedStatement ps=con.prepareStatement(str);
                
                ps.setString(1, msg);
               
               
                
                
                
                
                int rowCount=0;
                
                int i=ps.executeUpdate();
                
                if(i>0)
                                   {response.sendRedirect("../farmer_select/farmer_select.jsp");
                    %>
                    
                    
                               <%        }
                else
                                       {
                %>
                               
                <h1>
                    record not inserted
                </h1>   
                    <%
                }
                    
                                   }
                        
            
    
        %> 
    </body>
</html>
