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
          <link rel="stylesheet" type="text/css" href="../css/new.css">
          <link rel="stylesheet" type="text/css" href="../css/droplist.css">

    </head>
    <body>
        

        <div id="header1">
        <div id="nav">
            <ul>
                <li><a href="../first.jsp" >Home</a></li>
       <li>   
       <div class="dropdown">
      <button class="dropbtn">Users</button>
      
      <div class="dropdown-content">
      <a href="../display-members/display-farmer.jsp">Farmers</a>
      <a href="../display-members/display-wholesaler.jsp">Wholesalers</a>
   
      </div>
      </div></li>
         <li>   
       <div class="dropdown">
      <button class="dropbtn">Delete</button>
      
      <div class="dropdown-content">
      <a href="../add-display-crops/all-crop.jsp">Delete crop</a>
      <a href="../add-display-crops/all-type.jsp">Delete type</a>
      <a href="../add-display-crops/all-variety.jsp">Delete variety</a>
   
      </div>
      </div></li>
      <li><a href="#">HISTORY</a></li>
      <li><a href="#">NOTIFICATION</a></li>
      <li> 
      <div class="dropdown">
      <button class="dropbtn">ADD NEW</button>
      
      <div class="dropdown-content">
      <a href="../add-display-crops/add.jsp">Add crop type</a>
      <a href="../add-display-crops/add-crop.jsp">Add crop name</a>
      <a href="../add-display-crops/add-variety.jsp">Add crop variety</a>
      </div>
      </div>
      </li>
     
      <li><a href="../search/search.jsp" >SEARCH</a></li>
      <li><a href="../logout.jsp" >Logout</a></li>
                
            </ul>
            <% 
            
            String email=(String)session.getAttribute("email");
            %>
        </div>
        </div>
    </body>
</html>
