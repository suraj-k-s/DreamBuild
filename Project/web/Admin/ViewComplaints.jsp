<%-- 
    Document   : Newuser
    Created on : 1 Feb, 2022, 10:40:49 PM
    Author     : 91907
--%>
<%@include file="SessionValidator.jsp" %>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="connect"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Complaints</title>
         <link rel="stylesheet" href="form.css">
        <%@include file="Header.jsp" %>
    </head>
    
    <body>
        <br><br><br><br><br><br>
        <div id="tab">
        <h1 align="center">User Complaints</h1>
        <table border="1" align="center" cellpadding="10">
                            
             <tr>
                <th>SI.No</th>
                <th>Complaint Title</th>
                <th>Content</th>
                <th>Action</th>
            </tr>
            
           <br><br>
        
            <%
                int i = 0;
                String selQry1 = "select * from tbl_complaint c inner join tbl_user u on c.user_id=u.user_id";
               // out.println(selQry1);
                ResultSet rsc = connect.selectCommand(selQry1);
                while(rsc.next())
                {
                    i++;
                    %>
                    <tr>
                        <td><%=i%></td>
                        <td><%=rsc.getString("complaint_title")%></td>
                        <td><%=rsc.getString("complaint_description")%></td>
                        <td> <a href="Reply.jsp?did=<%=rsc.getString("complaint_id")%>">Reply</a>
                    </tr>
      
              <%
                }
                  %>
                    </table>  
                  <br><br>
                  <h1 align="center">Worker Complaints</h1>
                  <table  border="1" align="center" cellpadding="10">
            <tr>
                <th>SI.No</th>
                <th>Complaint Title</th>
                <th>Content</th>
                <th>Action</th>
            </tr>
            <br><br>
        
            <%
                int j = 0;
                String selQry = "select * from tbl_complaint c inner join tbl_worker w on c.worker_id=w.worker_id";
               // out.println(selQry1);
                ResultSet rs = connect.selectCommand(selQry);
                while(rs.next())
                {
                    j++;
                    %>
                    <tr>
                        <td><%=j%></td>
                        <td><%=rs.getString("complaint_title")%></td>
                        <td><%=rs.getString("complaint_description")%></td>
                        <td> <a href="Reply.jsp?did=<%=rs.getString("complaint_id")%>">Reply</a></td>
                    </tr> 
              <%
                }
                  %>
        </table>
        <br><br>
        <h1 align="center">Landlord Complaints</h1>
        <table border="1" align="center" cellpadding="10">
                            
             <tr>
                <th>SI.No</th>
                <th>Complaint Title</th>
                <th>Content</th>
                <th>Action</th>
            </tr>
            
           <br><br>
        
            <%
                int k = 0;
                String selQry2 = "select * from tbl_complaint c inner join tbl_landlord l on c.landlord_id=l.landlord_id";
               // out.println(selQry1);
                ResultSet rsc1 = connect.selectCommand(selQry2);
                while(rsc1.next())
                {
                    k++;
                    %>
                    <tr>
                        <td><%=k%></td>
                        <td><%=rsc1.getString("complaint_title")%></td>
                        <td><%=rsc1.getString("complaint_description")%></td>
                        <td> <a href="Reply.jsp?did=<%=rsc1.getString("complaint_id")%>">Reply</a>
                    </tr>
      
              <%
                }
                  %>
                    </table>  
                  <br><br>
                  <h1 align="center">Shop Complaints</h1>
        <table border="1" align="center" cellpadding="10">
                            
             <tr>
                <th>SI.No</th>
                <th>Complaint Title</th>
                <th>Content</th>
                <th>Action</th>
            </tr>
            
           <br><br>
        
            <%
                int l = 0;
                String selQry3 = "select * from tbl_complaint c inner join tbl_shop s on c.shop_id=s.shop_id";
               // out.println(selQry1);
                ResultSet rsc2 = connect.selectCommand(selQry3);
                while(rsc2.next())
                {
                    l++;
                    %>
                    <tr>
                        <td><%=l%></td>
                        <td><%=rsc2.getString("complaint_title")%></td>
                        <td><%=rsc2.getString("complaint_description")%></td>
                        <td> <a href="Reply.jsp?did=<%=rsc2.getString("complaint_id")%>">Reply</a>
                    </tr>
      
              <%
                }
                  %>
                    </table> 
        </div>
    </body>
    <%@include file="Footer.jsp" %>
</html>
