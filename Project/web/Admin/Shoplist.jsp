<%-- 
    Document   : Shoplist
    Created on : 11 Mar, 2022, 9:36:49 AM
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
        <title>Shop List</title>
         <link rel="stylesheet" href="form.css">
        <%@include file="Header.jsp" %>
    </head>
    <body>
        <%
            if(request.getParameter("aid")!=null)
             {
                String up="update tbl_shop set shop_vstatus='1' where shop_id='"+request.getParameter("aid")+"'";
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
                
                response.sendRedirect("Shoplist.jsp");
               }
             }
            if(request.getParameter("rid")!=null)
             {
                String up="update tbl_shop set shop_vstatus='2' where shop_id='"+request.getParameter("rid")+"'";
                
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
                response.sendRedirect("Shoplist.jsp");
             }
             }
        %>
        <div id="tab" align="center">
        <h1>Shop List</h1>
        <br>
       
        <br>
        <br>
        <table border="1" align="center" cellpadding="10" style="margin-left: 350px">
            <tr>
                <td>Sl.No</td>
                <td>District</td>
                <td>Place</td>
                <td>Logo</td>
                <td>Shop Name</td>
                <td>Email</td>
                <td>Contact</td>
                <td>Proof</td>
                <td>Action</td>
            </tr>
            <%
            String s="select * from tbl_shop w inner join tbl_place p on p.place_id=w.place_id inner join tbl_district d on d.district_id=p.district_id where w.shop_vstatus='0' order by w.shop_doj desc";
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
                    <img src="../Assets/Shop/<%=r.getString("shop_logo")%>" width="75" height="75">
                </td>
                <td>
                    <%=r.getString("shop_name")%>
                </td>
                <td>
                    <%=r.getString("shop_email")%>
                </td>
                <td>
                    <%=r.getString("shop_contact")%>
                </td>
                <td>
                    
                    <a href="../Assets/Shop/<%=r.getString("shop_proof")%>"><%=r.getString("shop_proof")%></a>
                   
                </td>
                <td>
                    <a href="Shoplist.jsp?aid=<%=r.getString("shop_id")%> &nid=<%=r.getString("shop_name")%> &mid=<%=r.getString("shop_email")%>">Accept</a> | <a href="Shoplist.jsp?rid=<%=r.getString("shop_id")%> &nid=<%=r.getString("shop_name")%> &mid=<%=r.getString("shop_email")%>">Reject</a>
                </td>
            </tr>
            <%
                    }
            %>
        </table>
        <hr>
        <br>
        <h2>Selected Shops</h2>
        <table border="1" align="center" cellpadding="10" style="margin-left: 350px">
            <tr>
                <td>Sl.No</td>
                <td>District</td>
                <td>Place</td>
                <td>Logo</td>
                <td>Shop Name</td>
                <td>Email</td>
                <td>Contact</td>
                <td>Proof</td>
                <td>Action</td>
            </tr>
            <%
            String se="select * from tbl_shop w inner join tbl_place p on p.place_id=w.place_id inner join tbl_district d on d.district_id=p.district_id where w.shop_vstatus='1' order by w.shop_doj desc";
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
                    <img src="../Assets/Shop/<%=rs.getString("shop_logo")%>" width="75" height="75">
                </td>
                <td>
                    <%=rs.getString("shop_name")%>
                </td>
                <td>
                    <%=rs.getString("shop_Email")%>
                </td>
                <td>
                    <%=rs.getString("shop_contact")%>
                </td>
                <td>
                    
                    <a href="../Assets/Shop/<%=rs.getString("shop_proof")%>"><%=rs.getString("shop_proof")%></a>
                   
                </td>
                <td>
                    <a href="Shoplist.jsp?rid=<%=rs.getString("shop_id")%> &nid=<%=rs.getString("shop_name")%> &mid=<%=rs.getString("shop_email")%>">Reject</a>
                </td>
            </tr>
            <%
                    }
            %>
        </table>
        
        <hr>
        <br>
        <h2>Rejected Shop</h2>
        <table border="1" align="center" cellpadding="10" style="margin-left: 350px">
            <tr>
                <td>Sl.No</td>
                <td>District</td>
                <td>Place</td>
                <td>Logo</td>
                <td>Shop Name</td>
                <td>Email</td>
                <td>Contact</td>
                <td>Proof</td>
                <td>Action</td>
            </tr>
            <%
            String sel="select * from tbl_shop w inner join tbl_place p on p.place_id=w.place_id inner join tbl_district d on d.district_id=p.district_id where w.shop_vstatus='2' order by w.shop_doj desc";
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
                    <img src="../Assets/Shop/<%=res.getString("shop_logo")%>" width="75" height="75">
                </td>
                <td>
                    <%=res.getString("shop_name")%>
                </td>
                <td>
                    <%=res.getString("shop_Email")%>
                </td>
                <td>
                    <%=res.getString("shop_contact")%>
                </td>
                <td>
                    
                    <a href="../Assets/Shop/<%=res.getString("shop_proof")%>"><%=res.getString("shop_proof")%></a>
                   
                </td>
                <td>
                    <a href="Shoplist.jsp?aid=<%=res.getString("shop_id")%> &nid=<%=res.getString("shop_name")%> &mid=<%=res.getString("shop_email")%>">Accept</a>   </td>
            </tr>
            <%
                    }
            %>
        </table>
        </div>
    </body>
    <%@include file="Footer.jsp" %>
</html>


