<%-- 
    Document   : insert_farmer
    Created on : Apr 26, 2018, 5:57:11 PM
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
        <% String myemail=(String)session.getAttribute("email");
        String member=(String)session.getAttribute("member");
    if(myemail==null)
                           {
                response.sendRedirect("../index.jsp");
            }%>
            
            
        <%
        
            String msg=request.getParameter("drop1");
            String msg1=request.getParameter("drop2");
            String msg2=request.getParameter("drop3");
            String quaintals=request.getParameter("quaintals"); 
            String price=request.getParameter("price"); 
                    
             Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
                 String str="";
                if(member.equalsIgnoreCase("farmer")){
               str="insert into  farmers_crops ( crop_type,crop_name,crop_variety,quintals,price_of_each_quintals,farmers_key,status)values (?,?,?,?,?,?,?) ";
                               }
                if(member.equalsIgnoreCase("wholesaler")){
                 str="insert into   wholesalers_crops ( crop_type,crop_name,crop_variety,quintals,price_of_each_quintals,wholesalers_key,status)values (?,?,?,?,?,?,?) ";
                               }
                if(str!="" && str.length()!=0){
                PreparedStatement ps=con.prepareStatement(str);
                int status=1;
                ps.setString(1, msg);
                ps.setString(2, msg1);
                ps.setString(3, msg2);
                ps.setString(4, quaintals);
                ps.setString(5, price);
                ps.setString(6, myemail);
                ps.setInt(7,status);
               
                
                
                
                
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
