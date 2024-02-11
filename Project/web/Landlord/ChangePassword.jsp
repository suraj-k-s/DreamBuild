<%-- 
    Document   : ChangePassword
    Created on : 26 Jan, 2022, 3:11:29 PM
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
        <title>ChangePassword</title>
        <link rel="stylesheet" href="form.css">
    </head>
    <body>
        <%@include file="Head.jsp" %>
               <%
                if(request.getParameter("btnsave")!=null)
            {
                String selu="select *  from tbl_landlord where landlord_id='"+session.getAttribute("landlordid")+"' and landlord_password='"+request.getParameter("txtpwd")+"'";
                ResultSet rsd=con.selectCommand(selu);
                if(rsd.next())
                {
                if((request.getParameter("txtpwd1")).equals(request.getParameter("txtpwd2")))
                {
               String up="update tbl_landlord set landlord_password='"+request.getParameter("txtpwd1")+"' where landlord_id='"+session.getAttribute("landlordid")+"' ";
                con.executeCommand(up); 
                response.sendRedirect("ChangePassword.jsp"); 
                }
                else
                {
                 %>
                    <script>alert('Password mismatch')</script>
                    <%   
                }
                }
                else
                {
                   %>
                    <script>alert('Wrong Current Password')</script>
                    <%  
                }
            }
                %>
        <h1>Change Password</h1>
        
        <div id="tab">
        <form method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
                <tr>
                   <td>Current Password</td>
                    <td><input type="password" name="txtpwd"  required></td>
                </tr>
                <tr>
                   <td>New Password</td>
                    <td><input type="password" name="txtpwd1" required></td>
                </tr>
                <tr>
                   <td>Confirm Password</td>
                    <td><input type="password" name="txtpwd2" required></td>
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



