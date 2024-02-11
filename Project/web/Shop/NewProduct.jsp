<%-- 
    Document   : NewProduct
    Created on : 11 Mar, 2022, 3:15:54 PM
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
        <title>Add Product</title>
        <link rel="stylesheet" href="form.css">
        <script src="../Assets/JQ/jQuery.js"></script>
        <script>
            function getProduct(did)
            {
                    //alert(did);
                    $.ajax({
                    url: "../Assets/Ajaxpages/AjaxProduct.jsp?did="+did,
                      success: function(html){
                            $("#place").html(html);
                      }
                    });
            }
        </script>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <%
            if (request.getParameter("btnsave") != null) 
            {
                String selc = "select * from tbl_shopproduct where product_id='" + request.getParameter("pro") + "' and shop_id='"+session.getAttribute("shopid")+"'";
                    ResultSet rsc = con.selectCommand(selc);
                    if (rsc.next()) {
        %>
        <script>alert('Already Exist')</script>
        <%
                    } else {

                        String ins = "insert into tbl_shopproduct(product_id,shop_id,sproduct_rate) values ('" + request.getParameter("pro") + "','"+session.getAttribute("shopid")+"','" + request.getParameter("prate") + "')";
                        con.executeCommand(ins);
                    }
            }
             if (request.getParameter("did") != null) {
                String del = "delete from tbl_shopproduct where sproduct_id='" + request.getParameter("did") + "'";
                con.executeCommand(del);
                response.sendRedirect("NewProduct.jsp");
            }
    %>
        <h1>New Product</h1>
        
         <div id="tab">
        <form name="frmptype" method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
                <tr>
                    <td>Product Category</td>
                    <td>
                        <select name="procat" required onchange="getProduct(this.value)">
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
                    <td>
                        <select name="pro" id="place" required>
                            <option value="" selected>--Select--</option>
                          
                        </select>    
                    </td>
                </tr> 
                <tr>
                    <td>Rate</td>
                    <td>
                        <input type="text" name="prate" required>
                    </td>
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
                    <td>Action</td>
                </tr>
                <%
            String st="select * from tbl_shopproduct p inner join tbl_product s on p.product_id=s.product_id inner join tbl_productcategory d on s.pcategory_id=d.pcategory_id where shop_id='"+session.getAttribute("shopid")+"'";
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
                    <a href="NewProduct.jsp?did=<%=rs.getString("sproduct_id")%>">Delete</a> /<a href="ProductStock.jsp?pid=<%=rs.getString("sproduct_id")%>">Add Stock</a>/<a href="Gallery.jsp?pid=<%=rs.getString("sproduct_id")%>">Add Gallery</a>
                </td>
            </tr>
            <%
                    }
            %> 
            </table>
        </form>
         </div>
    </body>
    <br>  <br>  <br>  <br>  <br>  <br>  <br>
    <%@include file="Foot.jsp" %>
</html>
