<%-- 
    Document   : notifications
    Created on : Apr 14, 2018, 3:31:14 PM
    Author     : saru
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="../head.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" type="text/css" href="../css/new.css">
         <link rel="stylesheet" type="text/css" href="../css/notify.css">

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
                String str="";
                String str1="select * from notification where subject=? and status=0 ";
                PreparedStatement ps=con.prepareStatement(str1);
                
              ps.setString(1, myemail);   
             ResultSet rs=ps.executeQuery();
            
                int rowCount=0;
                int id=0;
            String actor_id="";
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
                
            
                     System.out.println(subject_id);
                     System.out.println(subject);
                     System.out.println(actor_id);
                     System.out.println(actor);
                    
                     
                
                if(member.equalsIgnoreCase("farmer")){
                     str1="SELECT f.id as fid,f.crop_type as ft, f.crop_name as fc, f.crop_variety as fv,f.quintals as fq, f.price_of_each_quintals as fp, w.id , w.crop_type , w.crop_name , w.crop_variety , w.quintals , w.price_of_each_quintals  FROM wholesalers_crops AS w, farmers_crops AS f WHERE f.id =? AND f.farmers_key =  ? AND w.id =? AND w.wholesalers_key =  ? AND w.status =1 AND f.status =1 ORDER BY crop_type, crop_name, crop_variety";
                
                               }
                if(member.equalsIgnoreCase("wholesaler")){
               str1="SELECT f.quintals, f.price_of_each_quintals, f.id, f.crop_type, f.crop_name, f.crop_variety, w.id AS fid, w.crop_type AS ft, w.crop_name AS fc, w.crop_variety AS fv, w.quintals AS fq, w.price_of_each_quintals AS fp FROM wholesalers_crops AS w, farmers_crops AS f WHERE w.id =? AND w.wholesalers_key =  ? AND f.id =? AND f.farmers_key= ?  and w.status=1 and f.status=1 ORDER BY crop_type, crop_name, crop_variety";
                              }
                     if(str1!="" && str1.length()!=0){
                PreparedStatement ps1=con.prepareStatement(str1);
                
             ps1.setString(1, subject_id); 
             ps1.setString(2, subject);   
            ps1.setString(3, actor_id); 
            ps1.setString(4, actor);
            
             
             
            
            
            ResultSet rs1=ps1.executeQuery();
            
            int rowCount1=0;
            
            while(rs1.next())
            {
                rowCount1=rs1.getRow();
                int fid=rs1.getInt("fid");
                String ftype=rs1.getString("ft");
                String fname=rs1.getString("fc");
                String fvariety=rs1.getString("fv");
                String fquintals=rs1.getString("fq");
                String fprice=rs1.getString("fp");
               
                int sid=rs1.getInt("id");
                String stype=rs1.getString("crop_type");
                String sname=rs1.getString("crop_name");
                String svariety=rs1.getString("crop_variety");
                String squintals=rs1.getString("quintals");
                String sprice=rs1.getString("price_of_each_quintals");
               
                
                  
                
                System.out.println(fid);
                     System.out.println(sid);
                     System.out.println(fprice);
                     System.out.println(sprice);
                
                %>
                <br>
                <br>
                <br>
                <br>
                <div class="notify">
                    <ul class="mine clear">   
                        
                <li>Your-id:<%=fid%></li>
               <li> Type_name:<%=ftype%></li>
                <li>Crop_name:<%=fname%></li>
               <li>Crop_variety:<%=fvariety%></li>
                <li>Number_of_quintails:<%=fquintals%></li>
                <li>Price_of_each:<%=fprice%></li>
                </ul>
                <ul class="their clear">
                    
                    <li>Their-id:<%=sid%></li>
                   <li>Type_name:<%=stype%></li>
                   <li>Crop_name:<%=sname%></li>
                   <li>Crop_variety:<%=svariety%></li>
                   <li>Number_of_quintails: <%=squintals%></li>
                    <li>Price_of_each:<%=sprice%></li>
                </ul>
                <div class="fl clear">
                     <a  href=<%= "\"../deal/deal_1.jsp?id=" + id +"&fid="+ fid+"&sid="+ sid+ "\"" %> ><img  border="0"  src="../pictures/deal.png" width="70" height="80"></a>
                </div>
                </div>
                <span class="clear"></span>
                <br>
                   
           <%     
            }
            
                      }
                                         }
        %> 
    </body>
</html>
