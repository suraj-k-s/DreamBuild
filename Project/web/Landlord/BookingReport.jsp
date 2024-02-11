<%-- 
    Document   : BookingReport
    Created on : 25 Apr, 2022, 12:35:08 PM
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
        <title>Land Booking Report</title>
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
        <h1>Land Booking Report</h1>
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
            <br><br>
            <div id="print">
            <%
                if(request.getParameter("btn")!=null){
            %>
            <table border="1" cellpadding="10" align="center">
                <tr>
                   <th>Sl.No</th>
                    <th>Land Image</th>
                    <th>Token Amount</th>
                    <th>User Name</th>
                    <th>User Contact</th>
                     <th>Payment Status</th>
                </tr>
                <%
                    if((!request.getParameter("fdate").equals("")) && (request.getParameter("tdate").equals("")))
                    {
                         
                    String sel="select * from tbl_landbooking lb inner join tbl_land l on lb.land_id=l.land_id inner join tbl_landlord w on w.landlord_id=l.landlord_id inner join tbl_user u on lb.user_id=u.user_id where w.landlord_id='"+session.getAttribute("landlordid")+"' and lb.booking_date>='"+request.getParameter("fdate")+"'";
                    ResultSet rs=con.selectCommand(sel);
                    //out.println(sel);
                    int i=0;
                    while(rs.next()){
                        i++;
                        %>
                        <tr>
                            <td><%=i%></td>
                            <td><img src="../Assets/Land/<%=rs.getString("land_image")%>" width="100" height="100"></td>
                            <td><%=rs.getString("land_tokenamount")%></td>
                             <td><%=rs.getString("user_name")%></td>
                              <td><%=rs.getString("user_contact")%></td>
                              <% 
                              if(rs.getString("landbooking_pstatus").equals("1"))
                              {
                                  %>
                                  <td class="green">Waiting for Payment</td>
                                  <%
                              }
                              else if(rs.getString("landbooking_pstatus").equals("2"))
                              {
                                  %>
                                  <td class="red">Offer Rejected</td>
                                  <%
                              }
                              else if(rs.getString("landbooking_pstatus").equals("3"))
                              {
                                  %>
                                  <td class="orange">Agreement Started/Completed</td>
                                  <%
                              }
                              else{
                                   %>
                                  <td class="red">No process</td>
                                  <%
                              }
                              %>
                              </tr> 
                        <%
                    }
                
                    }
                    else if((request.getParameter("fdate").equals("")) && !(request.getParameter("tdate").equals("")))
                    {
                         
                    String sel="select * from tbl_landbooking lb inner join tbl_land l on lb.land_id=l.land_id inner join tbl_landlord w on w.landlord_id=l.landlord_id inner join tbl_user u on lb.user_id=u.user_id where w.landlord_id='"+session.getAttribute("landlordid")+"' and lb.booking_date<='"+request.getParameter("tdate")+"'";
                    ResultSet rs=con.selectCommand(sel);
                    int i=0;
                    while(rs.next()){
                        i++;
                        %>
                        <tr>
                            <td><%=i%></td>
                            <td><img src="../Assets/Land/<%=rs.getString("land_image")%>" width="100" height="100"></td>
                            <td><%=rs.getString("land_tokenamount")%></td>
                             <td><%=rs.getString("user_name")%></td>
                              <td><%=rs.getString("user_contact")%></td>
                              <% 
                              if(rs.getString("landbooking_pstatus").equals("1"))
                              {
                                  %>
                                  <td class="green">Waiting for Payment</td>
                                  <%
                              }
                              else if(rs.getString("landbooking_pstatus").equals("2"))
                              {
                                  %>
                                  <td class="red">Offer Rejected</td>
                                  <%
                              }
                              else if(rs.getString("landbooking_pstatus").equals("3"))
                              {
                                  %>
                                  <td class="orange">Agreement Started/Completed</td>
                                  <%
                              }
                              else{
                                   %>
                                  <td class="red">No process</td>
                                  <%
                              }
                              %>
                              </tr> 
                              <%
                    }
                
                    }
                     
                    else if((!request.getParameter("fdate").equals("")) && (!request.getParameter("tdate").equals("")))
                    {
                         
                    String sel="select * from tbl_landbooking lb inner join tbl_land l on lb.land_id=l.land_id inner join tbl_landlord w on w.landlord_id=l.landlord_id inner join tbl_user u on lb.user_id=u.user_id where w.landlord_id='"+session.getAttribute("landlordid")+"' and lb.booking_date between '"+request.getParameter("fdate")+"' and '"+request.getParameter("tdate")+"'";
                    ResultSet rs=con.selectCommand(sel);
                    int i=0;
                    while(rs.next()){
                        i++;
                        %>
                        <tr>
                            <td><%=i%></td>
                            <td><img src="../Assets/Land/<%=rs.getString("land_image")%>" width="100" height="100"></td>
                            <td><%=rs.getString("land_tokenamount")%></td>
                             <td><%=rs.getString("user_name")%></td>
                              <td><%=rs.getString("user_contact")%></td>
                              <% 
                              if(rs.getString("landbooking_pstatus").equals("1"))
                              {
                                  %>
                                  <td class="green">Waiting for Payment</td>
                                  <%
                              }
                              else if(rs.getString("landbooking_pstatus").equals("2"))
                              {
                                  %>
                                  <td class="red">Offer Rejected</td>
                                  <%
                              }
                              else if(rs.getString("landbooking_pstatus").equals("3"))
                              {
                                  %>
                                  <td class="orange">Agreement Started/Completed</td>
                                  <%
                              }
                              else{
                                   %>
                                  <td class="red">No process</td>
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
