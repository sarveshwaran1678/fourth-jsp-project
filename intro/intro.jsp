<%-- 
    Document   : intro
    Created on : Jul 30, 2018, 10:41:00 AM
    Author     : saru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" type="text/css" href="../css/intro.css">
         <link rel="stylesheet" type="text/css" href="../css/new.css">

    </head>
    <body  background="back.jpg">
        <% String myemail=(String)session.getAttribute("email");
        String member=(String)session.getAttribute("member");
    if(myemail==null)
                           {
                response.sendRedirect("../index.jsp");
            }%>
           <%@include file="../head.jsp" %>
        <br>
        <br>
        <br>
        <br> 
        <div class="container" >
          
        <span id="top">
            <b>  This website provides a convenient way to post the crops you have or want and get details of people interested to buy or sell.</b>
 
        </span>
              <br>
            <br>
        <span><h3>How does this website work?</h3></span>
        <ul class="steps">
            <li>
                <span>Step 1: </span>Add Crops to your cart which you want to sell (if you are a farmer)/ buy (if you are a wholesaler)
                
            </li>
            <li>
               <span> Step 2: </span>Click on search to find people who are selling their crop (if you are wholesaler)/ buying a crop (if you are the farmer)
                
            </li>
            <li>
               <span> Step 3: </span>Click on the tick mark to request for a deal
            </li>
            <li>
               <span> Step 4:</span> Check your notifications constantly to check if someone wants to make an offer with you
               
                
            </li>
            <li>
              <span> Step 5:</span> If you are interested in a particular deal, click on the deal button
            </li>
            <li>
              <span>  Step 6: </span> You will get the details of list of people interested in making an offer with you.
            </li>
        </div>
     
        </ul>
    </body>
</html>
