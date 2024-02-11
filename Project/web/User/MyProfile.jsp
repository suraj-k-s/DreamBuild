<%-- 
    Document   : MyProfile
    Created on : 26 Jan, 2022, 2:07:20 PM
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
        <table align="center">
            <%
                String sel="select * from tbl_user where user_id='"+session.getAttribute("userid")+"'";
                ResultSet rs=con.selectCommand(sel);
                if(rs.next())
                {
                %>
                <tr>
               
                    <td colspan="2" align="center"><img width="200" height="300" src="../Assets/User/<%=rs.getString("user_photo") %>"></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><%=rs.getString("user_name") %></td>
            </tr>
            <tr>
                <td>Contact </td>
                <td><%=rs.getString("user_contact") %></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><%=rs.getString("user_email") %></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><%=rs.getString("user_address") %></td>
            </tr>
            <%}%>
        </table>
         </div>
    </body>
    <br>  <br>  <br>  <br>  <br>  <br>  <br>
    <%@include file="Foot.jsp" %>
</html>


