<%-- 
    Document   : add-variety-middle2
    Created on : May 6, 2018, 2:03:05 PM
    Author     : saru
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../css/new.css">
        <link rel="stylesheet" type="text/css" href="../../css/droplist.css">
       <link href="../../css/plug/bootstrap.min.css" rel="stylesheet">
        <link href="../../css/plug/dataTables.bootstrap.min.css" rel="stylesheet">
        <link href="../../css/plug/datatables.min.css" rel="stylesheet">
        
        <link href="../../css/plug/datatables.css" rel="stylesheet">

          <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JSP Page</title>
    </head>
    <body>
       <% String msg=request.getParameter("msg");
            System.out.println(msg);
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
            String str="select id from crops where crop_name= ?";    
            PreparedStatement ps=con.prepareStatement(str);
            ps.setString(1, msg);
                
               ResultSet rs=ps.executeQuery();
               int x=0;
               
               
               
               
               %> 
               
               <% 
               while(rs.next())
              {
                   
                  x= rs.getInt("id");
                   
              }
                System.out.println(x);
             
                String str1="select * from crop_variety where ckey=? limit ? offset ?";
                
               
                
               
                
               
                String msg1= session.getAttribute("message").toString();
                
                
                int rowCount=0;
                
                
               
                 int page_number=1;
                if(msg1 !=null){
                 page_number=Integer.parseInt(msg1);
                }
                
                String strQuery ="select count(*) from crop_variety where ckey=? ";
                        PreparedStatement pas=con.prepareStatement(strQuery);
                pas.setInt(1, x);
                ResultSet ses = pas.executeQuery();
                String Countrow="";
                
                while(ses.next()){
                Countrow = ses.getString(1);

                }
                int total=Integer.parseInt(Countrow);
                System.out.println(total);
                int perpage=2;
                int totpage=(int)Math.ceil(total/perpage);
                int posit=(page_number-1)*perpage;
                PreparedStatement ps1=con.prepareStatement(str1);
                ps1.setInt(3, posit);
                ps1.setInt(2, perpage);
                ps1.setInt(1, x);
                
                 ResultSet rs1=ps1.executeQuery();
                 
               
                 
                 session.setAttribute("page", totpage);
                 
                 
                
                
                
                 
                String x1;
                String id;
                int type=0;
                String mytype;
                
               %> 
              
            <center>    
                <table border="1"  style="border-collapse:collapse;">
                   <tr>
                       <th>Id</th>
                       <th>Crop-variety</th>    
                       <th>Crop-Name-Id</th>
                      
                      
                   </tr>    
               <% 
               if (!rs1.next() ) 
               {%>
               <tr>
               <center><td colspan="4">No data Found.. Insert data</td></center>
               </tr>
                          <% 
                }
                else
                {
                    do{


                      x1=rs1.getString("crop_variety");
                      id=rs1.getString("id");
                      type=rs1.getInt("ckey");
         
                      %>
                       <tr>
                          <center> 
                           <td><%=id%></td>
                           <td><%=x1%></td> 
                           <td ><%=type%></td>
                          
                           
                          <center>
                       </tr>

              <%     }while(rs1.next());
                } 
  
  
  
 %>   
                
                
                
                  
                </table>
                
                
                
                
         
              </center>
            <form>
                <br>
            Enter the crop variety name you want to insert: 
            <br>
            
            <input type="text" name="crop-variety" placeholder="Enter the crop variety:"  >  
            <input type="submit" value="Submit" >
            <br>
         </form>
    </body>
</html>
