<%-- 
    Document   : ViewUserWorkBookings
    Created on : 18 Feb, 2022, 12:26:39 PM
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
        <%
    if(request.getParameter("aid")!=null)
            {
                String del="update tbl_lworkbooking set lworkbooking_cstatus='1' where lworkbooking_id='"+request.getParameter("aid")+"'";
                out.println(del);
                con.executeCommand(del);
                response.sendRedirect("ViewUserWorkBookings.jsp");
            } 
    if(request.getParameter("rid")!=null)
            {
                String del="update tbl_lworkbooking set lworkbooking_cstatus='2' where lworkbooking_id='"+request.getParameter("rid")+"'";
                con.executeCommand(del);
                response.sendRedirect("ViewUserWorkBookings.jsp");
            } 
%>
        <h1>View Work Bookings</h1>
         <div id="tab">
        <table border="1" align="center" cellpadding="10">
            <tr>
                <td>Sl.No</td>
                <td>Work Image</td>
                 <td>Booking Date</td>
                   <td>Booked Date</td>
                     <td>User Name</td>
                <td>Action</td>
            </tr>
            <%
            String s="select * from tbl_lworkbooking lb inner join tbl_latestwork l on lb.lwork_id=l.lwork_id inner join tbl_worker w on w.worker_id=l.worker_id inner join tbl_user u on lb.user_id=u.user_id where w.worker_id='"+session.getAttribute("workerid")+"' and lb.lworkbooking_cstatus='0'";
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
                    <%=r.getString("booking_date")%>
                </td>
                <td>
                    <%=r.getString("booked_date")%>
                </td>
             
                <td>
                    <%=r.getString("user_name")%>
                </td>
                <td>
                    <a href="ViewUserWorkBookings.jsp?aid=<%=r.getString("lworkbooking_id")%>">Accept</a> | <a href="ViewUserWorkBookings.jsp?rid=<%=r.getString("lworkbooking_id")%>">Reject</a> 
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
