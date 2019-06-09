<%-- 
    Document   : template for pagation
    Created on : Jul 18, 2018, 12:47:22 PM
    Author     : saru
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <% 
             Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
                    
                
                
                String msg=request.getParameter("msg");
                
                
               String str="select * from  farmers_details where status = 1 order by id limit ? offset ? ";
                
                int page_number=1;
                if(msg !=null){
                 page_number=Integer.parseInt(msg);
                }
                
                String strQuery ="select count(*) from farmers_details where status=1 ";
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
                 
    </body>
</html>
