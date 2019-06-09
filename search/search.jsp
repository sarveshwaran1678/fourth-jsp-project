<%-- 
    Document   : search
    Created on : May 7, 2018, 6:43:53 PM
    Author     : saru
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <link rel="stylesheet" type="text/css" href="../css/new.css">
        <link rel="stylesheet" type="text/css" href="../css/new.css">
         <link href="../css/plug/bootstrap.min.css" rel="stylesheet">
        <link href="../css/plug/dataTables.bootstrap.min.css" rel="stylesheet">
        <link href="../css/plug/datatables.min.css" rel="stylesheet">
        
        <link href="../css/plug/datatables.css" rel="stylesheet">

          <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
     </head>
    <body>
 
        <div>
                  
 <%@include file="../head.jsp" %>
        </div>
        <% String myemail="",member="";
          try
         { 
              myemail=(String)session.getAttribute("email");
              member=(String)session.getAttribute("member");
      
    if(myemail==null || member ==null)
                           {
                response.sendRedirect("../index.jsp");
            }
} catch (Exception e)
      {
                response.sendRedirect("../index.jsp");

}%>
        <%
         Class.forName("com.mysql.jdbc.Driver");
         
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
           
                
            
                    
                    
        String str="";
        if(member.equalsIgnoreCase("farmer")){
        str = "select f.id as _id,w.id,w.crop_type,w.crop_name,w.crop_variety,w.quintals,w.price_of_each_quintals,w.wholesalers_key from farmers_crops as f, wholesalers_crops as w where f.farmers_key=? and w.status=1 and f.status=1 and (f.crop_type=w.crop_type and f.crop_name=w.crop_name and f.crop_variety=w.crop_variety)";
                    //   +  "union select f.id as _id,w.id,w.crop_type,w.crop_name,w.crop_variety,w.quintals,w.price_of_each_quintals,w.wholesalers_key from farmers_crops as f, wholesalers_crops as w where f.farmers_key=?  and w.status=1 and f.status=1 and(f.crop_type=w.crop_type and f.crop_name=w.crop_name )";
               }
       if(member.equalsIgnoreCase("wholesaler")){ 
         str = "select w.id as _id,f.id,f.crop_type,f.crop_name,f.crop_variety,f.quintals,f.price_of_each_quintals,f.farmers_key from farmers_crops as f, wholesalers_crops as w where w.wholesalers_key=?  and w.status=1 and f.status=1 and (f.crop_type=w.crop_type and f.crop_name=w.crop_name and f.crop_variety=w.crop_variety)";
                    //   +  "union select w.id as _id,f.id,f.crop_type,f.crop_name,f.crop_variety,f.quintals,f.price_of_each_quintals,f.farmers_key from farmers_crops as f, wholesalers_crops as w where w.wholesalers_key=?  and w.status=1 and f.status=1 and (f.crop_type=w.crop_type and f.crop_name=w.crop_name )";
         }
        
        if(str!="" && str.length()!=0){
                PreparedStatement ps=con.prepareStatement(str);
                
            ps.setString(1, myemail);   
         //   ps.setString(2, myemail);   
            
            
            
            ResultSet rs=ps.executeQuery();
            
            int rowCount=0;
            %>
            <br>
            <br>
        <table class="table clear table-striped table-bordered table-hover">
                <thead>    <tr>
                    
                       <th>Crop-Type</th>
                       <th>Crop-Name</th>
                       <th>Crop-Variety</th>
                       <th>Quintals</th>
                       <th>Price-Of-Each-Quintals</th>
                       <th>Email</th>
                       <th>         </th>
                       
                       
                    </tr>
                </thead>
        <%
            while(rs.next())
            {
                rowCount=rs.getRow();
                int id= rs.getInt("id");
                String type=rs.getString("crop_type");
                String name=rs.getString("crop_name");
                String variety=rs.getString("crop_variety");
                String quintals=rs.getString("quintals");
                String price=rs.getString("price_of_each_quintals");
                String memail="";
                int id1=0;
               
               if(member.equalsIgnoreCase("farmer")){
                  memail=rs.getString("wholesalers_key");
                   id1=rs.getInt("_id");
               }
                if(member.equalsIgnoreCase("wholesaler")){ 
                   memail=rs.getString("farmers_key");
                   id1=rs.getInt("_id");
                }
                

           String newstr="select count(*) from notification where ((actor_id=? and subject_id=?) and (actor=? and subject=?)) or ((actor_id=? and subject_id=?) and (actor=? and subject=?)) and (status=0 or status=1) ";
                PreparedStatement newps=con.prepareStatement(newstr);
                String myyemail,theiremail;
                int theirid,myid;
                theirid=rs.getInt("id");
                myid=rs.getInt("_id");
                myyemail=myemail;
                theiremail=memail;
              newps.setInt(1, myid);   
              newps.setInt(2, theirid);
               newps.setString(3, myyemail);   
              newps.setString(4, theiremail);  
              
              
              newps.setInt(5, theirid);     
              newps.setInt(6, myid);   
              newps.setString(7, theiremail);  
              newps.setString(8, myyemail);   
                          
             ResultSet newrs=newps.executeQuery();
            
               String count="0";
           
            while(newrs.next())
            {
                count=newrs.getString(1);
                 
                
                }
               System.out.println(count);
               if(Integer.parseInt(count) == 0)
                                  {
                %>
                <tr>
                <tbody>
                        <td><%=type%></td>
                        <td><%=name%></td>
                        <td><%=variety%></td>
                        <td><%=quintals%></td>
                        <td><%=price%></td>
                        <td><%=memail%></td>
                        <td><%=id%></td>
                        <td><%=id1%></td>
                        <td><a  href=<%= "\"../notification/notification.jsp?actor-id=" + rs.getInt("id") +"&subject-id=" + rs.getInt("_id")+"&actor=" + myemail +"&subject=" + memail + "\"" %> ><img  border="0"  src="../pictures/check.png" width="20" height="20"></a></td>
                        <tbody>
                        
                    </tr> 
                   
           <%     
            }
            
                      }}
                       
        %>
        
        




    </body>
</html>
