<%-- 
    Document   : AjaxEmail
    Created on : 10 Feb, 2022, 2:17:08 PM
    Author     : asanj
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String s="select * from tbl_landlord where landlord_email='"+request.getParameter("did")+"'";
    ResultSet r=con.selectCommand(s);
    String st="select * from tbl_user where user_email='"+request.getParameter("did")+"'";
    ResultSet rt=con.selectCommand(st);
    String str="select * from tbl_worker where worker_email='"+request.getParameter("did")+"'";
    ResultSet rs=con.selectCommand(str);
    if(r.next())
    {
      %> 
      <div class="alert alert-danger" role="alert">
  Email Already Exist
</div>
     <%  
    }
    else if(rt.next())
    {
      %> 
      <div class="alert alert-danger" role="alert">
  Email Already Exist
</div>
     <%  
    }
    else if(rs.next())
    {
      %> 
      <div class="alert alert-danger" role="alert">
  Email Already Exist
</div>
     <%  
    }
    %>