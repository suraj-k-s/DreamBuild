<%-- 
    Document   : Wishlist
    Created on : 6 Mar, 2022, 4:50:32 PM
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
        <title>Wishlist</title>
        <link rel="stylesheet" href="form.css">
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <h1></h1>
    </body>
    <br>  <br>  <br>  <br>  <br>  <br>  <br>
    <%@include file="Foot.jsp" %>
</html>
<%
                if(request.getParameter("wid")!=null)
            {
                String se="select *  from tbl_wishlist where user_id='"+session.getAttribute("userid")+"' and worker_id='"+request.getParameter("wid")+"'  ";
                //out.println(se);
                ResultSet rs=con.selectCommand(se);
                if(rs.next())
                {
                    //out.println(se);
                    %>
                    <script>alert("Already added to wishlist")</script>
                    <%  
                //response.sendRedirect("SearchWorker.jsp");
                }
                else
                {
                    //out.println(se);
                    String in="insert into tbl_wishlist(user_id,worker_id)values ('"+session.getAttribute("userid")+"','"+request.getParameter("wid")+"')";
                    con.executeCommand(in);
                    response.sendRedirect("SearchWorker.jsp");
                }
            }
%>