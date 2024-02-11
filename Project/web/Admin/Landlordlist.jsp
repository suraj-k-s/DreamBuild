<%-- 
    Document   : Landlordlist
    Created on : 26 Jan, 2022, 12:18:10 PM
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
        <title>Landlord List</title>
         <link rel="stylesheet" href="form.css">
        <%@include file="Header.jsp" %>
    </head>
    <body>
        <br><br><br><br><br><br>
        <%
            if(request.getParameter("aid")!=null)
             {
                String up="update tbl_landlord set landlord_vstatus='1' where landlord_id='"+request.getParameter("aid")+"'";
               boolean status = con.executeCommand(up);
               if (status == true) {
                    DB.mailconnection m = new DB.mailconnection();
                    String mailid[] = {request.getParameter("mid")};
                    String name = request.getParameter("nid");
                    String subject = "Verification Successfull";
                   

                        String text = "Respected " + name + "  \r\n \r\n"
                                + " This is from Dream Build team,thank you for signing up to our service. \r\n"
                                + " We established Dream Build in order to bring the dream about your home come true. \r\n"
                                + " If you have any questions,and if there is anything we can improve please reply to this email. \r\n"
                                + " we were always happy to help!. \r\n \r\n"
                                + " Team Dream Build.";
                        boolean b = m.sendMail(mailid, subject, text);
                        System.out.println(b); 
               
                response.sendRedirect("Landlordlist.jsp");
             }
             }
            if(request.getParameter("rid")!=null)
             {
                String up="update tbl_landlord set landlord_vstatus='2' where landlord_id='"+request.getParameter("rid")+"'";
                boolean status =con.executeCommand(up);
                if (status == true) {
                    DB.mailconnection m = new DB.mailconnection();
                    String mailid[] = {request.getParameter("mid")};
                    String name = request.getParameter("nid");
                    String subject = "Verification Failed";
                   

                        String text = "Respected " + name + "  \r\n \r\n"
                                + " This is from Dream Build team,thank you for signing up to our service. \r\n"
                                + " Sorry to inform that you failed in the verification process. \r\n\r\n"
                                + " We established Dream Build in order to bring the dream about your home come true. \r\n"
                                + " If you have any questions,and if there is anything we can improve please reply to this email. \r\n"
                                + " we were always happy to help!. \r\n \r\n"
                                + " Team Dream Build.";
                        boolean b = m.sendMail(mailid, subject, text);
                        System.out.println(b);
                        
                response.sendRedirect("Landlordlist.jsp");
             }
             }
        %>
        <div id="tab" align="center">
        <h1>Landlord List</h1>
        <br>
        
        <br>
        <br>
        <table border="1" align="center" cellpadding="10" style="margin-left: 350px">
            <tr>
                <td>Sl.No</td>
                <td>District</td>
                <td>Place</td>
                <td>Photo</td>
                <td>Landlord Name</td>
                <td>Email</td>
                <td>Contact</td>
                <td>Proof</td>
                <td>Action</td>
            </tr>
            <%
            String s="select * from tbl_landlord l inner join tbl_place p on l.place_id=p.place_id inner join tbl_district d on d.district_id=p.district_id where landlord_vstatus='0' order by landlord_doj desc";
            ResultSet r=con.selectCommand(s);
            int i=0;
            while(r.next())
            {
                i++;
            
            %>
            <tr>
                <td><%=i%></td>
                 <td>
                    <%=r.getString("district_name")%>
                </td>
                 <td>
                    <%=r.getString("place_name")%>
                </td>
                <td>
                    <img src="../Assets/Landlord/<%=r.getString("landlord_photo")%>" width="75" height="75">
                </td>
                <td>
                    <%=r.getString("landlord_name")%>
                </td>
                <td>
                    <%=r.getString("landlord_email")%>
                </td>
                <td>
                    <%=r.getString("landlord_contact")%>
                </td>
                <td>
                    
                    <a href="../Assets/Landlord/<%=r.getString("landlord_proof")%>"><%=r.getString("landlord_proof")%></a>
                   
                </td>
                <td>
                    <a href="Landlordlist.jsp?aid=<%=r.getString("landlord_id")%> &nid=<%=r.getString("landlord_name")%> &mid=<%=r.getString("landlord_email")%>">Accept</a> | <a href="Landlordlist.jsp?rid=<%=r.getString("landlord_id")%> &nid=<%=r.getString("landlord_name")%> &mid=<%=r.getString("landlord_email")%>">Reject</a>
                </td>
            </tr>
            <%
                    }
            %>
        </table>
        <hr>
        <br>
        <h2>Selected Landlords</h2>
        <table border="1" align="center" cellpadding="10" style="margin-left: 350px">
            <tr>
                <td>Sl.No</td>
                <td>District</td>
                <td>Place</td>
                <td>Photo</td>
                <td>Landlord Name</td>
                <td>Email</td>
                <td>Contact</td>
                <td>Proof</td>
                <td>Action</td>
            </tr>
            <%
            String se="select * from tbl_landlord l inner join tbl_place p on l.place_id=p.place_id inner join tbl_district d on d.district_id=p.district_id where landlord_vstatus='1' order by landlord_doj desc";
            ResultSet rs=con.selectCommand(se);
            int j=0;
            while(rs.next())
            {
                j++;
            
            %>
            <tr>
                <td><%=j%></td>
                 <td>
                    <%=rs.getString("district_name")%>
                </td>
                 <td>
                    <%=rs.getString("place_name")%>
                </td>
                <td>
                    <img src="../Assets/Landlord/<%=rs.getString("landlord_photo")%>" width="75" height="75">
                </td>
                <td>
                    <%=rs.getString("landlord_name")%>
                </td>
                <td>
                    <%=rs.getString("landlord_email")%>
                </td>
                <td>
                    <%=rs.getString("landlord_contact")%>
                </td>
                <td>
                    
                    <a href="../Assets/Landlord/<%=rs.getString("landlord_proof")%>"><%=rs.getString("landlord_proof")%></a>
                   
                </td>
                <td>
                    <a href="Landlordlist.jsp?rid=<%=rs.getString("landlord_id")%> &nid=<%=rs.getString("landlord_name")%> &mid=<%=rs.getString("landlord_email")%>">Reject</a>
                </td>
            </tr>
            <%
                    }
            %>
        </table>
        
        <hr>
        <br>
        <h2>Rejected Landlords</h2>
        <table border="1" align="center" cellpadding="10" style="margin-left: 350px">
            <tr>
                <td>Sl.No</td>
                <td>District</td>
                <td>Place</td>
                <td>Photo</td>
                <td>Landlord Name</td>
                <td>Email</td>
                <td>Contact</td>
                <td>Proof</td>
                <td>Action</td>
            </tr>
            <%
            String sel="select * from tbl_landlord l inner join tbl_place p on l.place_id=p.place_id inner join tbl_district d on d.district_id=p.district_id where landlord_vstatus='2' order by landlord_doj desc";
            ResultSet res=con.selectCommand(sel);
            int k=0;
            while(res.next())
            {
                k++;
            
            %>
            <tr>
                <td><%=k%></td>
                <td>
                    <%=res.getString("district_name")%>
                </td>
                 <td>
                    <%=res.getString("place_name")%>
                </td>
                <td>
                    <img src="../Assets/Landlord/<%=res.getString("landlord_photo")%>" width="75" height="75">
                </td>
                <td>
                    <%=res.getString("landlord_name")%>
                </td>
                <td>
                    <%=res.getString("landlord_Email")%>
                </td>
                <td>
                    <%=res.getString("landlord_contact")%>
                </td>
                <td>
                    
                    <a href="../Assets/Landlord/<%=res.getString("landlord_proof")%>"><%=res.getString("landlord_proof")%></a>
                   
                </td>
                <td>
                    <a href="Landlordlist.jsp?aid=<%=res.getString("landlord_id")%> &nid=<%=res.getString("landlord_name")%> &mid=<%=res.getString("landlord_email")%>">Accept</a>
                </td>
            </tr>
            <%
                    }
            %>
        </table>
        </div>
    </body>
    <br><br><br><br><br><br><br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>



