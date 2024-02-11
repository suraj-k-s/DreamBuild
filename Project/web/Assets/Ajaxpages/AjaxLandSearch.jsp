<%-- 
    Document   : AjaxLandSearch
    Created on : 4 Feb, 2022, 10:18:54 AM
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
    String did="", pid="", lid="";
    did=request.getParameter("did");
    pid=request.getParameter("pid");
    lid=request.getParameter("lid");
    
    String sel="select * from tbl_land la inner join tbl_location l on la.location_id=l.location_id inner join tbl_place p on p.place_id=l.place_id inner join tbl_district d on d.district_id=p.district_id inner join tbl_landlord lr on la.landlord_id=lr.landlord_id ";
    if(did!="")
    {
        sel+=" where d.district_id='"+did+"' ";
    }
    if(pid!="")
    {
        sel+=" where p.place_id='"+pid+"' ";
    }
    if(lid!="")
    {
        //out.println(wid);
        sel+=" where l.location_id='"+lid+"' ";
        //out.println(sel);
    }
    %>
<table align="center">
    <tr>
<%
    ResultSet rs=con.selectCommand(sel);
    int i=0;
    while(rs.next())
    {
        i++;
      %>
        <td class="zoom"><p style="text-align:center;border:1px solid #999;margin:22px;padding:10px"><img src="../Assets/Land/<%=rs.getString("land_image")%>" width="100" height="100"><br>
                                    Token Amount:<%=rs.getString("land_tokenamount")%><br>
                                    Owner:<%=rs.getString("landlord_name")%><br>
                                    Contact:<%=rs.getString("landlord_contact")%><br>
                                    Address:<%=rs.getString("land_address")%><br>
                                    <br>
                                    <a href="LandViewMore.jsp?lid=<%=rs.getString("land_id")%>">
                                        <input type="button" value="View More">
                                    </a>
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
