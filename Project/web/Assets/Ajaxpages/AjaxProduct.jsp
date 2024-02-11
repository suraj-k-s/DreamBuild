<%-- 
    Document   : AjaxProduct
    Created on : 11 Mar, 2022, 3:34:27 PM
    Author     : asanj
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<option value="" selected>--Select--</option>
<%
    String sel="select * from tbl_product where pcategory_id='"+request.getParameter("did")+"'";
    ResultSet rs=con.selectCommand(sel);
    while(rs.next())
    {
        %>
        <option value="<%=rs.getString("product_id")%>"><%=rs.getString("product_name")%></option>
        <%
    }
%>

