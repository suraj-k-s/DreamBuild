<%-- 
    Document   : ProductStock
    Created on : 13 Mar, 2022, 11:33:07 AM
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
        <title>Product Stock</title>
        <link rel="stylesheet" href="form.css">
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <%
        session.setAttribute("pid", request.getParameter("pid"));
        if(request.getParameter("btnsave")!=null)
            {
             String selu="select * from tbl_sproductstock where sproduct_id='"+session.getAttribute("pid")+"' ";
                ResultSet rs=con.selectCommand(selu);   
                if(rs.next())
                {
                    String up="update tbl_sproductstock set sproduct_qty='"+rs.getString("sproduct_qty")+"' + '" + request.getParameter("txtstock") + "' where sproduct_id='"+session.getAttribute("pid")+"' ";
                    //out.println(up);
                    con.executeCommand(up);
                }
                else
                {
                    String ins = "insert into tbl_sproductstock(sproduct_qty,sproduct_id) values ('" + request.getParameter("txtstock") + "','"+session.getAttribute("pid")+"')";
                    //out.println(ins);
                    con.executeCommand(ins);
                }
            }
        %>
        <h1>Product Stock</h1>
         <div id="tab">
        <form name="frmpstock" method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
                <tr>
                    <td>Stock</td>
                    <td><input type="text" name="txtstock" value="" required></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="SAVE">
                        <input type="submit" name="btncancel" value="CANCEL">
                    </td>
                </tr>  
            </table>
        </form>
         </div>
    </body>
    <br>  <br>  <br>  <br>  <br>  <br>  <br>
    <%@include file="Foot.jsp" %>
</html>
