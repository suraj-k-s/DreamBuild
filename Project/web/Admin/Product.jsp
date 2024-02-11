<%-- 
    Document   : Product
    Created on : 11 Mar, 2022, 1:52:16 PM
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
        <title>Product</title>
         <link rel="stylesheet" href="form.css">
        <%@include file="Header.jsp" %>
    </head>
    <body>
           <%
            
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_product where product_id='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("Product.jsp");
            }
            
        %>
        <div id="tab">
        <h1>Place</h1>
        <br>
        
        <br>
        <br>
        <form name="frmproduct" method="post" action="../Assets/Actionpages/ProductUploadAction.jsp" enctype="multipart/form-data">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
                <tr>
                    <td>Product Category</td>
                    <td>
                        <select name="procat" required>
                            <option value="" selected>--Select--</option>
                            <%
            String s="select * from tbl_productcategory";
            ResultSet r=con.selectCommand(s);
           
            while(r.next())
            {
               
            
            %>
                            <option value="<%=r.getString("pcategory_id")%>"><%=r.getString("pcategory_name") %></option>
                            <%
                    }
            %>
                        </select>    
                    </td>
                </tr>    
                <tr>
                    <td>Product</td>
                    <td><input type="text" name="txtpro" value="<%%>" required></td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td><input type="file" name="image"  required></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="SAVE">
                        <input type="submit" name="btncancel" value="CANCEL">
                    </td>
                </tr>  
            </table>
                <hr>
                <br>
            <table border="1" align="center" cellpadding="10">
            <tr>
                <td>Sl.No</td>
                <td>Product Category</td>
                <td>Product</td>
                <td>Photo</td>
                <td>Action</td>
            </tr>
            <%
            String st="select * from tbl_product p inner join tbl_productcategory d on p.pcategory_id=d.pcategory_id";
            ResultSet rs=con.selectCommand(st);
            int f=0;
            while(rs.next())
            {
                f++;
            
            %>
            <tr>
                <td><%=f%></td>
                <td><%=rs.getString("pcategory_name") %></td>
                <td>
                    <%=rs.getString("product_name") %>
                </td>
                <td>
                    <img src="../Assets/Product/<%=rs.getString("product_image")%>" width="75" height="75">
                </td>
                <td>
                    <a href="Product.jsp?did=<%=rs.getString("product_id")%>">Delete</a> 
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
