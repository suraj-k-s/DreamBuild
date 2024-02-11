<%-- 
    Document   : ViewProducts
    Created on : 13 Mar, 2022, 12:14:03 PM
    Author     : asanj
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <%//@include file="SessionValidator.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Products</title>
        <link rel="stylesheet" href="form.css">
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            .custom-alert-box{
                width: 20%;
                height: 10%;
                position: fixed;
                bottom: 0;
                right: 0;
                left: auto;
            }

            .success {
                color: #3c763d;
                background-color: #dff0d8;
                border-color: #d6e9c6;
                display: none;
            }

            .failure {
                color: #a94442;
                background-color: #f2dede;
                border-color: #ebccd1;
                display: none;
            }

            .warning {
                color: #8a6d3b;
                background-color: #fcf8e3;
                border-color: #faebcc;
                display: none;
            }
        </style>
    </head>
    <body>
        <%@include file="Head.jsp" %>
         <div class="custom-alert-box">
            <div class="alert-box success">Successful Added to Cart !!!</div>
            <div class="alert-box failure">Failed to Add Cart !!!</div>
            <div class="alert-box warning">Already Added to Cart !!!</div>
        </div>
        <h1>View Products</h1>
         <div id="tab">
        <div id="search">
                        <table>
                            
                            <tr>
                                <%
                                String sel="select * from tbl_shop p inner join tbl_shopproduct w on p.shop_id=w.shop_id inner join tbl_product d on d.product_id=w.product_id inner join tbl_productcategory pc on d.pcategory_id=pc.pcategory_id inner join tbl_sproductstock ss on w.sproduct_id=ss.sproduct_id where p.shop_id='"+request.getParameter("sid")+"'";
                                ResultSet rw=con.selectCommand(sel);
                                
                                int i=0;
                                while(rw.next())
                                {  
                                    
                                i++;
                            %>
                            <td><p style="text-align:center;border:1px solid #999;margin:22px;padding:10px">
                                    <img src="../Assets/Product/<%=rw.getString("product_image")%>" width="100" height="100"><br>
                                    Product:<%=rw.getString("product_name")%><br>
                                    Category:<%=rw.getString("pcategory_name")%><br>
                                    Rate:<%=rw.getString("sproduct_rate")%><br>
                                    Stock:<%=rw.getString("sproduct_qty")%><br>
                                    <br>
                                    <a href="ViewProductGallery.jsp?gid=<%=rw.getString("sproduct_id")%>">View Gallery</a>
                                     <br>
                                <%
                                    String stock = "select sum(sproduct_qty) as stock from tbl_sproductstock where sproduct_id = '" + rw.getString("sproduct_id") + "'";
                                    ResultSet rsST = con.selectCommand(stock);
                                    rsST.next();
                                    if (rsST.getString("stock") != null) {
                                        int stocks = Integer.parseInt(rsST.getString("stock"));
                                        if (stocks > 0) {
                                %>
                                <a href="javascript:void(0)" onclick="addCart('<%=rw.getString("sproduct_id")%>')" class="btn btn-success btn-block">Add to Cart</a>
                                <%
                                } else if (stocks == 0) {
                                %>
                                <a href="javascript:void(0)" class="btn btn-danger btn-block">Out of Stock</a>
                                <%
                                    }
                                } else {
                                %>
                                <a href="javascript:void(0)" class="btn btn-warning btn-block">Stock Not Found</a>
                                <%
                                    }
                                %>
                                  </p>                                                                  
                        </td>

                        <%
                            if (i == 4) {
                        %>
                    </tr>
                    <tr>
                        <%
                                i=0;
                                }
                            }

                        %>
                    </tr>

                        </table>
                        </div>
         </div>
    </body>
    <br>  <br>  <br>  <br>  <br>  <br>  <br>
    <%@include file="Foot.jsp" %>
</html>
<script src="../Assets/JQ/jQuery.js"></script>
<script>
     function addCart(id)
                                    {
                                        $.ajax({
                                            url: "../Assets/Ajaxpages/Ajaxaddcart.jsp?id=" + id,
                                            success: function(response) {
                                                if (response.trim() === "Added to Cart")
                                                {
                                                    $("div.success").fadeIn(300).delay(1500).fadeOut(400);
                                                }
                                                else if (response.trim() === "Already Added to Cart")
                                                {
                                                    $("div.warning").fadeIn(300).delay(1500).fadeOut(400);
                                                }
                                                else
                                                {
                                                    $("div.failure").fadeIn(300).delay(1500).fadeOut(400);
                                                }
                                            }
                                        });
                                    }

</script>
