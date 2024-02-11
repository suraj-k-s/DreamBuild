<%-- 
    Document   : District
    Created on : 25 Jan, 2022, 11:08:07 AM
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
        <title>Service Type</title>
         <link rel="stylesheet" href="form.css">
        <%@include file="Header.jsp" %>
    </head>
    <body>
        <%
            String eid="",ename="";
            if(request.getParameter("btnsave")!=null)
            {
             String d="";
             d=request.getParameter("txtservice");
             if(request.getParameter("eid")!=null)
             {
                String up="update tbl_servicetype set servicetype_name='"+d+"' where servicetype_id='"+request.getParameter("txtid")+"'";
                con.executeCommand(up);
                response.sendRedirect("ServiceType.jsp");
             }
             else
             {
                 String selc="select * from tbl_servicetype where servicetype_name='"+d+"'";
                 ResultSet rsc=con.selectCommand(selc);
                 if(rsc.next())
                 {
                     %>
                     <script>alert('Already Exist')</script>
                     <%
                 }
                 else
                 {
                     
                
             String ins="insert into tbl_servicetype(servicetype_name) values ('"+d+"')";
             con.executeCommand(ins);
              }
             }
            }
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_servicetype where servicetype_id='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("ServiceType.jsp");
            }
            if(request.getParameter("eid")!=null)
            {
                String sel1="select * from tbl_servicetype where servicetype_id='"+request.getParameter("eid")+"'";
                ResultSet rs1=con.selectCommand(sel1);
                if(rs1.next())
                {
                    eid=rs1.getString("servicetype_id");
                    ename=rs1.getString("servicetype_name");
                }
            }
        %>
        <div id="tab">
        <h1>Service Type</h1>
        <br>
        <a href="Homepage.jsp">Home</a> 
        <br>
        <br>
        <form name="frmservicetype" method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
                <input type="hidden" name="txtid" value="<%=eid%>">
                <tr>
                    <td>Service Type</td>
                    <td><input type="text" name="txtservice" value="<%=ename%>" required></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="SAVE">
                        <input type="reset" name="btncancel" value="CANCEL">
                    </td>
                </tr>  
            </table>
                <hr>
                <br>
        <table border="1" align="center" cellpadding="10">
           <tr>
                <td>Sl.No</td>
                <td>Service Type</td>
                <td>Action</td>
            </tr>
            <%
            String s="select * from tbl_servicetype";
            ResultSet r=con.selectCommand(s);
            int i=0;
            while(r.next())
            {
                i++;
            
            %>
            <tr>
                <td><%=i%></td>
                <td>
                    <%=r.getString("servicetype_name")%>
                </td>
                <td>
                    <a href="ServiceType.jsp?did=<%=r.getString("servicetype_id")%>">Delete</a> | <a href="ServiceType.jsp?eid=<%=r.getString("servicetype_id")%>">Edit</a>
                </td>
            </tr>
            <%
                    }
            %> 
        </table>
        </form>
        </div>
    </body>
    <%@include file="Footer.jsp" %>
</html>
