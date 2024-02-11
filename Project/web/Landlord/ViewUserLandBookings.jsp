<%-- 
    Document   : ViewUserLandBookings
    Created on : 6 Mar, 2022, 12:06:21 AM
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
        <title>View Land Bookings</title>
        <link rel="stylesheet" href="form.css">
    </head>
    <body>
         <%@include file="Head.jsp" %>
        <%
    if(request.getParameter("aid")!=null)
            {
                String del="update tbl_landbooking set landbooking_pstatus='1' where landbooking_id='"+request.getParameter("aid")+"'";
                out.println(del);
                con.executeCommand(del);
                response.sendRedirect("ViewUserLandBookings.jsp");
            } 
    if(request.getParameter("rid")!=null)
            {
                String del="update tbl_landbooking set landbooking_pstatus='2' where landbooking_id='"+request.getParameter("rid")+"'";
                con.executeCommand(del);
                response.sendRedirect("ViewUserLandBookings.jsp");
            } 
%>
        <h1>View Land Bookings</h1>
        <div id="tab">
        <table border="1" align="center" cellpadding="10">
            <tr>
                <td>Sl.No</td>
                <td>Land Image</td>
                 <td>Booking Date</td>
                   <td>Booked Date</td>
                     <td>User Name</td>
                <td>Action</td>
            </tr>
            <%
            String s="select * from tbl_landbooking lb inner join tbl_land l on lb.land_id=l.land_id inner join tbl_landlord w on w.landlord_id=l.landlord_id inner join tbl_user u on lb.user_id=u.user_id where w.landlord_id='"+session.getAttribute("landlordid")+"' and lb.landbooking_pstatus='0'";
            ResultSet r=con.selectCommand(s);
            int i=0;
            while(r.next())
            {
                i++;
            
            %>
            <tr>
                <td><%=i%></td>
                <td><img src="../Assets/Land/<%=r.getString("land_image")%>" width="100" height="100"></td>
       
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
                    <a href="ViewUserLandBookings.jsp?aid=<%=r.getString("landbooking_id")%>">Accept</a> | <a href="ViewUserLandBookings.jsp?rid=<%=r.getString("landbooking_id")%>">Reject</a> 
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

