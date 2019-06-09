<%-- 
    Document   : profile
    Created on : Apr 14, 2018, 2:57:21 PM
    Author     : saru
--%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta name="viewport" content="initial-scale=1, user-scalable=no">
    <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" type="text/css" href="../css/new.css">
         <link rel="stylesheet" type="text/css" href="../css/profile.css">
      
    </head>
    <body background="back.jpg">
        <div class="hea clear">
            <%@include file="../head.jsp" %>
            
            
        </div>
                  <div >
            
           
        <div class="continer clear">
      
                   <%   String member="",myemail="";
                            
         try
         {
                        member=(String)session.getAttribute("member");
                       myemail=(String)session.getAttribute("email");
     
        if(myemail==null)
            {
                response.sendRedirect("../index.jsp");
            }
          } catch (Exception e)
      
          {
                response.sendRedirect("../index.jsp");
           }


                 Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
                String str="",str1="",str2="",str3="",str4="",str5="",str6="";
                if(member.equalsIgnoreCase("farmer")){
                str="select id as id,farmers_name as name,farmers_phone as phone,email as mail,latitude as la,longitude as lg from farmers_details where email=? ";
                   str1="select count(*) from farmers_crops where farmers_key=?"    ;        
                   str3="select count(*) from farmers_crops where farmers_key=? and status=1"    ;        
                   str6="select count(*) from farmers_crops where farmers_key=? and status=2"    ;        
                   str4="select count(*) from notification where subject=? "    ;    
                   str5="Select count(*) from notification where actor=?";
                   str2="select count(*) from farmers_crops where farmers_key=? and status=0"    ;        }
                if(member.equalsIgnoreCase("wholesaler")){
                str="select id as id,wholesalers_name as name,wholesalers_number as phone,email as mail,latitude as la,longitude as lg from wholesalers_details where email=? ";
                    str1="select count(*) from wholesalers_crops where wholesalers_key=?"    ;            
                    str3="select count(*) from wholesalers_crops where wholesalers_key=? and status=1"    ;  
                    str6="select count(*) from wholesalers_crops where wholesalers_key=? and status=2"    ;  
                   str4="select count(*) from notification where subject=? "    ;             
                   str5="Select count(*) from notification where actor=?";
                   str2="select count(*) from wholesalers_crops where wholesalers_key=? and status=0"    ;            }
                if(str!="" && str.length()!=0){
                PreparedStatement ps=con.prepareStatement(str);
                PreparedStatement ps1=con.prepareStatement(str1);
                PreparedStatement ps2=con.prepareStatement(str2);
                PreparedStatement ps3=con.prepareStatement(str3);
                PreparedStatement ps4=con.prepareStatement(str4);
                PreparedStatement ps5=con.prepareStatement(str5);
                PreparedStatement ps6=con.prepareStatement(str6);
                
            ps.setString(1, myemail);   
            ps1.setString(1, myemail);   
            ps2.setString(1, myemail);   
            ps3.setString(1, myemail);   
            ps4.setString(1, myemail);   
            ps5.setString(1, myemail);   
            ps6.setString(1, myemail);   
                     //System.out.println("laka1");

            
            
            ResultSet rs=ps.executeQuery();
            ResultSet rs1=ps1.executeQuery();
            ResultSet rs2=ps2.executeQuery();
            ResultSet rs3=ps3.executeQuery();
            ResultSet rs4=ps4.executeQuery();
            ResultSet rs5=ps5.executeQuery();
            ResultSet rs6=ps6.executeQuery();
            String countadded="",countdeleted="",countforsearch="",countnotify="",countrequest="",countsold="";
            int rowCount=0;
            
            %>
            
            <%
             while(rs5.next())
                               {
            countrequest=rs5.getString(1);
            
            }
            %>
            <%
            while(rs4.next())
                               {
            countnotify=rs4.getString(1);
            
            }
            %>
            <%
             while(rs3.next())
                               {
            countforsearch=rs3.getString(1);
            
            }
            %>
            <%
            while(rs2.next())
                               {
            countdeleted=rs2.getString(1);
            
            }
            %>
            <%
            while(rs6.next())
                               {
            countsold=rs6.getString(1);
            
            }
            %>
            
          
            <%
            while(rs.next())
            {
                         

            
                rowCount=rs.getRow();
                int id=rs.getInt("id");
                String name=rs.getString("name");
                String phone=rs.getString("phone");
                String mail=rs.getString("mail");
                String la=rs.getString("la");
                String ln=rs.getString("lg");
                
               
                
                %>  
                <div class="profile ">
                    
   <!--
   <div id="picture "> 
       <input type="file" id="file1" style="">
       <a  href="" onclick="openDialog();return;">
           <img border="0"  src="../pictures/profile.png" width="200" height="200" >
       </a>
   </div>
   -->
   <% 
                   
   String strQuery = "SELECT COUNT(*) FROM image where fid=?";
   PreparedStatement pas=con.prepareStatement(strQuery);
pas.setString(1,myemail);
ResultSet ses = pas.executeQuery();
String Countrow="";
while(ses.next()){
Countrow = ses.getString(1);

}

   System.out.println(Countrow);
if(Integer.parseInt(Countrow)==0)
       {
        %>
   <form action="" method="post" enctype="multipart/form-data"  onsubmit="return validateForm()">
   <input type="file"  id="file1" name="file1" style="display:none;"  />
   <label for="file1"><img src="../pictures/profile.png" width="200" height="200"/></label>   
   <input type="submit" value="Upload"/>               
   </form><%
}
  else
  {
      
    
    //to rertieve data
   
        
           
        String s="select * from image where fid=?";
        
        PreparedStatement pres=con.prepareStatement(s);
        pres.setString(1,myemail);
        ResultSet res=pres.executeQuery();
        
        while(res.next())
                       {
            
            String ftype=res.getString("filetype");
            
           
        %>
            
      
                                    <%
                                        if(ftype.equals("image/jpg") || ftype.equals("image/jpeg") ||ftype.equals("image/png"))
                                                                                       {
                                    %>
                                    
                                    <div class="imag" ><img src="../displayimage?msg=<%=myemail%>" width="150"/>     
                                    </div>
                                    <%
                                                                       }
                       
                                           }
  }           
                        
                %>
         
   
   
   
                    <ul>
                        <li>You are a <%=member%></li>
                        <li>Id:<%=id%></li>
                        <li>Name:<%=name%></li>
                        <li>Phone_number:<%=phone%></li>
                        <li>Email-id:<%=mail%></li>
                        <li>Latitude:<%=la%></li>
                        <li>Longitude:<%=ln%></li>
                        
                    </ul>
                </div>
        </div>>
                        <div class="detailscon">
                
                    <span>
                        Your Details Till Now-
                    </span>
                            <div class="details clear">
            <ul>
                <li>total number of crops sold:<%=countsold%>   </li>
                <li> total number of request made:<%=countrequest%>  </li>  
                <li>total number of notifications:<%=countnotify%> </li>   
                <li>total number of crops for search currently:<%=countforsearch%>  </li>
                <li>total number of crops deleted:<%=countdeleted%></li>    
                <li> total number of crops added:<%=countadded%>   </li>
            </ul>
            </div>
                        </div>
                
                <%
                
}
       }
