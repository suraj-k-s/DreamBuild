<%-- 
    Document   : LatestWork
    Created on : 27 Jan, 2022, 11:46:39 AM
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
        <title>Latest Work</title>
        <link rel="stylesheet" href="form.css">
    </head>
    <body>
         <%@include file="Head.jsp" %>
        <%
          if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_latestwork where lwork_id='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("LatestWork.jsp");
            }  
        %>
        <h1>Latest Works</h1>
        
         <div id="tab">
        <form name="frmlatestwork" method="post" action="../Assets/Actionpages/LatestWorkUploadAction.jsp" enctype="multipart/form-data">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
                <tr>
                    <td>Work Image</td>
                    <td><input type="file" name="image" required></td>
                </tr>
                <tr>
                    <td>Caption</td>
                    <td><input type="text" name="txtstitle" value="<%%>" required></td>
                </tr>
                <tr>
                    <td>Details</td>
                    <td><textarea name="txtsdes" required> <%%>
                        </textarea>
                    </td>
                </tr>
                <tr>
                    <td>Amount</td>
                    <td><input type="text" name="txtsamt" value="<%%>" required></td>
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
                <td>Image</td>
                <td>Caption</td>
                <td>Details</td>
                <td>Amount</td>
                <td>Action</td>
            </tr>
            <%
            String s="select * from tbl_latestwork";
            ResultSet r=con.selectCommand(s);
            int i=0;
            while(r.next())
            {
                i++;
            
            %>
            <tr>
                <td><%=i%></td>
                <td>
                    <img src="../Assets/LatestWork/<%=r.getString("lwork_image")%>" width="75" height="75">
                </td>
                <td>
                    <%=r.getString("lwork_caption")%>
                </td>
                <td>
                    <%=r.getString("lwork_details")%>
                </td>
                <td>
                    <%=r.getString("lwork_amount")%>
                </td>
                <td>
                    <a href="LatestWork.jsp?did=<%=r.getString("lwork_id")%>">Delete</a> 
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
