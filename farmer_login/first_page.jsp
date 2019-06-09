
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <link rel="stylesheet" type="text/css" href="../css/first_pagecss.css">
          

    </head>
    <body>
        <div id="background" style="width:100%;height:650px;background-image: url('bg.jpg');background-size: contain;background-repeat: no-repeat;">
            <div class="container" >
                <div class="login" >
                    <div class="login_heading">
                        <h1><center>FARMER</center></h1>
                    </div>
                    <div class="login_body ">
                        <div class="login_new">
                            <form action="check_login.jsp">
                            <br><br>
                            <span> Email:<br></span>
                            <center> <input type="text" required name="email" placeholder="Enter your email"  class="space"></center>
                            <br><br>
                            <span>OTP/Password:<br></span>
                            <center>    <input type="password" required name="OTP" placeholder="Enter your OTP/PASSWORD" class="space"></center>
                            <br><br>
                            <center>  <input type="submit" value="Submit" class="submit_style"></center>
                         </form>  
                            <br>
                            <%
                            try
                            {
                            String pri=session.getAttribute("result").toString();
                            out.println("<center>"+pri+"</center>");
                            session.removeAttribute("result");
                            }
                             
                             catch(Exception ex)
                             {
                             
                             
                             }
                            
                            try{
                            String pri1=session.getAttribute("myres").toString();
                              String[] common = pri1.split(",");
                            out.println("<center>"+common[0]+"</center>"+"<br>");
                            out.println("<center>"+common[1]+"</center>");
                            session.removeAttribute("myres");
                            

                            
                                                       }
                            catch(Exception ex)
                            {
                            
                            }
                             try{
                              String sign=session.getAttribute("signin").toString();
                              
                            String[] see = sign.split(",");
                            out.println("<center>"+see[0]+"</center>"+"<br>");
                            out.println("<center>"+see[1]+"</center>");
                            session.removeAttribute("signin");
                                  }catch(Exception ex)
                            {
                            
                            }
                                %>
                                         <input type="image" src="back.jpg" class ="back1" width="35" height="35" onclick="history.back(-1)" />

                                <center><a href="./../registration/index.jsp?">NEW USER??SIGNUP</a></center> 
                            <br>
                        </div>
                    </div>
                    
                </div>
                
            </div>
            
        </div>
   </body>
</html>
