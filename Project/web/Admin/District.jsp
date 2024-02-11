<%-- 
    Document   : District
    Created on : 26 Jan, 2022, 2:03:09 PM
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
        <title>Dream Build::District</title>
         <link rel="stylesheet" href="form.css">
        <script>
            function nameval(elem)
{
	var emailexp=/^([A-Za-z ]*)$/;
	if(elem.value.match(emailexp))
	{
		document.getElementById("name").innerHTML = "";
		return true;
	}
	else
	{
		
		document.getElementById("name").innerHTML = "<span style='color: red;'>Alphabets Are Allowed</span>";
		elem.focus();
		return false;
	}
}
        </script>
        <%@include file="Header.jsp" %>
    </head>
    <body>
        
        <%
            String eid = "", ename = "";
            if (request.getParameter("btnsave") != null) {
                String d = "";
                d = request.getParameter("txtdistrict");
                if (request.getParameter("eid") != null) {
                    String up = "update tbl_district set district_name='" + d + "' where district_id='" + request.getParameter("txtid") + "'";
                    con.executeCommand(up);
                    response.sendRedirect("District.jsp");
                } else {
                    String selc = "select * from tbl_district where district_name='" + d + "'";
                    ResultSet rsc = con.selectCommand(selc);
                    if (rsc.next()) {
        %>
        <script>alert('Already Exist')</script>
        <%
                    } else {

                        String ins = "insert into tbl_district(district_name) values ('" + d + "')";
                        con.executeCommand(ins);
                    }
                }
            }
            if (request.getParameter("did") != null) {
                String del = "delete from tbl_district where district_id='" + request.getParameter("did") + "'";
                con.executeCommand(del);
                response.sendRedirect("District.jsp");
            }
            if (request.getParameter("eid") != null) {
                String sel1 = "select * from tbl_district where district_id='" + request.getParameter("eid") + "'";
                ResultSet rs1 = con.selectCommand(sel1);
                if (rs1.next()) {
                    eid = rs1.getString("district_id");
                    ename = rs1.getString("district_name");
                }
            }
        %>
        <h1>District</h1>
        <br>
        
        <br>
        <br>
        <div id="tab">
        <form name="frmdistrict" method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
                <input type="hidden" name="txtid" value="<%=eid%>">
                <tr>
                    <td>District Name</td>
                    <td><input type="text" name="txtdistrict" value="<%=ename%>" required onchange="nameval(this)">
                        <div id="name"></div></td>
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
                    <td>District Name</td>
                    <td>Action</td>
                </tr>
                <%
                    String s = "select * from tbl_district";
                    ResultSet r = con.selectCommand(s);
                    int i = 0;
                    while (r.next()) {
                        i++;

                %>
                <tr>
                    <td><%=i%></td>
                    <td>
                        <%=r.getString("district_name")%>
                    </td>
                    <td>
                        <a href="District.jsp?did=<%=r.getString("district_id")%>">Delete</a>/ <a href="District.jsp?eid=<%=r.getString("district_id")%>">Edit</a>
                    </td>
                </tr>
                <%
                    }
                %> 
            </table>
        </form>
        </div>
    </body>
    <br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>

