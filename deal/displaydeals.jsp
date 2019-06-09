<%-- 
    Document   : displaydeals
    Created on : May 13, 2018, 3:28:44 PM
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
                 <link rel="stylesheet" type="text/css" href="../css/notifymaps.css">
                 <link rel="stylesheet" type="text/css" href="../css/displaydeals.css">
        <link rel="stylesheet" type="text/css" href="../css/new.css">

        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../head.jsp" %>
         <% String myemail=(String)session.getAttribute("email");
       String member=(String)session.getAttribute("member");
      
    if(myemail==null)
                           {
                response.sendRedirect("../index.jsp");
            }%>
      
     <%
      Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
                String str1="";
                
                        
                String str="select * from notification where (subject=? or actor=?) and status=1";
                PreparedStatement ps=con.prepareStatement(str);
                
              ps.setString(1, myemail);   
              ps.setString(2, myemail);   
             ResultSet rs=ps.executeQuery();
            
                int rowCount=0;
                int id=0;
            String actor_id="",str2="";
                    String actor="";
                    String subject="";
                     String subject_id="";
            while(rs.next())
            {
                rowCount=rs.getRow();
                 actor_id=rs.getString("actor_id");
                 actor=rs.getString("actor");
                 subject=rs.getString("subject");
                 subject_id=rs.getString("subject_id");
                 id=rs.getInt("id");
                
            
                    
                    
                     
                
                if(member.equalsIgnoreCase("farmer")){
                     str1="SELECT w.wholesalers_name as name, w.wholesalers_number as number, w.latitude as lat,w.longitude as lng,w.email as email,f.latitude as lat1,f.longitude as lng1 from wholesalers_details as w,farmers_details as f  where w.email=? and f.email=? ";
                     str2="SELECT f.id,f.crop_type, f.crop_name, f.crop_variety,f.quintals, f.price_of_each_quintals, w.id AS fid, w.crop_type AS ft, w.crop_name AS fc, w.crop_variety AS fv, w.quintals AS fq, w.price_of_each_quintals AS fp FROM wholesalers_crops AS w, farmers_crops AS f WHERE f.id =? AND f.farmers_key =  ? AND w.id =? AND w.wholesalers_key =  ?ORDER BY crop_type, crop_name, crop_variety";
                               }
                if(member.equalsIgnoreCase("wholesaler")){
               str1="SELECT f.farmers_name as name, f.farmers_phone as number,f.email as email ,f.latitude as lat,f.longitude as lng,w.latitude as lat1,w.longitude as lng1  from farmers_details as f,wholesalers_details as w where f.email=? and w.email=? ";
               str2=" SELECT f.quintals, f.price_of_each_quintals, f.id, f.crop_type, f.crop_name, f.crop_variety, w.id AS fid, w.crop_type AS ft, w.crop_name AS fc, w.crop_variety AS fv, w.quintals AS fq, w.price_of_each_quintals AS fp FROM wholesalers_crops AS w, farmers_crops AS f WHERE w.id =? AND w.wholesalers_key =  ? AND f.id =? AND f.farmers_key= ? ORDER BY crop_type, crop_name, crop_variety ";
                              }
                     if(str1!="" && str1.length()!=0 && str2!="" && str2.length()!=0 ){
                PreparedStatement ps1=con.prepareStatement(str1);
                PreparedStatement ps2=con.prepareStatement(str2);
                
               
             
            ps1.setString(1, actor);
            ps1.setString(2, subject);
               ps2.setString(1, subject_id); 
             ps2.setString(2, subject);   
            ps2.setString(3, actor_id); 
            ps2.setString(4, actor);
            
             
             
            
            
            ResultSet rs1=ps1.executeQuery();
            ResultSet rs2=ps2.executeQuery();
            
            int rowCount1=0;
            
            while(rs1.next())
            {
                String name=rs1.getString("name");   
                String phone=rs1.getString("number");
                String memail=rs1.getString("email");
                String lat=rs1.getString("lat");
                String lat1=rs1.getString("lat1");
                String lng=rs1.getString("lng");
                String lng1=rs1.getString("lng1");
                while(rs2.next()){
                rowCount1=rs2.getRow();
                 
                int fid=rs2.getInt("fid");
                String ftype=rs2.getString("ft");
                String fname=rs2.getString("fc");
                String fvariety=rs2.getString("fv");
                String fquintals=rs2.getString("fq");
                String fprice=rs2.getString("fp");
               
                int sid=rs2.getInt("id");
                String stype=rs2.getString("crop_type");
                String sname=rs2.getString("crop_name");
                String svariety=rs2.getString("crop_variety");
                String squintals=rs2.getString("quintals");
                String sprice=rs2.getString("price_of_each_quintals");
                
                
                %>
                <br>
                <br>
                <br>
                <br>
                 <span class="dea" >
        <ul class="see">
            <li>Name: <%=name%><br></li>
            <li>  Email: <%=memail%><br></li>
            <li>  phone: <%=phone%><br></li>
        </ul></span>
                 <span class="clear"></span>
                 <div class="notify">
                    <ul class="mine clear">   
                        
                        <li><span>Your-id:</span><%=fid%></li>
               <li><span> Type_name:</span><%=ftype%></li>
                <li><span>Crop_name:</span><%=fname%></li>
               <li><span>Crop_variety:</span><%=fvariety%></li>
                <li><span>Number_of_quintails:</span><%=fquintals%></li>
                <li><span>Price_of_each:</span><%=fprice%></li>
                </ul>
                <ul class="their clear">
                    
                    <li><span>Their-id:</span><%=sid%></li>
                   <li><span>Type_name:</span><%=stype%></li>
                   <li><span>Crop_name:</span><%=sname%></li>
                   <li><span>Crop_variety:</span><%=svariety%></li>
                   <li><span>Number_of_quintails:</span><%=squintals%></li>
                    <li><span>Price_of_each:</span><%=sprice%></li>
                </ul>
                 
                </div>
                    <a href="https://www.google.com/maps/dir/?api=1&origin=<%=lat%>,<%=lng%>&destination=<%=lat1%>,<%=lng1%>">more info?</a>
                   
                
                 
                 
   

                
               
                   
                 
              
                
                   
           <%     
            
                          }}
            
                      }
                                         }
                                         
        %> 
        
        
    
    </body>
</html>
