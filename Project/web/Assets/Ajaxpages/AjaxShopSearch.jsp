<%-- 
    Document   : AjaxShopSearch
    Created on : 11 Mar, 2022, 10:43:06 AM
    Author     : asanj
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <style>
.zoom {
  padding: 50px;
  background-color: palegreen;
  transition: transform .2s; /* Animation */
  width: 300px;
  height: 200px;
  margin: 0 auto;
}

.zoom:hover {
  transform: scale(1.5); /* (150% zoom - Note: if the zoom is too large, it will go outside of the viewport) */
}
.btn {
  background-color: null ;
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  font-size: 16px;
  margin: 4px 2px;
  opacity: 0.6;
  transition: 0.3s;
  text-decoration: none;
}
a{
    text-decoration: none;
}

.btn:hover {opacity: 1}
</style>
    </head>
    <body>
        
<%
    String did="", pid="", wid="";
    did=request.getParameter("did");
    pid=request.getParameter("pid");
   // wid=request.getParameter("wid");
    
    String sel="select * from tbl_shop w inner join tbl_place p on p.place_id=w.place_id inner join tbl_district d on d.district_id=p.district_id where w.shop_vstatus=1";
    if(did!="")
    {
        sel+=" and d.district_id='"+did+"' ";
    }
    if(pid!="")
    {
        sel+=" and p.place_id='"+pid+"' ";
    }
    //if(wid!="")
    //{
       // sel+=" and wt.workertype_id='"+wid+"' ";
    //}
    %>
<table align="center">
    <tr>
<%
    ResultSet rs=con.selectCommand(sel);
    System.out.println(sel);
    int i=0;
    while(rs.next())
    {
        i++;
      %>
      <td class="zoom"><p style="text-align:center;border:1px solid #999;margin:22px;padding:10px">
                <img src="../Assets/Shop/<%=rs.getString("shop_logo")%>" width="100" height="100"><br>
           Name: <%=rs.getString("shop_name") %><br>
           Contact: <%=rs.getString("shop_contact") %><br>
            Email:<%=rs.getString("shop_email")%><br>
            <button class="btn"><a href="ViewProducts.jsp?sid=<%=rs.getString("shop_id")%>">View Products</a></button>
               <br>
           
           </p></td>
     <% 
            if(i%4==0)
            {
                out.println("</tr>");
                                
                out.println("<tr>");
                 i=0;
            }
    }
%>
</table>
    </body>
</html>