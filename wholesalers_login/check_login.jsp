<%-- 
    Document   : check_login
    Created on : Apr 22, 2018, 10:10:25 AM
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
                  <link rel="stylesheet" type="text/css" href="../css/first_pagecss.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
            String email=request.getParameter("email");
            String otp=request.getParameter("OTP");
            
        if(email!=null && email.length()!=0){
             Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
                String str="select * from  wholesalers_details where email=? and wholesalers_otp=? and status=1";
                
                PreparedStatement ps=con.prepareStatement(str);
                
                ps.setString(1, email);
                ps.setString(2, otp);
                
                int blocked=0;
                String strQuery="select count(*) from  wholesalers_details where email=? and wholesalers_otp=? and status=0";
                PreparedStatement prepared=con.prepareStatement(strQuery);
                prepared.setString(1, email);
                prepared.setString(2, otp);
                ResultSet resultprepare=prepared.executeQuery();
                
                while (resultprepare.next())
                                       {
                    blocked=Integer.parseInt(resultprepare.getString(1));
                }
                if(blocked == 0 ){
                String semail=null;
                
                int rowCount=0;
                
                ResultSet rs=ps.executeQuery();
                
                while(rs.next())
                                   {
                    rowCount=rs.getRow();
                    
                                       }
                String member="wholesaler";
                    if(rowCount>0)
                    {
                        session.setAttribute("email", email);
                        session.setAttribute("member",member);
                        
                        response.sendRedirect("../intro/intro.jsp");
                                               }
                     else
                                                 {
                     session.setAttribute("result", "Incorrect email-id or password");
                    response.sendRedirect("first_page.jsp");
                                                          }
                               }
                               else{
                     session.setAttribute("result", "You have been Blocked");
                    response.sendRedirect("first_page.jsp");
                               }
                               }
               %>
               
           %>
    </body>
</html>
