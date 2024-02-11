<%-- 
    Document   : FeedBack
    Created on : 2 Feb, 2022, 10:45:38 PM
    Author     : asanj
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback</title>
        <link rel="stylesheet" href="form.css">
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <%
            if(request.getParameter("btnsave")!=null){
                String ins="insert into  tbl_feedback(feedback_date,feedback_description,shop_id) values (curdate(),'" + request.getParameter("feedback") + "','"+session.getAttribute("shopid")+"')";
                con.executeCommand(ins);
               
            }
              if (request.getParameter("did") != null) {
                String del = "delete from tbl_feedback where feedback_id='" + request.getParameter("did") + "'";
                con.executeCommand(del);
                response.sendRedirect("FeedBack.jsp");
            }
        %>
        <h1>FeedBack</h1>
        <div id="tab">
        <form  method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
                <tr>
                    <td>FeedBack</td>
                    <td>
                        <textarea required name="feedback"></textarea>
                    </td>
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
                    <td>Feeback Content</td>
                    <td>Action</td>
                </tr>
                <%
                    String s = "select * from tbl_feedback where shop_id='"+session.getAttribute("shopid")+"'";
                    ResultSet r = con.selectCommand(s);
                    int i = 0;
                    while (r.next()) {
                        i++;

                %>
                <tr>
                    <td><%=i%></td>
                    <td>
                        <%=r.getString("feedback_description")%>
                    </td>
                    <td>
                        <a href="FeedBack.jsp?did=<%=r.getString("feedback_id")%>">Delete</a>
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
