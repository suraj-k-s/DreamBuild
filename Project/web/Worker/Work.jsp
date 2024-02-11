<%-- 
    Document   : Work
    Created on : 27 Jan, 2022, 10:44:57 AM
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
        <title>Work</title>
        <link rel="stylesheet" href="form.css">
    </head>
    <body>
         <%@include file="Head.jsp" %>
        <%
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_work where work_id='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("Work.jsp");
            }
            %>
        <h1>Work</h1>
        
         <div id="tab">
        <form name="frmwork" method="post" action="../Assets/Actionpages/WorkUploadAction.jsp" enctype="multipart/form-data">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
                <tr>
                    <td>Image</td>
                    <td><input type="file" name="image" required></td>
                </tr>
                <tr>
                    <td>Caption</td>
                    <td><input type="text" name="txtcaption" value="<%%>" required></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnlogin" value="SAVE">
                        <input type="reset" name="btnreset" value="CANCEL">
                    </td>
                </tr>  
            </table>
        </form>
                <hr>
                <br>
        <table border="1" align="center" cellpadding="10">
           <tr>
                <td>Sl.No</td>
                <td>Image</td>
                <td>Caption</td>
                <td>Action</td>
            </tr>
            <%
            String s="select * from tbl_work";
            ResultSet r=con.selectCommand(s);
            int i=0;
            while(r.next())
            {
                i++;
            
            %>
            <tr>
                <td><%=i%></td>
                <td>
                    <img src="../Assets/Work/<%=r.getString("work_image")%>" width="75" height="75">
                </td>
                <td>
                    <%=r.getString("work_caption")%>
                </td>
                <td>
                    <a href="Work.jsp?did=<%=r.getString("work_id")%>">Delete</a> | <a href="WorkGallery.jsp?eid=<%=r.getString("work_id")%>">Add Gallery</a>
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
