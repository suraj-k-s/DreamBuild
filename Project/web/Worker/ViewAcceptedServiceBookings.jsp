<%-- 
    Document   : ViewAcceptedServiceBookings
    Created on : 23 Feb, 2022, 4:51:09 PM
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
        <title>View Accepted Work Bookings</title>
        <link rel="stylesheet" href="form.css">
    </head>
    <body>
         <%@include file="Head.jsp" %>
      <h1>View Accepted Work Bookings</h1>
       <div id="tab">
        <table border="1" align="center" cellpadding="10">
            <tr>
                <td>Sl.No</td>
                <td>Service Title</td>
                 <td>Booking Date</td>
                   <td>Booked Date</td>
                     <td>User Name</td>
                <td>Action</td>
            </tr>
             <%
            String s="select * from tbl_servicebooking sb inner join tbl_service s on sb.service_id=s.service_id inner join tbl_worker w on w.worker_id=s.worker_id inner join tbl_user u on sb.user_id=u.user_id where w.worker_id='"+session.getAttribute("workerid")+"' and sb.servicebooking_astatus='1'";
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
                    <%=r.getString("booking_date")%>
                </td>
                <td>
                    <%=r.getString("booked_date")%>
                </td>
             
                <td>
                    <%=r.getString("user_name")%>
                </td>
                <td>
                    <a href="ViewAcceptedServiceBookings.jsp?cid=<%=r.getString("servicebooking_id")%>">Completed</a>
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
            if(request.getParameter("cid")!=null)
            {
                String del="update tbl_servicebooking set servicebooking_astatus='3' where servicebooking_id='"+request.getParameter("cid")+"'";
                con.executeCommand(del);
                response.sendRedirect("ViewAcceptedServiceBookings.jsp");
            } 
%>

