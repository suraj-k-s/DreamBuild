<%-- 
    Document   : SearchLand
    Created on : 28 Jan, 2022, 2:28:58 PM
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
        <title>Search Land</title>
        <link rel="stylesheet" href="form.css">
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
        <script src="../Assets/JQ/jQuery.js"></script>
        <script>
            function getPlace(did)
            {
                    //alert(did);
                    $.ajax({
                    url: "../Assets/Ajaxpages/Ajaxplace.jsp?did="+did,
                      success: function(html){
                            $("#place").html(html);
                      }
                    });
            }
            function getLocation(did)
            {
                    //alert(did);
                    
                    //alert(did);
                    $.ajax({
                    url: "../Assets/Ajaxpages/Ajaxlocation.jsp?did="+did,
                      success: function(html){
                            $("#location").html(html);
                      }
                    });
            }
            
            function getLand()
            {
                    //alert(did);
                    var did=document.getElementById("district").value;
                    var pid=document.getElementById("place").value;
                    var lid=document.getElementById("location").value;
                    //alert(did);
                    $.ajax({
                    url: "../Assets/Ajaxpages/AjaxLandSearch.jsp?did="+did+"&pid="+pid+"&lid="+lid,
                      success: function(html){
                            $("#search").html(html);
                            //alert(html);
                      }
                    });
            }
        </script>
    </head>
    <body>
        
         <%@include file="Head.jsp" %>
         <h1>Search Lands</h1>
         <div id="tab">
        <form name="frmsearch" method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
                <tr>
                <td>District
                    
                        <select name="district" required id="district" onchange="getPlace(this.value),getLocation(place.value),getLand()">
                            <option value="" selected>--Select--</option>
                            <%
                             String st="select * from tbl_district";
                             ResultSet r=con.selectCommand(st);
           
                                while(r.next())
                                {
                         
                            %>
                            <option value="<%=r.getString("district_id")%>"><%=r.getString("district_name") %></option>
                            <%
                             }
                            %>
                        </select>    
                    </td>
                
                    <td>Place
                    
                        <select name="place" id="place" required onchange="getLocation(this.value),getLand()">
                            <option value="" selected>--Select--</option>
                          
                        </select>    
                    </td>
                    
                    <td>Location
                    
                        <select name="place" id="location" required onchange="getLand()">
                            <option value="" selected>--Select--</option>
                          
                        </select>    
                    </td>
                </tr> 
                
            </table>
      
                        <hr>
                        <br>
            <div id="search">
                        <table align="center">
                            
                            <tr>
                                <%
                                String sel="select * from tbl_land la inner join tbl_location l on la.location_id=l.location_id inner join tbl_place p on p.place_id=l.place_id inner join tbl_district d on d.district_id=p.district_id inner join tbl_landlord lr on la.landlord_id=lr.landlord_id ";
                                ResultSet rw=con.selectCommand(sel);
                                int i=0;
                                while(rw.next())
                                {    
                                i++;
                            %>
                            <td class="zoom"><p style="text-align:center;border:1px solid #999;margin:22px;padding:10px"><img src="../Assets/Land/<%=rw.getString("land_image")%>" width="100" height="100"><br>
                                    Token Amount:<%=rw.getString("land_tokenamount")%><br>
                                    Owner:<%=rw.getString("landlord_name")%><br>
                                    Contact:<%=rw.getString("landlord_contact")%><br>
                                    Address:<%=rw.getString("land_address")%><br>
                                    <br>
                                    <button class="btn"> <a href="LandViewMore.jsp?lid=<%=rw.getString("land_id")%>">View More</a></button>
                                        
                                </p></td>
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
        </form>
         </div>
    </body>
    <br>  <br>  <br>  <br>  <br>  <br>  <br>
    <%@include file="Foot.jsp" %>
</html>
