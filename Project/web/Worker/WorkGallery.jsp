<%-- 
    Document   : WorkGallery
    Created on : 27 Jan, 2022, 12:02:03 PM
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
        <title>Work Gallery</title>
        <link rel="stylesheet" href="form.css">
    </head>
    <body>
         <%@include file="Head.jsp" %>
        <%
            session.setAttribute("sid", request.getParameter("eid"));
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_workgallery where wgallery_id='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("Work.jsp");
            }
        
                %>
        <h1>Work Gallery</h1>
         <div id="tab">
        <form name="frmworkgallery" method="post" action="../Assets/Actionpages/WorkGalleryUploadAction.jsp" enctype="multipart/form-data">
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
        </form>
        <hr>
                <br>
        <table border="1" align="center" cellpadding="10">
           <tr>
                <td>Sl.No</td>
                <td>Work</td>
                <td>Image</td>
                <td>Action</td>
            </tr>
            <%
            
            String s="select * from tbl_workgallery wg inner join tbl_work w on w.work_id=wg.work_id where wg.work_id='"+session.getAttribute("sid")+"' ";
            ResultSet r=con.selectCommand(s);
            int i=0;
            while(r.next())
            {
                i++;
            
            %>
            <tr>
                <td><%=i%></td>
                <td>
                   <%=r.getString("work_caption")%>
                </td>
                <td>
                    <img src="../Assets/WorkGallery/<%=r.getString("wgallery_image")%>" width="75" height="75">
                </td>
                <td>
                    <a href="WorkGallery.jsp?did=<%=r.getString("wgallery_id")%>">Delete</a>
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

   