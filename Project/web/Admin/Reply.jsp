<%-- 
    Document   : District
    Created on : 26 Jan, 2022, 2:03:09 PM
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
        <title>Dream Build::District</title>
         <link rel="stylesheet" href="form.css">
       
        <%@include file="Header.jsp" %>
    </head>
    <body>
        
        <%
            if (request.getParameter("btnsave") != null) {
                
               
                    String up = "update tbl_complaints set complaint_reply='" + request.getParameter("txt_reply") + "',complaint_status=1 where complaint_id='" + request.getParameter("did") + "'";
                    con.executeCommand(up);
                    response.sendRedirect("ViewComplaints.jsp");
               
            }
        %>
        <h1>District</h1>
        <br>
        
        <br>
        <br>
        <div id="tab">
        <form name="frmdistrict" method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
                <tr>
                    <td>Reply</td>
                    <td><input type="text" name="txt_reply" required >
                        <div id="name"></div></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="SAVE">
                        <input type="reset" name="btncancel" value="CANCEL">
                    </td>
                </tr>  
            </table>
            <hr>
            <br>
        </form>
        </div>
    </body>
    <br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>

