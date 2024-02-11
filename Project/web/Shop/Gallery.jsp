<%-- 
    Document   : Gallery
    Created on : 13 Mar, 2022, 10:52:01 AM
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
        <title>Product Gallery</title>
        <link rel="stylesheet" href="form.css">
    </head>
    <%
    session.setAttribute("pid", request.getParameter("pid"));
    %>
    <body>
        <%@include file="Head.jsp" %>
        <h1>Product Gallery</h1>
        <br>
         <div id="tab">
        <form name="frmeditprofile" method="post" action="../Assets/Actionpages/ProductGalleryAction.jsp" enctype="multipart/form-data">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
               <tr>
                    <td>Gallery</td>
                    <td><input type="file" name="image" required multiple="multiple"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="SAVE">
                        <input type="reset" name="btncancel" value="CANCEL">
                    </td>
                </tr>
            </table>
        </form>
         </div>
    </body>
    <br>  <br>  <br>  <br>  <br>  <br>  <br>
    <%@include file="Foot.jsp" %>
</html>
