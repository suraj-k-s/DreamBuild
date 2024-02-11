<%-- 
    Document   : UserReport
    Created on : 17 Apr, 2022, 7:57:09 PM
    Author     : asanj
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>  
    <%//@include file="SessionValidator.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Worker Report</title>
        <link rel="stylesheet" href="form.css">
        <style>
            .red{
                text-align: center;
                color: red;
            }
        </style>
         <%@include file="Header.jsp" %>
    </head>
    <body>
        <h1>Worker Report</h1>
         <div id="tab">
        <form method="post">
            <table align="center" cellpadding="10">
                <tr>
                    <td>From Date:
                        <input type="date" name="fdate" value="">
                    </td>
                    <td>To Date:
                        <input type="date" name="tdate" value="">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Show Results" name="btn"> 
                    </td>
                </tr>
            </table>
            <br><br>
            <div id="print">
            <%
                if(request.getParameter("btn")!=null){
            %>
            <table border="1" cellpadding="10" align="center">
                <tr>
                   <th>Sl.No</th>
                    <th>User Name</th>
                    <th>Photo</th>
                    <th>Contact</th>
                    <th>Email</th>
                     <th>Address</th>
                </tr>
                <%
                    if((!request.getParameter("fdate").equals("")) && (request.getParameter("tdate").equals("")))
                    {
                         
                    String sel="select * from tbl_worker where worker_doj>='"+request.getParameter("fdate")+"'";
                    ResultSet rs=con.selectCommand(sel);
                    //out.println(sel);
                    int i=0;
                    while(rs.next()){
                        i++;
                        %>
                        <tr>
                            <td><%=i%></td>
                            <td><%=rs.getString("worker_name")%></td>
                            <td><img src="../Assets/Worker/<%=rs.getString("worker_photo")%>" width="75" height="75"></td>
                             <td><%=rs.getString("worker_contact")%></td>
                             <td><%=rs.getString("worker_email")%></td>
                              <td><%=rs.getString("worker_address")%></td>
                     </tr>  
                        <%
                    }
                
                    }
                    else if((request.getParameter("fdate").equals("")) && !(request.getParameter("tdate").equals("")))
                    {
                         
                    String sel="select * from tbl_worker where worker_doj<='"+request.getParameter("tdate")+"'";
                    ResultSet rs=con.selectCommand(sel);
                    int i=0;
                    while(rs.next()){
                        i++;
                        %>
                        <tr>
                            <td><%=i%></td>
                            <td><%=rs.getString("worker_name")%></td>
                            <td><img src="../Assets/Worker/<%=rs.getString("worker_photo")%>" width="75" height="75"></td>
                             <td><%=rs.getString("worker_contact")%></td>
                             <td><%=rs.getString("worker_email")%></td>
                              <td><%=rs.getString("worker_address")%></td>
                     </tr>  
                      <%
                    }
                
                    }
                    
                    else if((!request.getParameter("fdate").equals("")) && (!request.getParameter("tdate").equals("")))
                    {
                         
                    String sel="select * from tbl_worker where worker_doj between '"+request.getParameter("fdate")+"' and '"+request.getParameter("tdate")+"'";
                    ResultSet rs=con.selectCommand(sel);
                    int i=0;
                    while(rs.next()){
                        i++;
                        %>
                        <tr>
                            <td><%=i%></td>
                            <td><%=rs.getString("worker_name")%></td>
                            <td><img src="../Assets/Worker/<%=rs.getString("worker_photo")%>" width="75" height="75"></td>
                             <td><%=rs.getString("worker_contact")%></td>
                             <td><%=rs.getString("worker_email")%></td>
                              <td><%=rs.getString("worker_address")%></td>
                     </tr>  
                      <%
                    }
                
                    }
                   
                    else{
                        %>
                        <td colspan="6" align="center" class="red">No Results....</td>
                        <%
                    }
                }
                %>
            </table>
            </div>
        </form>
         </div>
    </body>
    <br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>
