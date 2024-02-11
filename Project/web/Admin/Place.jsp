<%-- 
    Document   : Place
    Created on : 25 Jan, 2022, 11:52:20 AM
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
        <title>Place</title>
         <link rel="stylesheet" href="form.css">
        <%@include file="Header.jsp" %>
    </head>
    <body>
        <br><br><br><br><br><br>
           <%
            String eid="", ename="" , dis="";
            if(request.getParameter("btnsave")!=null)
            {
             String d="";
             d=request.getParameter("district");
             String p="";
             p=request.getParameter("txtplace");
             if(request.getParameter("eid")!=null)
             {
              String up="update tbl_place set place_name='"+p+"' where place_id='"+request.getParameter("txtid")+"'";   
             con.executeCommand(up);
             response.sendRedirect("Place.jsp");
             }
             else
             {
                 String selc="select * from tbl_place where place_name='"+p+"' and district_id='"+d+"'";
                 ResultSet rsc=con.selectCommand(selc);
                 if(rsc.next())
                 {
                     %>
                     <script>alert('Already Exist')</script>
                     <%
                 }
                 else
                 {
             String ins="insert into tbl_place(district_id,place_name) values ('"+d+"','"+p+"')";
             con.executeCommand(ins);
                 }
            }
            }
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_place where place_id='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("Place.jsp");
            }
            if(request.getParameter("eid")!=null)
            {
              String sel1="select * from tbl_place where place_id='"+request.getParameter("eid")+"'";
                ResultSet rs1=con.selectCommand(sel1);
                if(rs1.next())
                {
                    eid=rs1.getString("place_id");
                    ename=rs1.getString("place_name");
                    /* dis=rs1.getString("district_id");*/
                }  
            }
        %>
        <div id="tab">
        <h1>Place</h1>
        <br>
       
        <br>
        <br>
        <form name="frmplace" method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
                <input type="hidden" name="txtid" value="<%=eid%>">
                <tr>
                    <td>District Name</td>
                    <td>
                        <select name="district" required>
                            <option value="" selected>--Select--</option>
                            <%
            String s="select * from tbl_district";
            ResultSet r=con.selectCommand(s);
           
            while(r.next())
            {
               
            
            %>
                            <option value="<%=r.getString("district_id")%>"><%=r.getString("district_name") %></option>
                            <%
                    }
            %>
                        </select>    
                    </td>
                </tr>    
                <tr>
                    <td>Place Name</td>
                    <td><input type="text" name="txtplace" value="<%=ename%>" required></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="SAVE">
                        <input type="submit" name="btncancel" value="CANCEL">
                    </td>
                </tr>  
            </table>
                <hr>
                <br>
            <table border="1" align="center" cellpadding="10">
            <tr>
                <td>Sl.No</td>
                <td>District Name</td>
                <td>Place Name</td>
                <td>Action</td>
            </tr>
            <%
            String st="select * from tbl_place p inner join tbl_district d on p.district_id=d.district_id";
            ResultSet rs=con.selectCommand(st);
            int f=0;
            while(rs.next())
            {
                f++;
            
            %>
            <tr>
                <td><%=f%></td>
                <td><%=rs.getString("district_name") %></td>
                <td>
                    <%=rs.getString("place_name") %>
                </td>
                <td>
                    <a href="Place.jsp?did=<%=rs.getString("place_id")%>">Delete</a> | <a href="Place.jsp?eid=<%=rs.getString("place_id")%>">Edit</a>
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
