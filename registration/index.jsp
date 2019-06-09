<%-- 
    Document   : index
    Created on : Apr 11, 2018, 5:43:13 AM
    Author     : saru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                  <link rel="stylesheet" type="text/css" href="../css/reg.css">

    </head>
    <body>
        <div class ="back" style="width:100%;height:auto;background-image: url('reg.jpg');background-size: contain;background-repeat: no-repeat;background-position: center;">
       
            <div class="container_reg">
            <center> <span><h1>REGISTRATION</h1></span></center>
      <div class="farmer_info">
          <form action="database_farmer.jsp">
              <ul>
              
                 
                  <li>  <span class="clear">  Full name:</span></li>
                  <li> <input class ="cha"type="text" name="fullname"  placeholder="Enter your name" required></li>
            <br>
            <li><span class="clear"> Email:</span></li>
            <li><input class ="cha" type="text" name="email" placeholder="Enter your email" required></li>
            <br>
            <li> <span class="clear"> Phone number:</span></li>
            <li><input class ="cha" type="text" name="phonenumber" placeholder="Enter your phone number" required></li>
           
            </ul>
            
            
          <br>
          <br>
          <br>
          <hr>
          <center>
             
             
              <div class="qwe">
                         
             <label class="container">FARMER
  <input type="radio" checked="checked"  name="ctype" value="FARMER" checked>
  <span class="checkmark">
      
  </span>
</label>
              <hr>or<hr>
             <label class="container">WHOLESALER
  <input type="radio" name="ctype" value="WHOLESALER">
  <span class="checkmark"></span>
</label>
            
            <hr>
              </div>
             <input type="image" src="back.jpg" class ="back1" width="35" height="35" onclick="history.back(-1)" />
            <input type="submit" value="Submit" class="submit">
            </center>
            
            
              
           
</form>
            </div>
    </div>
        </div>
                
              
    </body>
</html>
