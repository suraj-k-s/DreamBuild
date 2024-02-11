<%-- 
    Document   : Ajaxlocation
    Created on : 25 Jan, 2022, 2:55:07 PM
    Author     : asanj
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<option value="" selected>--Select--</option>
<%
    String sel="select * from tbl_location where place_id='"+request.getParameter("did")+"'";
    ResultSet rs=con.selectCommand(sel);
    while(rs.next())
    {
        %>
        <option value="<%=rs.getString("location_id")%>"><%=rs.getString("location_name")%></option>
        <%
    }
%>
