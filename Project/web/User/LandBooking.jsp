<%-- 
    Document   : LandBooking
    Created on : 4 Mar, 2022, 3:02:32 PM
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
        <title>Land Booking</title>
        <link rel="stylesheet" href="form.css">
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <h1>Land Booking</h1>
         <div id="tab">
        <table align="center">    
                <tr>
                    <%
                        String owner_email= "", owner_name= "";
                        String user_email= "", user_name= "";
                        session.setAttribute("lid", request.getParameter("lid")); 
                                    
            String sel="select * from tbl_land la inner join tbl_location l on la.location_id=l.location_id inner join tbl_place p on p.place_id=l.place_id inner join tbl_district d on d.district_id=p.district_id inner join tbl_landlord lr on la.landlord_id=lr.landlord_id where la.land_id='"+request.getParameter("lid")+"' ";
                                ResultSet rw=con.selectCommand(sel);
                                int i=0;
                                while(rw.next())
                                {    
                                i++;
                            %>
                            <td><p style="text-align:center;border:1px solid #999;margin:22px;padding:10px"><img src="../Assets/Land/<%=rw.getString("land_image")%>" width="100" height="100"><br>
                                    Token Amount:<%=rw.getString("land_tokenamount")%><br>
                                    Owner:<%=rw.getString("landlord_name")%><br>
                                    District:<%=rw.getString("District_name")%><br>
                                    Place:<%=rw.getString("place_name")%><br>
                                    location:<%=rw.getString("location_name")%><br>
                                    Address:<%=rw.getString("land_address")%><br>
                                    <br>
                                </p>       
                                    <form name="frmbooking" method="post">
                                        <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
                                             <tr>
                                                    <td>Booking To</td>
                                                    <td><input type="date" name="bdate" value="" required></td>
                                             </tr>
                                             <tr>
                                                    <td colspan="2" align="center">
                                                        <input type="submit" name="btnsave" value="BOOK">
                                                    </td>
                                             </tr>  
                                        </table> 
                                    </form>    
                        
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

<%
    if(request.getParameter("btnsave")!=null)
            {
                String ins = "insert into tbl_landbooking(booked_date,land_id,user_id,booking_date) values ('"+request.getParameter("bdate")+"','"+session.getAttribute("lid")+"','"+session.getAttribute("userid")+"',curdate())";
              boolean status= con.executeCommand(ins);
              
              String st="select * from tbl_landbooking lb inner join tbl_land l on lb.land_id=l.land_id inner join tbl_landlord w on l.landlord_id=w.landlord_id inner join tbl_user u on lb.user_id=u.user_id where l.land_id='"+session.getAttribute("lid")+"' and u.user_id='"+session.getAttribute("userid")+"'";
                    ResultSet r=con.selectCommand(st); 
                    if(r.next())
                    {
                      //out.println(st);
                        owner_name=r.getString("landlord_name");
                        owner_email=r.getString("landlord_email");
                        user_name=r.getString("user_name");
                        user_email=r.getString("user_email");
                        //out.println(worker_name);
                    }
                        
                if(status==true)
                     {
                    DB.mailconnection m = new DB.mailconnection();
                    
                    String mailid[] = {user_email };
                    String name = user_name;
                    String subject = "Booking Status";
                   

                        String text = "Respected " + name + "  \r\n \r\n"
                                + " This is from Dream Build team. \r\n"
                                + " We established Dream Build in order to bring the dream about your home come true. \r\n\r\n"
                                + " Your requset for the desired land have been successfully submitted. \r\n"
                                + " Please wait for further updates. \r\n"
                                + " we were always happy to help!. \r\n \r\n"
                                + " Team Dream Build.";
                        boolean b = m.sendMail(mailid, subject, text);
                        System.out.println(b);
                     }
                if(status==true)
                     {
                    DB.mailconnection m = new DB.mailconnection();
                    String mailid[] = {owner_email};
                    String name = owner_name;
                    String subject = "Land Booking";
                   

                        String text = "Respected " + name + "  \r\n \r\n"
                                + " This is from Dream Build team. \r\n"
                                + " We established Dream Build in order to bring the dream about your home come true. \r\n\r\n"
                                + " Your land got one Booking. \r\n"
                                + " Check it out. \r\n \r\n"
                                + " Team Dream Build.";
                        boolean b = m.sendMail(mailid, subject, text);
                        System.out.println(b);
                     }
                %>
                <script type="text/javascript">
            alert("Land Booking Successfull..");
            response.sendRedirect("LandBooking.jsp");
        </script>
                <%
            }        
 %>
