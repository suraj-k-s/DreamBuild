<%-- 
    Document   : District.jsp
    Created on : 14 Jan, 2022, 12:04:43 AM
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
        <title>User Complaint</title>
        <link rel="stylesheet" href="form.css">
    </head>
    <%
        String complaint = "", title = "", date="";
        
        if(request.getParameter("btnsave")!=null)
        {
            String Complaint = request.getParameter("txtcontent");
            title = request.getParameter("title");
            
                
                
            String insQry = "insert into tbl_complaint(complaint_title,complaint_description,complaint_date,landlord_id)values('"+title+"','"+Complaint+"',curdate(),'"+session.getAttribute("landlordid")+"')";
            if(connect.executeCommand(insQry))
            {
                out.println("<script>alert('Inserted')</script>");
            }
            else
            {
                out.println("<script>alert('Failed')</script>");
                out.println(insQry);
            }
        }
        if(request.getParameter("did")!=null){
            String del="delete from tbl_complaint where complaint_id='"+request.getParameter("did")+"'";
            connect.executeCommand(del);
            response.sendRedirect("Complaints.jsp");
        }
    
        
        %>
   
    <body>
         <%@include file="Head.jsp" %>
         <div id="tab">
        <form name="frmComplaints" method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
                <tr>
                    <td>Title</td>
                    <td>
                        <input type="text" name="title" placeholder="Enter Title" required="required">
                    </td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><textarea  name="txtcontent" placeholder="Enter Content" required="required"></textarea></td>
                </tr>
                
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="submit">
                        
                    </td>
                    
                </tr>
            </table>
        </form>
         
                        <br><br>
        <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
            <tr>
                <th>SI.No</th>
                <th>Complaints</th>
                <th>Content</th>
                <th>Complaint Reply</th>
                <th>Action</th>
            </tr>
            <%
                    String s = "select * from tbl_complaint where landlord_id='"+session.getAttribute("landlordid")+"'";
                    ResultSet r = connect.selectCommand(s);
                    int i = 0;
                    while (r.next()) {
                        i++;

                %>
                <tr>
                    <td><%=i%></td>
                    <td>
                        <%=r.getString("complaint_title")%>
                    </td>
                    <td>
                        <%=r.getString("complaint_description")%>
                    </td>
                    <td>
                        <%=r.getString("complaint_reply")%>
                    </td>
                    <td>
                        <a href="Complaints.jsp?did=<%=r.getString("complaint_id")%>">Delete</a>
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
