<%-- 
    Document   : WorkerType
    Created on : 25 Jan, 2022, 12:18:11 PM
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
        <title>Worker Type</title>
         <link rel="stylesheet" href="form.css">
        <%@include file="Header.jsp" %>
    </head>
    <body>
        <br><br><br><br><br><br>
        <%
            String eid="",ename="";
            if(request.getParameter("btnsave")!=null)
            {
             String d="";
             d=request.getParameter("txtworker");
             if(request.getParameter("eid")!=null)
             {
                String up="update tbl_workertype set workertype_name='"+d+"' where workertype_id='"+request.getParameter("txtid")+"'";
                con.executeCommand(up);
                response.sendRedirect("WorkerType.jsp");
             }
             else
             {
                 String selc="select * from tbl_workertype where workertype_name='"+d+"'";
                 ResultSet rsc=con.selectCommand(selc);
                 if(rsc.next())
                 {
                     %>
                     <script>alert('Already Exist')</script>
                     <%
                 }
                 else
                 {
                     
                
             String ins="insert into tbl_workertype(workertype_name) values ('"+d+"')";
             con.executeCommand(ins);
              }
             }
            }
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_workertype where workertype_id='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("WorkerType.jsp");
            }
            if(request.getParameter("eid")!=null)
            {
                String sel1="select * from tbl_workertype where workertype_id='"+request.getParameter("eid")+"'";
                ResultSet rs1=con.selectCommand(sel1);
                if(rs1.next())
                {
                    eid=rs1.getString("workertype_id");
                    ename=rs1.getString("workertype_name");
                }
            }
        %>
        <div id="tab">
        <h1>Worker Type</h1>
        <br>
        
        <br>
        <br>
        <form name="frmworkertype" method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
                <input type="hidden" name="txtid" value="<%=eid%>">
                <tr>
                    <td>Worker Type</td>
                    <td><input type="text" name="txtworker" value="<%=ename%>" required></td>
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
                <td>Worker Type</td>
                <td>Action</td>
            </tr>
            <%
            String s="select * from tbl_workertype";
            ResultSet r=con.selectCommand(s);
            int i=0;
            while(r.next())
            {
                i++;
            
            %>
            <tr>
                <td><%=i%></td>
                <td>
                    <%=r.getString("workertype_name")%>
                </td>
                <td>
                    <a href="WorkerType.jsp?did=<%=r.getString("workertype_id")%>">Delete</a> | <a href="WorkerType.jsp?eid=<%=r.getString("workertype_id")%>">Edit</a>
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
