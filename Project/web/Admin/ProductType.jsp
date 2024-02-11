<%-- 
    Document   : ProductType
    Created on : 11 Mar, 2022, 12:35:18 PM
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
        <title>Dream Build::Product types</title>
         <link rel="stylesheet" href="form.css">
        <%@include file="Header.jsp" %>
    </head>
    <body>
        <%
            String eid = "", ename = "";
            if (request.getParameter("btnsave") != null) {
                String d = "";
                d = request.getParameter("txtptype");
                if (request.getParameter("eid") != null) {
                    String up = "update tbl_productcategory set pcategory_name='" + d + "' where pcategory_id='" + request.getParameter("txtid") + "'";
                    con.executeCommand(up);
                    response.sendRedirect("ProductType.jsp");
                } else {
                    String selc = "select * from tbl_productcategory where pcategory_name='" + d + "'";
                    ResultSet rsc = con.selectCommand(selc);
                    if (rsc.next()) {
        %>
        <script>alert('Already Exist')</script>
        <%
                    } else {

                        String ins = "insert into tbl_productcategory(pcategory_name) values ('" + d + "')";
                        con.executeCommand(ins);
                    }
                }
            }
            if (request.getParameter("did") != null) {
                String del = "delete from tbl_productcategory where pcategory_id='" + request.getParameter("did") + "'";
                con.executeCommand(del);
                response.sendRedirect("ProductType.jsp");
            }
            if (request.getParameter("eid") != null) {
                String sel1 = "select * from tbl_productcategory where pcategory_id='" + request.getParameter("eid") + "'";
                ResultSet rs1 = con.selectCommand(sel1);
                if (rs1.next()) {
                    eid = rs1.getString("pcategory_id");
                    ename = rs1.getString("pcategory_name");
                }
            }
        %>
        <div id="tab">
        <h1>Product Category</h1>
        <br>
       
        <br>
        <br>
        
        <form name="frmptype" method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
                <input type="hidden" name="txtid" value="<%=eid%>">
                <tr>
                    <td>Product Category</td>
                    <td><input type="text" name="txtptype" value="<%=ename%>" required></td>
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
            <table border="1" align="center" cellpadding="10">
                <tr>
                    <td>Sl.No</td>
                    <td>Product Category</td>
                    <td>Action</td>
                </tr>
                <%
                    String s = "select * from tbl_productcategory";
                    ResultSet r = con.selectCommand(s);
                    int i = 0;
                    while (r.next()) {
                        i++;

                %>
                <tr>
                    <td><%=i%></td>
                    <td>
                        <%=r.getString("pcategory_name")%>
                    </td>
                    <td>
                        <a href="ProductType.jsp?did=<%=r.getString("pcategory_id")%>">Delete</a> | <a href="ProductType.jsp?eid=<%=r.getString("pcategory_id")%>">Edit</a>
                    </td>
                </tr>
                <%
                    }
                %> 
            </table>
        </form>
        </div>
    </body>
    <%@include file="Footer.jsp" %>
</html>

