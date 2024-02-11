<%-- 
    Document   : Service
    Created on : 26 Jan, 2022, 8:22:42 PM
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
        <title>Service</title>
        <link rel="stylesheet" href="form.css">
    </head>
    <body>
         <%@include file="Head.jsp" %>
        <%
            String eid="",ename="",edes="",eamt="";
            if(request.getParameter("btnsave")!=null)
            {
             String d="",t="",a="";
             t=request.getParameter("txtstitle");
             d=request.getParameter("txtsdes");
             a=request.getParameter("txtsamt");
             if(request.getParameter("eid")!=null)
             {
                String up="update tbl_service set service_title='"+t+"', service_description='"+d+"' , service_amount='"+a+"' where service_id='"+request.getParameter("txtid")+"'";
                con.executeCommand(up);
                response.sendRedirect("Service.jsp");
             }
             else
             {
                 String selc="select * from tbl_service where service_title='"+t+"'";
                 ResultSet rsc=con.selectCommand(selc);
                 if(rsc.next())
                 {
                     %>
                     <script>alert('Already Exist')</script>
                     <%
                 }
                 else
                 {
                     
                
             String ins="insert into tbl_service(service_title,service_description,service_amount,worker_id) values ('"+t+"','"+d+"','"+a+"','"+session.getAttribute("workerid")+"')";
             con.executeCommand(ins);
              }
             }
            }
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_service where service_id='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("Service.jsp");
            }
            if(request.getParameter("eid")!=null)
            {
                String sel1="select * from tbl_service where service_id='"+request.getParameter("eid")+"'";
                ResultSet rs1=con.selectCommand(sel1);
                if(rs1.next())
                {
                    eid=rs1.getString("service_id");
                    ename=rs1.getString("service_title");
                    edes=rs1.getString("service_description");
                    eamt=rs1.getString("service_amount");
                }
            }
        %>
        <h1>Services</h1>
        
         <div id="tab">
        <form name="frmservice" method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
                <input type="hidden" name="txtid" value="<%=eid%>">
                <tr>
                    <td>Service Title</td>
                    <td><input type="text" name="txtstitle" value="<%=ename%>" required></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><textarea name="txtsdes" required> <%=edes%>
                        </textarea>
                    </td>
                </tr>
                <tr>
                    <td>Amount</td>
                    <td><input type="text" name="txtsamt" value="<%=eamt%>" required></td>
                </tr>
                
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="SAVE">
                        <input type="reset" name="btncancel" value="CANCEL">
                    </td>
                </tr>
            </table>
                </form>
                <hr>
                <br>
        <table border="1" align="center" cellpadding="10">
           <tr>
                <td>Sl.No</td>
                <td>Service</td>
                <td>Description</td>
                <td>Amount</td>
                <td>Action</td>
            </tr>
            <%
            String s="select * from tbl_service";
            ResultSet r=con.selectCommand(s);
            int i=0;
            while(r.next())
            {
                i++;
            
            %>
            <tr>
                <td><%=i%></td>
                <td>
                    <%=r.getString("service_title")%>
                </td>
                <td>
                    <%=r.getString("service_description")%>
                </td>
                <td>
                    <%=r.getString("service_amount")%>
                </td>
                <td>
                    <a href="Service.jsp?did=<%=r.getString("service_id")%>">Delete</a> | <a href="Service.jsp?eid=<%=r.getString("service_id")%>">Edit</a> | <a href="ServiceGallery.jsp?eid=<%=r.getString("service_id")%>">Add Gallery</a>
                </td>
            </tr>
            <%
                    }
            %> 
        </table>
         </div> 
    </body>
     <br>  <br>  <br>  <br>  <br>  <br>  <br>
    <%@include file="Foot.jsp" %>
</html>



