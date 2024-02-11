<%-- 
    Document   : Ajaxplace
    Created on : 25 Jan, 2022, 12:41:20 PM
    Author     : asanj
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<option value="" selected>--Select--</option>
<%
    String sel="select * from tbl_place where district_id='"+request.getParameter("did")+"'";
    ResultSet rs=con.selectCommand(sel);
    while(rs.next())
    {
        %>
        <option value="<%=rs.getString("place_id")%>"><%=rs.getString("place_name")%></option>
        <%
    }
%>
