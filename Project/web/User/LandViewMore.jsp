<%-- 
    Document   : LandViewMore
    Created on : 4 Mar, 2022, 10:13:05 AM
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
        <title>LandViewMore</title>
        <link rel="stylesheet" href="form.css">
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <h1></h1>
         <div id="tab">
        <form>
            <table align="center">
                <tr>
                                <%
                                String sel="select * from tbl_land la inner join tbl_location l on la.location_id=l.location_id inner join tbl_place p on p.place_id=l.place_id inner join tbl_district d on d.district_id=p.district_id inner join tbl_landlord lr on la.landlord_id=lr.landlord_id where la.land_id='"+request.getParameter("lid")+"' ";
                                ResultSet rw=con.selectCommand(sel);
                                int i=0;
                                while(rw.next())
                                {    
                                i++;
                            %>
                            <td><p style="text-align:center;border:1px solid #999;margin:22px;padding:10px">
                                    <img src="../Assets/Land/<%=rw.getString("land_image")%>" width="100" height="100"><br>
                                    Token Amount:<%=rw.getString("land_tokenamount")%><br>
                                    Owner:<%=rw.getString("landlord_name")%><br>
                                    District:<%=rw.getString("District_name")%><br>
                                    Place:<%=rw.getString("place_name")%><br>
                                    location:<%=rw.getString("location_name")%><br>
                                    Address:<%=rw.getString("land_address")%><br>
                                    <br>
                                    <br>
                                    <a href="LandBooking.jsp?lid=<%=rw.getString("land_id")%>">
                                        <input type="button" value="Book Now">
                                    </a>
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
        </form>
         </div>
    </body>
    <br>  <br>  <br>  <br>  <br>  <br>  <br>
    <%@include file="Foot.jsp" %>
</html>
