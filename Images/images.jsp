<%-- 
    Document   : images
    Created on : May 14, 2018, 6:58:14 PM
    Author     : saru
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <input type="file" name="pic">
             <% 
          String myemail="",member="";
          try
         { 
              myemail=(String)session.getAttribute("email");
              member=(String)session.getAttribute("member");
      
    if(myemail==null)
                           {
                response.sendRedirect("../index.jsp");
            }
} catch (Exception e)
      {
                response.sendRedirect("../index.jsp");

}
%>
     <%  ServletContext s=getServletContext();
            
            String path=s.getRealPath("\\");
            
            MultipartRequest mr=new MultipartRequest(request, path, 100*1024*1024);
            
           
           
           String fileName=mr.getFilesystemName("pic");
           
           if(fileName==null)
                             {
               fileName="../pictures/sold.png";
           }
           
           String filePath=path+fileName;
           
           File f=new File(filePath);
           
           FileInputStream fis=new FileInputStream(f);
           
           int len=fis.available();
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "");
           PreparedStatement ps=con.prepareStatement("insert into image(fid,filename,filetype,filedata) values(?,?,?,?)");
          ps.setString(1,myemail);
           ps.setString(2, fileName);
           ps.setString(3, s.getMimeType(fileName));
           ps.setBinaryStream(4, fis, len);
           
           //to get the posted time%>
    </body>
</html>