%>
        </div>
                 
        <%
   
    if("post".equalsIgnoreCase(request.getMethod()))
               {
        
                

        ServletContext sc=getServletContext();
        
        String dir=sc.getRealPath("\\");
        
        MultipartRequest mr=new MultipartRequest(request, dir, 20*1024*1024);
        
        String fileName=mr.getFilesystemName("file1");
        
        String filePath=dir+fileName;
        File f=new File(filePath);
           
           FileInputStream fis=new FileInputStream(f);
           
           int len=fis.available();
           Class.forName("com.mysql.jdbc.Driver");
           
           PreparedStatement press=con.prepareStatement("insert into image(fid,filename,filetype,filedata) values(?,?,?,?)");
          press.setString(1,myemail);
           press.setString(2, fileName);
           press.setString(3, sc.getMimeType(fileName));
           press.setBinaryStream(4, fis, len);
           
       
        
        System.out.println(fileName);
        System.out.println(filePath);
        
    
   
   
    int i=press.executeUpdate();
           
           if(i>0)
                             {
              %>
               
               <center>
                   <font color="green"><b>Posted SUccessfully!</b></font>
               </center>
               
               
               <%
               
           }
              }
            
    %>
     
     
            
    <div class="mapcss">
        <br><br>
        <span>Enter you're current location: </span>
    <input id="pac-input" class="controls" type="text" placeholder="Search Box" >
    <div id="map"></div>
      
     <form action="latlng-db.jsp" method="get">
  <input type="hidden" id="lat" name="la" value="l"><br>
  <input type="hidden" id="lng" name="ln" value="n"><br>
  <input id="submit" type="submit" value="Submit">
</form> 
   
    </div>
    <script>
      // This example adds a search box to a map, using the Google Place Autocomplete
      // feature. People can enter geographical searches. The search box will return a
      // pick list containing a mix of places and predicted search terms.

      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

        
        
        
        
      function initAutocomplete() {
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -33.8688, lng: 151.2195},
          zoom: 16,
          mapTypeId: 'roadmap'
        });
        

        // Create the search box and link it to the UI element.
        var input = document.getElementById('pac-input');
        var searchBox = new google.maps.places.SearchBox(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

    
        // Bias the SearchBox results towards current map's viewport.
        map.addListener('bounds_changed', function() {
          searchBox.setBounds(map.getBounds());
        });

        var markers = [];
        // Listen for the event fired when the user selects a prediction and retrieve
        // more details for that place.
        searchBox.addListener('places_changed', function() {
          var places = searchBox.getPlaces();
          
          if (places.length == 0) {
            return;
          }
          

          // Clear out the old markers.
          markers.forEach(function(marker) {
            marker.setMap(null);
          });
          markers = [];

          // For each place, get the icon, name and location.
          var bounds = new google.maps.LatLngBounds();
          places.forEach(function(place) {
            if (!place.geometry) {
              console.log("Returned place contains no geometry");
              return;
            }
            var icon = {
              url: place.icon,
              size: new google.maps.Size(71, 71),
              origin: new google.maps.Point(0, 0),
              anchor: new google.maps.Point(17, 34),
              scaledSize: new google.maps.Size(25, 25)
            };
       

            // Create a marker for each place.
            markers.push(new google.maps.Marker({
              map: map,
              icon: icon,
              title: place.name,
              position: place.geometry.location
              
              
            }));
            
           
            document.getElementById('lat').value = place.geometry.location.lat();
            document.getElementById('lng').value = place.geometry.location.lng();
            
            if (place.geometry.viewport) {
              // Only geocodes have viewport.
              bounds.union(place.geometry.viewport);
            } else {
              bounds.extend(place.geometry.location);
            }
          });
          map.fitBounds(bounds);
              
        });
      }
       
           
           
    </script>
  
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDtnmAbJkQ0OGmvlPeqva6t7f6n8-Ei6Dg&libraries=places&callback=initAutocomplete"
  type="text/javascript"></script>
  <script>
function openDialog()
{
document.getElementById("file1").click();
}
</script>
        
    </body>
</html>
