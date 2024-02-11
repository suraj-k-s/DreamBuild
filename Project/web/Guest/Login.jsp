<%-- 
    Document   : Login
    Created on : 26 Jan, 2022, 10:29:59 AM
    Author     : asanj
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%
            if(request.getParameter("btnlogin")!=null)
            {
                String selu="select * from tbl_user where user_email='"+request.getParameter("txtuname")+"' and user_password='"+request.getParameter("txtpwd")+"' ";
                ResultSet rs=con.selectCommand(selu);
                
                String selw="select * from tbl_worker where worker_email='"+request.getParameter("txtuname")+"' and worker_password='"+request.getParameter("txtpwd")+"' and worker_vstatus='1'";
                ResultSet rs1=con.selectCommand(selw);
                
                String sell="select * from tbl_landlord where landlord_email='"+request.getParameter("txtuname")+"' and landlord_password='"+request.getParameter("txtpwd")+"' and landlord_vstatus='1'";
                ResultSet res=con.selectCommand(sell);
                
                String selAdmin="select * from tbl_admin where admin_username='"+request.getParameter("txtuname")+"' and admin_password='"+request.getParameter("txtpwd")+"' ";
                ResultSet rsAdmin=con.selectCommand(selAdmin);
                
                String sels="select * from tbl_shop where shop_email='"+request.getParameter("txtuname")+"' and shop_password='"+request.getParameter("txtpwd")+"' and shop_vstatus='1'";
                ResultSet ress=con.selectCommand(sels);
                
                if(rs.next())
                {
                    session.setAttribute("userid",rs.getString("user_id"));
                    session.setAttribute("username", rs.getString("user_name"));
                    response.sendRedirect("../User/Homepage.jsp");
                }
                else if(rs1.next())
                {
                    session.setAttribute("workerid",rs1.getString("worker_id"));
                    session.setAttribute("workername", rs1.getString("worker_name"));
                    response.sendRedirect("../Worker/Homepage.jsp");
                }
                else if(res.next())
                {
                    session.setAttribute("landlordid",res.getString("landlord_id"));
                    session.setAttribute("landlordname", res.getString("landlord_name"));
                    response.sendRedirect("../Landlord/Homepage.jsp");
                }
                else if(ress.next())
                {
                    session.setAttribute("shopid",ress.getString("shop_id"));
                    session.setAttribute("shopname", ress.getString("shop_name"));
                    response.sendRedirect("../Shop/Homepage.jsp");
                }
                 else if(rsAdmin.next())
                {
                    session.setAttribute("adminid",rsAdmin.getString("admin_id"));
                    session.setAttribute("adminusername", rsAdmin.getString("admin_username"));
                    response.sendRedirect("../Admin/Homepage.jsp");
                }
                else
                {
                    %>
                    <script>alert('Invalid Login')</script>
                    <%
                }
            }
        %>
        <h1>Login</h1>
        <form name="frmlogin" method="post" >
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
                <tr>
                   <td>User Email</td>
                    <td><input type="text" name="txtuname" value="" required></td>
                </tr>
                <tr>
                   <td>Password</td>
                    <td><input type="password" name="txtpwd" value="" required></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnlogin" value="LOGIN">
                        <input type="reset" name="btnreset" value="CANCEL">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <a href="User.jsp">NewUser</a> | 
                        <a href="Worker.jsp">NewWorker</a> |
                        <a href="Landlord.jsp">NewLandlord</a> 
                    </td>
                    </tr>
            </table> 
        </form>  
        
    </body>
</html>
