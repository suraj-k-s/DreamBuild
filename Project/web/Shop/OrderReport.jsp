<%-- 
    Document   : Report
    Created on : 17 Apr, 2022, 11:33:41 AM
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
        <title>Order Report</title>
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
        <link rel="stylesheet" href="form.css">
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <h1>Report</h1>
         <div id="tab">
        <form method="post">
            <table align="center" cellpadding="10">
                <tr>
                    <td>From Date:
                        <input type="date" name="fdate" value="">
                    </td>
                    <td>To Date:
                        <input type="date" name="tdate" value="">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Show Results" name="btn"> 
                    </td>
                </tr>
            </table>
            <div id="print">
            <%
                if(request.getParameter("btn")!=null){
            %>
            <table border="1" cellpadding="10" align="center">
                <tr>
                   <th>Sl.No</th>
                    <th>Product Name</th>
                    <th>Booked Quantity</th>
                    <th>Customer Name</th>
                    <th>Order Address</th>
                     <th>Payment Status</th>
                </tr>
                <%
                    if((!request.getParameter("fdate").equals("")) && (request.getParameter("tdate").equals("")))
                    {
                         
                    String sel="select * from tbl_cartbody cb inner join tbl_carthead ch on ch.cart_id=cb.cart_id inner join tbl_user u on u.user_id=ch.user_id inner join tbl_shopproduct sp on sp.sproduct_id=cb.sproduct_id inner join tbl_product p on p.product_id=sp.product_id where sp.shop_id='"+session.getAttribute("shopid")+"' and ch.booking_date>='"+request.getParameter("fdate")+"'";
                    ResultSet rs=con.selectCommand(sel);
                    //out.println(sel);
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
                
                    }
                    else if((request.getParameter("fdate").equals("")) && !(request.getParameter("tdate").equals("")))
                    {
                         
                    String sel="select * from tbl_cartbody cb inner join tbl_carthead ch on ch.cart_id=cb.cart_id inner join tbl_user u on u.user_id=ch.user_id inner join tbl_shopproduct sp on sp.sproduct_id=cb.sproduct_id inner join tbl_product p on p.product_id=sp.product_id where sp.shop_id='"+session.getAttribute("shopid")+"' and ch.booking_date<='"+request.getParameter("tdate")+"'";
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
                
                    }
                     
                    else if((!request.getParameter("fdate").equals("")) && (!request.getParameter("tdate").equals("")))
                    {
                         
                    String sel="select * from tbl_cartbody cb inner join tbl_carthead ch on ch.cart_id=cb.cart_id inner join tbl_user u on u.user_id=ch.user_id inner join tbl_shopproduct sp on sp.sproduct_id=cb.sproduct_id inner join tbl_product p on p.product_id=sp.product_id where sp.shop_id='"+session.getAttribute("shopid")+"' and ch.booking_date between '"+request.getParameter("fdate")+"' and '"+request.getParameter("tdate")+"'";
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
                
                    }
                   
                    else{
                        %>
                        <td colspan="6" align="center" class="red">No Results....</td>
                        <%
                    }
                }
                %>
            </table>
            </div>
        </form>
         </div>
    </body>
    <br>  <br>  <br>  <br>  <br>  <br>  <br>
    <%@include file="Foot.jsp" %>
</html>
