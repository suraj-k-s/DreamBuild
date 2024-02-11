<%-- 
    Document   : ServiceGallery
    Created on : 27 Jan, 2022, 10:18:35 AM
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
        <title>Service Gallery</title>
        <link rel="stylesheet" href="form.css">
    </head>
    <body>
         <%@include file="Head.jsp" %>
        <h1>Service Gallery</h1>
        <%
            session.setAttribute("sid", request.getParameter("eid"));
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_servicegallery where sgallery_id='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("Service.jsp");
            }
        
                %>
                 <div id="tab">
        <form name="frmservicegallery" method="post" action="../Assets/Actionpages/ServiceGalleryUploadAction.jsp" enctype="multipart/form-data">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
               
                <tr>
                    <td>Image</td>
                    <td><input type="file" name="image" required></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="SAVE">
                        <input type="reset" name="btncancel" value="CANCEL">
                    </td>
                </tr>
            </table>
        
       <hr>
                <br>
        <table border="1" align="center" cellpadding="10">
           <tr>
                <td>Sl.No</td>
                <td>Service</td>
                <td>Image</td>
                <td>Action</td>
            </tr>
            <%
            String s="select * from tbl_servicegallery sg inner join tbl_service s on s.service_id=sg.service_id  where sg.service_id='"+session.getAttribute("sid")+"' ";
            ResultSet r=con.selectCommand(s);
            
            int i=0;
            while(r.next())
            {
                i++;
            
            %>
            <tr>
                <td><%=i%></td>
                <td>
                    <%=r.getString("service_title")%>
                </td>
                <td>
                    <img src="../Assets/ServiceGallery/<%=r.getString("sgallery_image")%>" width="75" height="75">
                </td>
                <td>
                    <a href="ServiceGallery.jsp?did=<%=r.getString("sgallery_id")%>">Delete</a>
                </td>
            </tr>
            <%
                    }
            %> 
        </table>
        </form>
                 </div>
    </body>
     <br>  <br>  <br>  <br>  <br>  <br>  <br>
    <%@include file="Foot.jsp" %>
</html>
