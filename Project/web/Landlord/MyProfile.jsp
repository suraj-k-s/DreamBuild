<%-- 
    Document   : MyProfile
    Created on : 26 Jan, 2022, 3:08:08 PM
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
        <title>MyProfile</title>
        <link rel="stylesheet" href="form.css">
    </head>
    <body>
         <%@include file="Head.jsp" %>
        <h1>My Profile</h1>
        
        <div id="tab">
        <table>
            <%
                String sel="select * from tbl_landlord where landlord_id='"+session.getAttribute("landlordid")+"'";
                ResultSet rs=con.selectCommand(sel);
                if(rs.next())
                {
                %>
                <tr>
               
                    <td colspan="2" align="center"><img width="200" height="100" src="../Assets/Landlord/<%=rs.getString("landlord_photo") %>"></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><%=rs.getString("landlord_name") %></td>
            </tr>
            <tr>
                <td>Contact </td>
                <td><%=rs.getString("landlord_contact") %></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><%=rs.getString("landlord_email") %></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><%=rs.getString("landlord_address") %></td>
            </tr>
            <%}%>
        </table>
        </div>
    </body>
    <br>  <br>  <br>  <br>  <br>  <br>  <br>
    <%@include file="Foot.jsp" %>
</html>



