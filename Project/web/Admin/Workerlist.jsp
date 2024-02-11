<%-- 
    Document   : Userlist
    Created on : 26 Jan, 2022, 11:18:00 AM
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
        <title>Worker List</title>
        <link rel="stylesheet" href="form.css">
        <%@include file="Header.jsp" %>
    </head>
    <body>
        <br><br><br><br><br><br>
        <%
            if(request.getParameter("aid")!=null)
             {
                String up="update tbl_worker set worker_vstatus='1' where worker_id='"+request.getParameter("aid")+"'";
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
                
                response.sendRedirect("Workerlist.jsp");
               }
             }
            if(request.getParameter("rid")!=null)
             {
                String up="update tbl_worker set worker_vstatus='2' where worker_id='"+request.getParameter("rid")+"'";
                
                boolean status = con.executeCommand(up);
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
                response.sendRedirect("Workerlist.jsp");
             }
             }
        %>
        <div id="tab" align="center">
        <h1>Worker List</h1>
        <br>
      
        <br>
        <br>
        <table border="1" align="center" cellpadding="10" style="margin-left: 350px">
            <tr>
                <td>Sl.No</td>
                <td>District</td>
                <td>Place</td>
                <td>Photo</td>
                <td>Worker Name</td>
                <td>Email</td>
                <td>Contact</td>
                <td>Proof</td>
                <td>Action</td>
            </tr>
            <%
            String s="select * from tbl_worker w inner join tbl_place p on p.place_id=w.place_id inner join tbl_district d on d.district_id=p.district_id where w.worker_vstatus='0' order by w.worker_doj desc";
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
                    <img src="../Assets/Worker/<%=r.getString("worker_photo")%>" width="75" height="75">
                </td>
                <td>
                    <%=r.getString("worker_name")%>
                </td>
                <td>
                    <%=r.getString("worker_email")%>
                </td>
                <td>
                    <%=r.getString("worker_contact")%>
                </td>
                <td>
                    
                    <a href="../Assets/Worker/<%=r.getString("worker_proof")%>"><%=r.getString("worker_proof")%></a>
                   
                </td>
                <td>
                    <a href="Workerlist.jsp?aid=<%=r.getString("worker_id")%> &nid=<%=r.getString("worker_name")%> &mid=<%=r.getString("worker_email")%>">Accept</a> | <a href="Workerlist.jsp?rid=<%=r.getString("worker_id")%> &nid=<%=r.getString("worker_name")%> &mid=<%=r.getString("worker_email")%>">Reject</a>
                </td>
            </tr>
            <%
                    }
            %>
        </table>
        <hr>
        <br>
        <h2>Selected Workers</h2>
        <table border="1" align="center" cellpadding="10" style="margin-left: 350px">
            <tr>
                <td>Sl.No</td>
                <td>District</td>
                <td>Place</td>
                <td>Photo</td>
                <td>Worker Name</td>
                <td>Email</td>
                <td>Contact</td>
                <td>Proof</td>
                <td>Action</td>
            </tr>
            <%
            String se="select * from tbl_worker w inner join tbl_place p on p.place_id=w.place_id inner join tbl_district d on d.district_id=p.district_id where w.worker_vstatus='1' order by w.worker_doj desc";
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
                    <img src="../Assets/Worker/<%=rs.getString("worker_photo")%>" width="75" height="75">
                </td>
                <td>
                    <%=rs.getString("worker_name")%>
                </td>
                <td>
                    <%=rs.getString("worker_Email")%>
                </td>
                <td>
                    <%=rs.getString("worker_contact")%>
                </td>
                <td>
                    
                    <a href="../Assets/Worker/<%=rs.getString("worker_proof")%>"><%=rs.getString("worker_proof")%></a>
                   
                </td>
                <td>
                    <a href="Workerlist.jsp?rid=<%=rs.getString("worker_id")%> &nid=<%=rs.getString("worker_name")%> &mid=<%=rs.getString("worker_email")%>">Reject</a>
                </td>
            </tr>
            <%
                    }
            %>
        </table>
        
        <hr>
        <br>
        <h2>Rejected Workers</h2>
        <table border="1" align="center" cellpadding="10" style="margin-left: 350px">
            <tr>
                <td>Sl.No</td>
                <td>District</td>
                <td>Place</td>
                <td>Photo</td>
                <td>Worker Name</td>
                <td>Email</td>
                <td>Contact</td>
                <td>Proof</td>
                <td>Action</td>
            </tr>
            <%
            String sel="select * from tbl_worker w inner join tbl_place p on p.place_id=w.place_id inner join tbl_district d on d.district_id=p.district_id where w.worker_vstatus='2' order by w.worker_doj desc";
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
                    <img src="../Assets/Worker/<%=res.getString("worker_photo")%>" width="75" height="75">
                </td>
                <td>
                    <%=res.getString("worker_name")%>
                </td>
                <td>
                    <%=res.getString("worker_Email")%>
                </td>
                <td>
                    <%=res.getString("worker_contact")%>
                </td>
                <td>
                    
                    <a href="../Assets/Worker/<%=res.getString("worker_proof")%>"><%=res.getString("worker_proof")%></a>
                   
                </td>
                <td>
                    <a href="Workerlist.jsp?aid=<%=res.getString("worker_id")%> &nid=<%=res.getString("worker_name")%> &mid=<%=res.getString("worker_email")%>">Accept</a>                </td>
            </tr>
            <%
                    }
            %>
        </table>
        </div>
    </body>
    <%@include file="Footer.jsp" %>
</html>


