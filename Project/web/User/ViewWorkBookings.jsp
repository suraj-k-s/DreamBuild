<%-- 
    Document   : ViewWorkBookings
    Created on : 18 Feb, 2022, 11:09:30 AM
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
        <title>View Work Bookings</title>
        <link rel="stylesheet" href="form.css">
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <h1>View Work Bookings</h1>
         <div id="tab">
        <table border="1" align="center" cellpadding="10">
            <tr>
                <td>Sl.No</td>
                <td>Work Image</td>
                <td>Amount</td>
                <td>Details</td>
                 <td>Booking Date</td>
                   <td>Booked Date</td>
                     <td>Updation Status</td>
                     <td>Worker Name</td>
                <td>Action</td>
            </tr>
            <%
            String s="select * from tbl_lworkbooking lb inner join tbl_latestwork l on lb.lwork_id=l.lwork_id inner join tbl_worker w on w.worker_id=l.worker_id inner join tbl_user u on lb.user_id=u.user_id where u.user_id='"+session.getAttribute("userid")+"'";
            ResultSet r=con.selectCommand(s);
            int i=0;
            while(r.next())
            {
                i++;
            
            %>
            <tr>
                <td><%=i%></td>
                <td><img src="../Assets/LatestWork/<%=r.getString("lwork_image")%>" width="100" height="100"></td>
                <td>
                    <%=r.getString("lwork_amount")%>
                </td>
                <td>
                    <%=r.getString("lwork_details")%>
                </td>
                <td>
                    <%=r.getString("booking_date")%>
                </td>
                <td>
                    <%=r.getString("booked_date")%>
                </td>
                <td>
                 <%
                
                 if(r.getString("lworkbooking_cstatus").equals("1")){
                     out.println("Accepted");%>|<a href="ViewWorkBookings.jsp">Contact</a>
                     <%
                 }
                 else if(r.getString("lworkbooking_cstatus").equals("2")){
                     out.println("Rejected");
                 }
                 else if(r.getString("lworkbooking_cstatus").equals("3")&&r.getString("lworkbooking_pstatus").equals("0")){
                      out.println("Work Completed");%>|<a href="WorkPayment.jsp?wid=<%=r.getString("lworkbooking_id")%> &wname=<%=r.getString("worker_name")%> &wmail=<%=r.getString("worker_email")%> &uname=<%=r.getString("user_name")%> &umail=<%=r.getString("user_email")%>">Payment</a>
                     <%
                 }
                 else if(r.getString("lworkbooking_pstatus").equals("1")&& r.getString("lworkbooking_cstatus").equals("3"))
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
                    <a href="ViewWorkBookings.jsp?did=<%=r.getString("lworkbooking_id")%>">Delete</a>
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
                String del="delete from tbl_lworkbooking where lworkbooking_id='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("ViewWorkBookings.jsp");
            }        
%>