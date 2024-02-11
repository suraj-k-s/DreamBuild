<%-- 
    Document   : ViewServiceBookings
    Created on : 18 Feb, 2022, 3:51:00 PM
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
        <title>View Service Bookings</title>
        <link rel="stylesheet" href="form.css">
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <h1>View Service Bookings</h1>
         <div id="tab">
        <table border="1" align="center" cellpadding="10">
            <tr>
                <td>Sl.No</td>
                <td>Service Title</td>
                <td>Service Description</td>
                <td>Amount</td>
                 <td>Booking Date</td>
                   <td>Booked Date</td>
                     <td>Updation Status</td>
                     <td>Worker Name</td>
                <td>Action</td>
            </tr>
            <%
            String s="select * from tbl_servicebooking sb inner join tbl_service s on sb.service_id=s.service_id inner join tbl_worker w on w.worker_id=s.worker_id inner join tbl_user u on sb.user_id=u.user_id where u.user_id='"+session.getAttribute("userid")+"'";
            ResultSet r=con.selectCommand(s);
            int i=0;
            while(r.next())
            {
                i++;
            
            %>
            <tr>
                <td><%=i%></td>
                <td>
                   <%=r.getString("service_title")%> 
                </td>
                <td>
                    <%=r.getString("service_description")%>
                </td>
                <td>
                    <%=r.getString("service_amount")%>
                </td>
                
                <td>
                    <%=r.getString("booking_date")%>
                </td>
                <td>
                    <%=r.getString("booked_date")%>
                </td>
                <td>
                    <%
                
                 if(r.getString("servicebooking_astatus").equals("1")){
                     out.println("Accepted");%>|<a href="ViewServiceBookings.jsp">Contact</a>
                     <%
                 }
                 else if(r.getString("servicebooking_astatus").equals("2")){
                     out.println("Rejected");
                 }
                 else if(r.getString("servicebooking_astatus").equals("3")&&r.getString("servicebooking_pstatus").equals("0")){
                      out.println("Service Completed");%>|<a href="ServicePayment.jsp?sid=<%=r.getString("servicebooking_id")%> &wname=<%=r.getString("worker_name")%> &wmail=<%=r.getString("worker_email")%> &uname=<%=r.getString("user_name")%> &umail=<%=r.getString("user_email")%>">Payment</a>
                     <%
                 }
                  else if(r.getString("servicebooking_pstatus").equals("1")&& r.getString("servicebooking_astatus").equals("3"))
                         {
                             out.println("Payment Completed");%>|<a href="WorkRating.jsp?lid=<%=r.getString("worker_id")%>">Rate Now</a>
                <%
                     }
                 
                 
                 %>
                </td>
                <td>
                    <%=r.getString("worker_name")%>
                </td>
                <td>
                    <a href="ViewServiceBookings.jsp?did=<%=r.getString("servicebooking_id")%>">Delete</a>
                     </td>
            </tr>
            <%
                    }
            %>
        </table>
         </div>
    </body>
    <br>  <br>  <br>  <br>  <br>  <br>  <br>
    <%@include file="Foot.jsp" %>
</html>
<%
    if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_servicebooking where servicebooking_id='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("ViewServiceBookings.jsp");
            }        
%>