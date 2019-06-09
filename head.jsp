<%-- 
    Document   : home_page
    Created on : Apr 14, 2018, 2:42:08 PM
    Author     : saru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <link rel="stylesheet" type="text/css" href="css/new.css">
          <link rel="stylesheet" type="text/css" href="../css/droplist.css">


    </head>
    <body>
        <div id="header1">
        <div id="nav">
            <ul>
       <li><a href="../intro/intro.jsp">HOME</a></li>
        <li><a href="../menu/profile.jsp" >PROFILE</a></li>
         <li><a href="../dropdown_crops/crops_drop.jsp">ADD CROP</a></li>
       <li><a href="../farmer_select/farmer_select.jsp">CART</a></li>
     <li><a href="../search/search.jsp" >SEARCH</a></li>
     
      <li>   
       <div class="dropdown">
      <button class="dropbtn">OTHERS</button>
      
      <div class="dropdown-content">
       <a href="../delete_crop/delete_crop.jsp">HISTORY</a>
      <a href="../menu/notifications.jsp">NOTIFICATION</a>
     <a href="../deal/displaydeals.jsp">ALL DEALS</a>
   
      </div>
       </div>
      </li>
     
      
      <li><a href="../logout.jsp" >Logout</a></li>
                
            </ul>
            <% 
            
            String email=(String)session.getAttribute("email");
            %>
        </div>
        </div>
    </body>
</html>
