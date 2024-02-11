<%-- 
    Document   : Newuser
    Created on : 1 Feb, 2022, 10:40:49 PM
    Author     : 91907
--%>
<%//@include file="SessionValidator.jsp" %>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="connect"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Feedback</title>
         <link rel="stylesheet" href="form.css">
        <%@include file="Header.jsp" %>
    </head>
    
    <body>
        <br><br><br><br><br><br>
        <div id="tab">
        <h1 align="center">User Feedback</h1>
        <table border="1" align="center" cellpadding="10">
                            
             <tr>
                <th>SI.No</th>
                <th>Content</th> 
               
            </tr>
            <br><br>
        
            <%
                int i = 0;
                String selQry1 = "select * from tbl_feedback c inner join tbl_user u on u.user_id=c.user_id order by feedback_date desc";
               // out.println(selQry1);
                ResultSet rsc = connect.selectCommand(selQry1);
                while(rsc.next())
                {
                    i++;
                    %>
                    <tr>
                        <td><%=i%></td>
                        <td><%=rsc.getString("feedback_description")%></td>
           
                    </tr>
      
              <%
                }
                  %>
                    </table>  
                  <br><br>
                  <h1 align="center">Worker Feedback</h1>
                  <table  border="1" align="center" cellpadding="10">
            <tr>
                <th>SI.No</th>
                <th>Content</th>
            </tr>
            <br><br>
        
            <%
                int j = 0;
                String selQry = "select * from tbl_feedback c inner join tbl_worker co on co.worker_id=c.worker_id order by feedback_date desc";
               // out.println(selQry1);
                ResultSet rs = connect.selectCommand(selQry);
                while(rs.next())
                {
                    j++;
                    %>
                    <tr>
                        <td><%=j%></td>
                        <td><%=rs.getString("feedback_description")%></td>
                        
                    </tr>
              <%
                }
                  %>
        </table>
        </div>
    </body>
    <%@include file="Footer.jsp" %>
</html>
