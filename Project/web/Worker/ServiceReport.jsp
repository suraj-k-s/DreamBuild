<%-- 
    Document   : ServiceReport
    Created on : 25 Apr, 2022, 2:44:19 PM
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
        <title>Service Booking Report</title>
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
        <h1>Service Booking Report</h1>
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
                    <th>Service</th>
                    <th>Amount</th>
                    <th>User Name</th>
                    <th>User Contact</th>
                    <th>Service Status</th>
                     <th>Payment Status</th>
                </tr>
                <%
                    if((!request.getParameter("fdate").equals("")) && (request.getParameter("tdate").equals("")))
                    {
                         
                    String sel="select * from tbl_servicebooking sb inner join tbl_service s on sb.service_id=s.service_id inner join tbl_worker w on w.worker_id=s.worker_id inner join tbl_user u on sb.user_id=u.user_id where w.worker_id='"+session.getAttribute("workerid")+"' and sb.booking_date>='"+request.getParameter("fdate")+"'";
                    ResultSet rs=con.selectCommand(sel);
                    //out.println(sel);
                    int i=0;
                    while(rs.next()){
                        i++;
                        %>
                        <tr>
                            <td><%=i%></td>
                            <td><%=rs.getString("service_title")%></td>
                            <td><%=rs.getString("service_amount")%></td>
                             <td><%=rs.getString("user_name")%></td>
                              <td><%=rs.getString("user_contact")%></td>
                              <% 
                              if(rs.getString("servicebooking_astatus").equals("1"))
                              {
                                  %>
                                  <td class="green">Waiting for User contact</td>
                                  <%
                              }
                              else if(rs.getString("servicebooking_astatus").equals("2"))
                              {
                                  %>
                                  <td class="red">Offer Rejected</td>
                                  <%
                              }
                              else if(rs.getString("servicebooking_astatus").equals("3"))
                              {
                                  %>
                                  <td class="orange">Service Completed</td>
                                  <%
                              }
                              else{
                                   %>
                                  <td class="red">No process</td>
                                  <%
                              }
                              %>
                              
                                  <% 
                              if(rs.getString("servicebooking_pstatus").equals("1"))
                              {
                                  %>
                                  <td class="green">Payment Completed</td>
                                  <%
                              }
                             
                              else{
                                   %>
                                  <td class="red">Not Paid</td>
                                  <%
                              }
                               %>
                              </tr>
                        <%
                    }
                
                    }
                    else if((request.getParameter("fdate").equals("")) && !(request.getParameter("tdate").equals("")))
                    {
                         
                    String sel="select * from tbl_servicebooking sb inner join tbl_service s on sb.service_id=s.service_id inner join tbl_worker w on w.worker_id=s.worker_id inner join tbl_user u on sb.user_id=u.user_id where w.worker_id='"+session.getAttribute("workerid")+"' and sb.booking_date<='"+request.getParameter("tdate")+"'";
                    ResultSet rs=con.selectCommand(sel);
                    int i=0;
                    while(rs.next()){
                        i++;
                        %>
                        <tr>
                            <td><%=i%></td>
                            <td><%=rs.getString("service_title")%></td>
                            <td><%=rs.getString("service_amount")%></td>
                             <td><%=rs.getString("user_name")%></td>
                              <td><%=rs.getString("user_contact")%></td>
                              <% 
                              if(rs.getString("servicebooking_astatus").equals("1"))
                              {
                                  %>
                                  <td class="green">Waiting for User contact</td>
                                  <%
                              }
                              else if(rs.getString("servicebooking_astatus").equals("2"))
                              {
                                  %>
                                  <td class="red">Offer Rejected</td>
                                  <%
                              }
                              else if(rs.getString("servicebooking_astatus").equals("3"))
                              {
                                  %>
                                  <td class="orange">Service Completed</td>
                                  <%
                              }
                              else{
                                   %>
                                  <td class="red">No process</td>
                                  <%
                              }
                              %>
                              
                                  <% 
                              if(rs.getString("servicebooking_pstatus").equals("1"))
                              {
                                  %>
                                  <td class="green">Payment Completed</td>
                                  <%
                              }
                             
                              else{
                                   %>
                                  <td class="red">Not Paid</td>
                                  <%
                              }
                               %>
                              </tr>
                              <%
                    }
                
                    }
                     
                    else if((!request.getParameter("fdate").equals("")) && (!request.getParameter("tdate").equals("")))
                    {
                         
                    String sel="select * from tbl_servicebooking sb inner join tbl_service s on sb.service_id=s.service_id inner join tbl_worker w on w.worker_id=s.worker_id inner join tbl_user u on sb.user_id=u.user_id where w.worker_id='"+session.getAttribute("workerid")+"' and sb.booking_date between '"+request.getParameter("fdate")+"' and '"+request.getParameter("tdate")+"'";
                    ResultSet rs=con.selectCommand(sel);
                    int i=0;
                    while(rs.next()){
                        i++;
                        %>
                        <tr>
                            <td><%=i%></td>
                            <td><%=rs.getString("service_title")%></td>
                            <td><%=rs.getString("service_amount")%></td>
                             <td><%=rs.getString("user_name")%></td>
                              <td><%=rs.getString("user_contact")%></td>
                              <% 
                              if(rs.getString("servicebooking_astatus").equals("1"))
                              {
                                  %>
                                  <td class="green">Waiting for User contact</td>
                                  <%
                              }
                              else if(rs.getString("servicebooking_astatus").equals("2"))
                              {
                                  %>
                                  <td class="red">Offer Rejected</td>
                                  <%
                              }
                              else if(rs.getString("servicebooking_astatus").equals("3"))
                              {
                                  %>
                                  <td class="orange">Service Completed</td>
                                  <%
                              }
                              else{
                                   %>
                                  <td class="red">No process</td>
                                  <%
                              }
                              %>
                              
                                  <% 
                              if(rs.getString("servicebooking_pstatus").equals("1"))
                              {
                                  %>
                                  <td class="green">Payment Completed</td>
                                  <%
                              }
                             
                              else{
                                   %>
                                  <td class="red">Not Paid</td>
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
