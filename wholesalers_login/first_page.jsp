
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <link rel="stylesheet" type="text/css" href="../css/first_pagecss.css">
          <script src="JS/first_pagejs.js"></script>
              <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

    </head>
    <body>
        <div id="background" style="width:100%;height:700px;background-image: url('bg1.jpg');background-size: contain;background-repeat: no-repeat;">
            <div class="container" >
                <div class="login" >
                    <div class="login_heading">
                        <h1><center>WHOLESALER</center></h1>
                    </div>
                    <div class="login_body ">
                        <div class="login_new">
                            <form action="check_login.jsp">
                            <br><br>
                            <span> Email:<br></span>
                            <center> <input type="text" name="email" placeholder="Enter your email" requried class="space"></center>
                            <br><br>
                            <span> OTP/Password:<br></span>
                            <center>    <input type="password" name="OTP" placeholder="Enter your OTP/PASSWORD" requried class="space"></center>
                            <br><br>
                            <center>  <input type="submit" value="Submit" class="submit_style"></center>
                         </form>  
                              <%try
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
                            out.println("<br>"+"<center>"+common[0]+"</center>"+"<br>");
                            
                            out.println("<center>"+common[1]+"</center>");

                              session.removeAttribute("myres");
                                  }catch(Exception ex)
                            {
                            
                            }
                               try{
                              String sign=session.getAttribute("signin").toString();
                              
                            String[] see = sign.split(",");
                            out.println("<br>"+"<center>"+see[0]+"</center>"+"<br>");
                            out.println("<center>"+see[1]+"</center>");
                            session.removeAttribute("signin");
                                  }catch(Exception ex)
                            {
                            
                            }
                                %>
                            <br>
                            <input type="image" src="back.jpg" class ="back1" width="35" height="35" onclick="history.back(-1)" />

                            <center><a href="./../registration/index.jsp">NEW USER??SIGNUP</a></center> 
                            <br>
                        </div>
                    </div>
                    
                </div>
                
            </div>
            
        </div>
   </body>
</html>
