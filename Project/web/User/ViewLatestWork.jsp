<%-- 
    Document   : ViewLatestWork
    Created on : 4 Feb, 2022, 12:12:37 PM
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
        <title>View Latest Work</title>
        <link rel="stylesheet" href="form.css">
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <h1>View Latest Work</h1>
         <div id="tab">
        <table>    
                <tr>
                    <%
                    session.setAttribute("wid", request.getParameter("wid")); 
            String s="select * from tbl_latestwork where worker_id='"+session.getAttribute("wid")+"' ";
            //out.println(s);
            ResultSet rs=con.selectCommand(s);
            int i=0;
            while(rs.next())
            {    
                i++;
                    %>
                    <td><p style="text-align:center;border:1px solid #999;margin:22px;padding:10px">
                                <img src="../Assets/LatestWork/<%=rs.getString("lwork_image")%>" width="100" height="100"><br>
                                    <%=rs.getString("lwork_caption")%>
                                    <br>
                                    Details:<%=rs.getString("lwork_details")%>
                                    <br>
                                    Amount:<%=rs.getString("lwork_amount")%>
                                    <br>
                                    <a href="LatestWorkBooking.jsp?wid=<%=rs.getString("lwork_id")%>">Book</a>
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

    
