<%-- 
    Document   : ViewWorkGallery
    Created on : 4 Feb, 2022, 2:45:52 PM
    Author     : asanj
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Work Gallery</title>
        <link rel="stylesheet" href="form.css">
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <h1>View Work Gallery</h1>
         <div id="tab">
        <table>    
                <tr>
                    <%
                    session.setAttribute("gid", request.getParameter("gid")); 
            String s="select * from tbl_workgallery where work_id='"+session.getAttribute("gid")+"' ";
            //out.println(s);
            ResultSet rs=con.selectCommand(s);
            int i=0;
            while(rs.next())
            {    
                i++;
                    %>
                    <td><p>
                            <img src="../Assets/WorkGallery/<%=rs.getString("wgallery_image")%>" width="100" height="100">
                        </p>
                    </td>
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
