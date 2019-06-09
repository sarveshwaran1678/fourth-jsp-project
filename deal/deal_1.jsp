<%-- 
    Document   : deal
    Created on : May 13, 2018, 3:01:24 PM
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
      Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
                String id=request.getParameter("id");
                String fid=request.getParameter("fid");
                String sid=request.getParameter("sid");
                %>
     
        
               <% 
                int id1=Integer.parseInt(id);
                int fid1=Integer.parseInt(fid);
                int sid1=Integer.parseInt(sid);
                String str="" ,str1="",str2="";
                
                
                str="UPDATE notification SET status = 1 WHERE id =?";
                PreparedStatement ps=con.prepareStatement(str);
                
            ps.setInt(1, id1); 
            int i=0,j=0,j1=0;
            
            i=ps.executeUpdate();
            if(i>0){
                %>
               
        Done1
        <%
               if(member.equalsIgnoreCase("farmer")){
               str1="UPDATE farmers_crops SET status = 2 WHERE id=? ";
               str2="UPDATE wholesalers_crops SET status = 2 WHERE id=? ";
                               }
                if(member.equalsIgnoreCase("wholesaler")){
                 str1="UPDATE wholesalers_crops SET status = 2 WHERE id=?  ";
                 str2="UPDATE farmers_crops SET status = 2 WHERE id=?  ";
                               }
                if(str!="" && str.length()!=0){
                PreparedStatement ps1=con.prepareStatement(str1);
                PreparedStatement ps2=con.prepareStatement(str2);
                
                ps1.setInt(1, fid1);
                ps2.setInt(1, sid1);
                 j=ps1.executeUpdate();
                 j1=ps2.executeUpdate();
               
                
                               }
               if(j>0 && j1>0)
                                     {
                   
                   response.sendRedirect("displaydeals.jsp");
               }}
                             
                
                
               %>
    </body>
</html>
