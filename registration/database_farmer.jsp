<%-- 
    Document   : database_farmer
    Created on : Apr 11, 2018, 5:54:33 AM
    Author     : saru
--%>


<%@page import="java.util.Random"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%
            String name=request.getParameter("fullname");
            String email=request.getParameter("email");
            String number=request.getParameter("phonenumber");
            String type=request.getParameter("ctype");
            String str="";
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
            if(type.toLowerCase().equals("farmer"))
            {
                   str="select * from farmers_details as f,wholesalers_details as w where f.email=? or f.farmers_phone=? or w.email=? or w.wholesalers_number=? ";
            }
            if(type.toLowerCase().equals("wholesaler"))
            {
                   str="select * from farmers_details as f, wholesalers_details as w where w.email=? or w.wholesalers_number=? or f.email=? or f.farmers_phone=?";
            }
                     if(str!="") 
                     {

                       PreparedStatement ps=con.prepareStatement(str);

                       ps.setString(1, email);
                       ps.setString(2, number);
                       ps.setString(3, email);
                        ps.setString(4, number);




                       int rowCount=0;

                       ResultSet rs=ps.executeQuery();

                       while(rs.next())
                          {
                                rowCount=rs.getRow();
                          }

                       if(rowCount>0)
                          {
                           
                     
                                   if(type.toLowerCase().equals("farmer"))
                                    {
                                     String myres="Email or Phone_number is already Present,Try signing in as farmer";  
                  
                                      session.setAttribute("myres", myres);
                                      response.sendRedirect("../farmer_login/first_page.jsp");
                                        
                        
                                   
                                    }                 

    
                                  if(type.toLowerCase().equals("wholesaler"))
                                    {
                                      String myres="Email or Phone_number is already Present,Try signing in as wholesaler";
                                      session.setAttribute("myres", myres);
                                      response.sendRedirect("../wholesalers_login/first_page.jsp");


                                    }                 

%>
                               </div>      


                <%         }
                        else
                            {
                                    String str1="";
                                    if(type.toLowerCase().equals("farmer"))
                                    {
                                             str1="insert into farmers_details (farmers_name,farmers_phone,email)values (?,?,?)";
                                    }
                                    if(type.toLowerCase().equals("wholesaler"))
                                    {
                                             str1="insert into wholesalers_details (wholesalers_name,wholesalers_number,email)values (?,?,?)";
                                    }


                                    if(str1!="")
                                    {     

                                            PreparedStatement ps1=con.prepareStatement(str1);

                                            ps1.setString(1, name);
                                            ps1.setString(2, number);
                                            ps1.setString(3, email);

                                            int i=ps1.executeUpdate();

                                            if(i>0)
                                                {
                                                    String s1="";
                                                     String numbers = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
 
                                                    // Using random method
                                                    Random rndm_method = new Random();

                                                    char[] otp = new char[4];

                                                    for (int j=0; j< 4; j++)
                                                    {
                                                        // Use of charAt() method : to get character value
                                                        // Use of nextInt() as it is scanning the value as int
                                                        otp[j] =numbers.charAt(rndm_method.nextInt(numbers.length()));
                                                    }
                                                    String x = String.valueOf(otp);
                                                    
                                                    if(type.toLowerCase().equals("farmer"))
                                                    {
                                                            s1="update farmers_details set farmers_otp=? where email=? ";
                                                    }
                                                    if(type.toLowerCase().equals("wholesaler"))
                                                    {
                                                            s1="update wholesalers_details set wholesalers_otp=? where email=? ";
                                                    }
                                                    if(s1!="")
                                                    {
                                                        PreparedStatement ps2=con.prepareStatement(s1);
                                                        ps2.setString(1, x);
                                                        ps2.setString(2, email);

                                                        ps2.executeUpdate();


                                                        final String from="sa8052589@gmail.com";
                                                        final String password="whattodo12";
                                                        String to=email;
                                                        String sub="OTP";
                                                        String msg="Otp is "+x;

                                                        Properties props = new Properties();    
                                                        props.put("mail.smtp.host", "smtp.gmail.com");    
                                                        props.put("mail.smtp.socketFactory.port", "465");    
                                                        props.put("mail.smtp.socketFactory.class",    
                                                                  "javax.net.ssl.SSLSocketFactory");    
                                                        props.put("mail.smtp.auth", "true");    
                                                        props.put("mail.smtp.port", "465");    
                                                        //get Session   
                                                        Session s =  Session.getInstance(props,    
                                                         new javax.mail.Authenticator() 
                                                        {    
                                                         protected PasswordAuthentication getPasswordAuthentication() {    
                                                         return new PasswordAuthentication(from,password);  
                                                         }    
                                                         });    
                                                        //compose message    
                                                        try {    
                                                         MimeMessage message = new MimeMessage(s);    
                                                         message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
                                                         message.setSubject(sub);    
                                                         message.setText(msg);    
                                                         //send message  
                                                         Transport.send(message);    
                                                         System.out.println("message sent successfully");    
                                                         } catch (MessagingException e) {throw new RuntimeException(e);}    

                                 %>
                            
                         <%    if(type.toLowerCase().equals("farmer"))
                                {
                               
                               String myres="Regestration Successfull,login in with your Email and OTP as Farmer";
                                      session.setAttribute("signin", myres);
                                      response.sendRedirect("../farmer_login/first_page.jsp");
                            }
            if(type.toLowerCase().equals("wholesaler"))
                                     {                              
        
                               String myres="Regestration Successfull,login in with your Email and OTP as Wholesaler";
                                 session.setAttribute("signin", myres);

                                response.sendRedirect("../wholesalers_login/first_page.jsp");
                         }
                                                        }
                                            }
                                    }
                        }
                }
            else
            {
                %>
                <h1>technical error</h1> 
        
        <%
            }




                                 %>

       
        
    </body>
</html>
