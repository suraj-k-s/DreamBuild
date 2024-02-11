<%-- 
    Document   : ViewLandBookings
    Created on : 6 Mar, 2022, 12:38:34 AM
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
        <h1>View Land Bookings</h1>
         <div id="tab">
        <table border="1" align="center" cellpadding="10">
            <tr>
                <td>Sl.No</td>
                <td>Land Image</td>
                <td>Token Amount</td>
                <td>Address</td>
                <td>Owner Name</td>
                <td>Owner Contact</td>
                 <td>Booking Date</td>
                   <td>Booked Date</td>
                     <td>Updation Status</td>
                     
                <td>Action</td>
            </tr>
            <%
            String s="select * from tbl_landbooking lb inner join tbl_land l on lb.land_id=l.land_id inner join tbl_landlord w on w.landlord_id=l.landlord_id inner join tbl_user u on lb.user_id=u.user_id where u.user_id='"+session.getAttribute("userid")+"'";
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
                    <%=r.getString("land_tokenamount")%>
                </td>
                <td>
                    <%=r.getString("land_address")%>
                </td>
                <td>
                    <%=r.getString("landlord_name")%>
                </td>
                <td>
                    <%=r.getString("landlord_contact")%>
                </td>
                <td>
                    <%=r.getString("booking_date")%>
                </td>
                <td>
                    <%=r.getString("booked_date")%>
                </td>
                <td>
                 <%
                
                 if(r.getString("landbooking_pstatus").equals("1")){
                     out.println("Accepted");%>|<a href="LandPayment.jsp?sid=<%=r.getString("landbooking_id")%> &wname=<%=r.getString("landlord_name")%> &wmail=<%=r.getString("landlord_email")%> &uname=<%=r.getString("user_name")%> &umail=<%=r.getString("user_email")%>">Advance Payment</a>
                     <%
                 }
                 else if(r.getString("landbooking_pstatus").equals("2")){
                     out.println("Rejected");
                 }
                 else if(r.getString("landbooking_pstatus").equals("3")){
                     out.println("Agreement Preparing");
                 }
                 else if(r.getString("land_status").equals("1")){
                      out.println("Property Handovered");
                 }
                 
                 %>
                </td>
                
                <td>
                    <a href="ViewLandBookings.jsp?did=<%=r.getString("landbooking_id")%>">Delete</a>
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
                String del="delete from tbl_landbooking where landbooking_id='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("ViewLandBookings.jsp");
            }        
%>
