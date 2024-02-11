<%-- 
    Document   : ViewProductGallery
    Created on : 13 Mar, 2022, 3:07:26 PM
    Author     : asanj
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <%@include file="SessionValidator.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Product Gallery</title>
        <link rel="stylesheet" href="form.css">
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <h1></h1>
         <div id="tab">
        <div id="search">
                        <table>
                            
                            <tr>
                                <%
                                String sel="select * from tbl_sproductgallery where sproduct_id='"+request.getParameter("gid")+"'";
                                ResultSet rw=con.selectCommand(sel);
                                
                                int i=0;
                                while(rw.next())
                                {  
                                    
                                i++;
                            %>
                            <td><p style="text-align:center;border:1px solid #999;margin:22px;padding:10px">
                                    <img src="../Assets/Product/<%=rw.getString("gallery_image")%>" width="100" height="100"><br>
                                    <%
                            if(i%4==0){
                                out.println("</tr>");
                                
                                out.println("<tr>");
                                i=0;
                            }
                                }
                            %>
       
              </table>
                        </div>
         </div>
         </body>
    <br>  <br>  <br>  <br>  <br>  <br>  <br>
    <%@include file="Foot.jsp" %>
</html>
