<%-- 
    Document   : ServiceBooking
    Created on : 17 Feb, 2022, 6:38:03 PM
    Author     : asanj
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dream Build:Service Booking</title>
        <link rel="stylesheet" href="form.css">
    </head>
    <body>
       
         <%@include file="Head.jsp" %>
          <h1>Service Booking</h1>
         <div id="tab">
        <table align="center">    
                <tr>
                    <%
                        String worker_email= "", worker_name= "";
                        String user_email= "", user_name= "";
                    session.setAttribute("sid", request.getParameter("sid")); 
            String s="select * from tbl_service where service_id='"+session.getAttribute("sid")+"' ";
            //out.println(s);
            ResultSet rs=con.selectCommand(s);
            int i=0;
            while(rs.next())
            {    
                i++;
                    %>
                    <td><p style="text-align:center;border:1px solid #999;margin:22px;padding:10px">
                                    <%=rs.getString("service_title")%>
                                    <br>
                                    Details:<%=rs.getString("service_description")%>
                                    <br>
                                    Amount:<%=rs.getString("service_amount")%>
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
                String ins = "insert into tbl_servicebooking(booked_date,service_id,user_id,booking_date) values ('"+request.getParameter("bdate")+"','"+session.getAttribute("sid")+"','"+session.getAttribute("userid")+"',curdate())";
              boolean status= con.executeCommand(ins);
              
              String st="select * from tbl_servicebooking sb inner join tbl_service s on sb.service_id=s.service_id inner join tbl_worker w on s.worker_id=w.worker_id inner join tbl_user u on sb.user_id=u.user_id where s.service_id='"+session.getAttribute("sid")+"' and u.user_id='"+session.getAttribute("userid")+"'";
                    ResultSet r=con.selectCommand(st); 
                    if(r.next())
                    {
                      //out.println(st);
                        worker_name=r.getString("worker_name");
                        worker_email=r.getString("worker_email");
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
                                + " The Worker you wished is Successfully Booked. \r\n"
                                + " we were always happy to help!. \r\n \r\n"
                                + " Team Dream Build.";
                        boolean b = m.sendMail(mailid, subject, text);
                        System.out.println(b);
                     }
                if(status==true)
                     {
                    DB.mailconnection m = new DB.mailconnection();
                    String mailid[] = {worker_email};
                    String name = worker_name;
                    String subject = "New Service Booking";
                   

                        String text = "Respected " + name + "  \r\n \r\n"
                                + " This is from Dream Build team. \r\n"
                                + " We established Dream Build in order to bring the dream about your home come true. \r\n\r\n"
                                + " You got one new Booking. \r\n"
                                + " Check it out. \r\n \r\n"
                                + " Team Dream Build.";
                        boolean b = m.sendMail(mailid, subject, text);
                        System.out.println(b);
                     }
                %>
                <script type="text/javascript">
            alert("Service Booking Successfull..");
            response.sendRedirect("ServiceBooking.jsp");
        </script>
                <%
            }        
 %>
