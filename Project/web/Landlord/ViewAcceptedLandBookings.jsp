<%-- 
    Document   : ViewAcceptedLandBookings
    Created on : 6 Mar, 2022, 12:18:13 AM
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
        <title>View Accepted Land Bookings</title>
        <link rel="stylesheet" href="form.css">
    </head>
    <body>
         <%@include file="Head.jsp" %>
      <h1>View Accepted Land Bookings</h1>
      <div id="tab">
        <table border="1" align="center" cellpadding="10">
            <tr>
                <td>Sl.No</td>
                <td>Land Image</td>
                 <td>Booking Date</td>
                   <td>Booked Date</td>
                     <td>User Name</td>
                <td>Status</td>
            </tr>
            <%
            String s="select * from tbl_landbooking lb inner join tbl_land l on lb.land_id=l.land_id inner join tbl_landlord w on w.landlord_id=l.landlord_id inner join tbl_user u on lb.user_id=u.user_id where w.landlord_id='"+session.getAttribute("landlordid")+"' and lb.landbooking_pstatus='1' or lb.landbooking_pstatus='3'";
            ResultSet r=con.selectCommand(s);
            int i=0;
            while(r.next())
            {
                i++;
            
            %>
            <tr>
                <td><%=i%></td>
                <td><img src="../Assets/Files/<%=r.getString("land_image")%>" width="100" height="100"></td>
       
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
                    <% if(r.getString("landbooking_pstatus").equals("1"))
                   {
                   out.println("Waiting for payment");
                   } 
                    
                   else if(r.getString("landbooking_pstatus").equals("3"))
                   {
                   out.println("Agreement Started"); %>
                     
                   | <a href="ViewAcceptedLandBookings.jsp?cid=<%=r.getString("land_id")%>&uname=<%=r.getString("user_name")%>&umail=<%=r.getString("user_email")%>">Completed</a> 
                    <% } %>
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
                String up="update tbl_land set land_status='3' where land_id='"+request.getParameter("cid")+"'";
                boolean status=con.executeCommand(up);
        if (status == true) {
                   
                response.sendRedirect("ViewAcceptedLandBookings.jsp");
            } 
            }
%>
