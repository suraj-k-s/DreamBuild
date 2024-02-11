<%-- 
    Document   : ViewUserBookings
    Created on : 17 Apr, 2022, 10:43:21 AM
    Author     : asanj
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Orders</title>
         <link rel="stylesheet" href="form.css">
        <style>
            .red{
                text-align: center;
                color: red;
            }
            .green{
                text-align: center;
                color: yellowgreen;
                
            }
            .orange{
                text-align: center;
                color: orange;
            }
        </style>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <%
            if(request.getParameter("cid")!=null){
                String up="update tbl_carthead set delivery_status=1 where cart_id='"+request.getParameter("cid")+"'";
                con.executeCommand(up);
                response.sendRedirect("ViewUserBookings.jsp");
            }
        %>
        <div id="tab">
        <form method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
                <tr>
                    <th>Sl.No</th>
                    <th>Product Name</th>
                    <th>Booked Quantity</th>
                    <th>Customer Name</th>
                    <th>Order Address</th>
                     <th>Payment Status</th>
                    
                </tr>
                <%
                    String sel="select * from tbl_cartbody cb inner join tbl_carthead ch on ch.cart_id=cb.cart_id inner join tbl_user u on u.user_id=ch.user_id inner join tbl_shopproduct sp on sp.sproduct_id=cb.sproduct_id inner join tbl_product p on p.product_id=sp.product_id where sp.shop_id='"+session.getAttribute("shopid")+"'";
                    ResultSet rs=con.selectCommand(sel);
                    int i=0;
                    while(rs.next()){
                        i++;
                        %>
                        <tr>
                            <td><%=i%></td>
                            <td><%=rs.getString("product_name")%></td>
                            <td><%=rs.getString("cart_qty")%></td>
                             <td><%=rs.getString("user_name")%></td>
                              <td><%=rs.getString("user_address")%></td>
                              <%
                              if(rs.getString("delivery_status").equals("1"))
                              {
                                  %>
                                  <td class="green">Delivered</td>
                                  <%
                              }
                              else if(rs.getString("payment_status").equals("1"))
                              {
                                  %>
                                  <td class="orange">Payment Completed | <a href="ViewUserBookings.jsp?cid=<%=rs.getString("cart_id")%>">Delivered</a></td>
                                  <%
                              }
                              else{
                                   %>
                                  <td class="red">Order Completed | Payment Under Process </td>
                                  <%
                              }
                              %>
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
