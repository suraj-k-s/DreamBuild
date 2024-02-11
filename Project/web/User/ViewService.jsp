<%-- 
    Document   : ViewService
    Created on : 4 Feb, 2022, 11:23:35 AM
    Author     : asanj
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Service</title>
        <link rel="stylesheet" href="form.css">
    </head>
    <body>
       <%@include file="Head.jsp" %> 
        <h1>View Services</h1>
         <div id="tab">
        <table>    
                <tr>
                    <%
                    session.setAttribute("wid", request.getParameter("wid")); 
            String s="select * from tbl_service where worker_id='"+session.getAttribute("wid")+"' ";
            //out.println(s);
            ResultSet rs=con.selectCommand(s);
            int i=0;
            while(rs.next())
            {    
                i++;
                    %>
                    <td><p style="text-align:center;border:1px solid #999;margin:22px;padding:10px">
                                    Service title:<%=rs.getString("service_title")%>
                                    <br>
                                    Service Description:<%=rs.getString("service_description")%>
                                    <br>
                                    Service Amount:<%=rs.getString("service_amount")%>
                                    <br>
                                    <a href="ViewServiceGallery.jsp?sid=<%=rs.getString("service_id")%>">Service Gallery</a>
                                    <br>
                                    <a href="ServiceBooking.jsp?sid=<%=rs.getString("service_id")%>">Book</a>
                                </p></td>
                            <%
                            if(i%4==0){
                                out.println("</tr>");
                                
                                out.println("<tr>");
                                i=0;
                            }
                                }
                            %>
       
        </table>
         </div>         
    </body>
    <br>  <br>  <br>  <br>  <br>  <br>  <br>
    <%@include file="Foot.jsp" %>
</html>
