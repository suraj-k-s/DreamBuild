<%-- 
    Document   : ViewProductBookings
    Created on : 6 May, 2022, 8:20:07 PM
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
                response.sendRedirect("ViewProductBookings.jsp");
            }
        %>
        <div id="tab">
        <form method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
                <tr>
                    <th>Sl.No</th>
                    <th>Product Name</th>
                    <th>Booked Quantity</th>
                    <th>Shop Name</th>
                    <th>Order Address</th>
                     <th>Payment Status</th>
                    
                </tr>
                <%
                    String sel="select * from tbl_cartbody cb inner join tbl_carthead ch on ch.cart_id=cb.cart_id inner join tbl_user u on u.user_id=ch.user_id inner join tbl_shopproduct sp on sp.sproduct_id=cb.sproduct_id inner join tbl_product p on p.product_id=sp.product_id inner join tbl_shop s on sp.shop_id=s.shop_id where ch.user_id='"+session.getAttribute("userid")+"'";
                    ResultSet rs=con.selectCommand(sel);
                    int i=0;
                    while(rs.next()){
                        i++;
                        %>
                        <tr>
                            <td><%=i%></td>
                            <td><%=rs.getString("product_name")%></td>
                            <td><%=rs.getString("cart_qty")%></td>
                             <td><%=rs.getString("shop_name")%></td>
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
                                  <td class="orange">Payment Completed</td>
                                  <%
                              }
                              else if(rs.getString("delivery_status").equals("0"))
                              {
                                  %>
                                  <td class="orange">Not yet delivered</td>
                                  <%
                              }
                              else{
                                   %>
                                  <td class="red">Payment Under Process </td>
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
