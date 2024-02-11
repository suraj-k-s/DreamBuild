<%-- 
    Document   : ViewAcceptedWorkBookings
    Created on : 18 Feb, 2022, 9:17:42 PM
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
                <td>Work Image</td>
                 <td>Booking Date</td>
                   <td>Booked Date</td>
                     <td>User Name</td>
                <td>Action</td>
            </tr>
            <%
            String s="select * from tbl_lworkbooking lb inner join tbl_latestwork l on lb.lwork_id=l.lwork_id inner join tbl_worker w on w.worker_id=l.worker_id inner join tbl_user u on lb.user_id=u.user_id where w.worker_id='"+session.getAttribute("workerid")+"' and lb.lworkbooking_cstatus='1'";
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
                    <a href="ViewAcceptedWorkBookings.jsp?cid=<%=r.getString("lworkbooking_id")%>">Completed</a> 
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
                String del="update tbl_lworkbooking set lworkbooking_cstatus='3' where lworkbooking_id='"+request.getParameter("cid")+"'";
                con.executeCommand(del);
                response.sendRedirect("ViewAcceptedWorkBookings.jsp");
            } 
%>