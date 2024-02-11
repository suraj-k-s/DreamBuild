<%-- 
    Document   : Location
    Created on : 25 Jan, 2022, 11:58:35 AM
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
        <title>Location</title>
         <link rel="stylesheet" href="form.css">
        <%@include file="Header.jsp" %>
        <script src="../Assets/JQ/jQuery.js"></script>
        <script>
            function getPlace(did)
            {
                    //alert(did);
                    $.ajax({
                    url: "../Assets/Ajaxpages/Ajaxplace.jsp?did="+did,
                      success: function(html){
                            $("#place").html(html);
                      }
                    });
            }
        </script>
    </head>
    <body>
        <%
            String eid="", ename="" , dis="";
            if(request.getParameter("btnsave")!=null)
            {
             String l="";
             l=request.getParameter("txtlocation");
             String p="";
             p=request.getParameter("place");
             if(request.getParameter("eid")!=null)
             {
              String up="update tbl_location set location_name='"+l+"' where location_id='"+request.getParameter("txtid")+"'";   
             con.executeCommand(up);
             response.sendRedirect("Location.jsp");
             }
             else
             {
                 String selc="select * from tbl_location where location_name='"+l+"' and place_id='"+p+"'";
                 ResultSet rsc=con.selectCommand(selc);
                 if(rsc.next())
                 {
                     %>
                     <script>alert('Already Exist')</script>
                     <%
                 }
                 else
                 {
             String ins="insert into tbl_location(place_id,location_name) values ('"+p+"','"+l+"')";
             con.executeCommand(ins);
                 }
            }
            }
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_location where location_id='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("Location.jsp");
            }
            if(request.getParameter("eid")!=null)
            {
              String sel1="select * from tbl_location where location_id='"+request.getParameter("eid")+"'";
                ResultSet rs1=con.selectCommand(sel1);
                if(rs1.next())
                {
                    eid=rs1.getString("location_id");
                    ename=rs1.getString("location_name");
                    /* dis=rs1.getString("district_id");*/
                }  
            }
        %>
        <div id="tab">
        <h1>Location</h1>
        <br>
        
        <br>
        <br>
        <form name="frmlocation" method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
                <input type="hidden" name="txtid" value="<%=eid%>">
                <tr>
                <td>District</td>
                    <td>
                        <select name="district" required onchange="getPlace(this.value)">
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
                    <td>Place</td>
                    <td>
                        <select name="place" id="place" required onchange="getLocation(this.value)">
                            <option value="" selected>--Select--</option>
                          
                        </select>    
                    </td>
                </tr> 
                
                <tr>
                    <td>Location</td>
                    <td><input type="text" name="txtlocation" value="<%=ename%>" required></td>
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
                <td>District</td>
                <td>Place</td>
                <td>Location</td>
                <td>Action</td>
            </tr>
            <%
            //String st="select * from tbl_location l inner join tbl_place p on l.place_id=p.place_id";
            String st="select * from ((tbl_location l inner join tbl_place p on l.place_id=p.place_id) inner join tbl_district d on p.district_id=d.district_id)";
            ResultSet rs=con.selectCommand(st);
            int f=0;
            while(rs.next())
            {
                f++;
            
            %>
            <tr>
                <td><%=f%></td>
                <td><%=rs.getString("district_name") %></td>
                <td><%=rs.getString("place_name") %></td>
                <td>
                    <%=rs.getString("location_name") %>
                </td>
                <td>
                    <a href="Location.jsp?did=<%=rs.getString("location_id")%>">Delete</a> | <a href="Location.jsp?eid=<%=rs.getString("location_id")%>">Edit</a>
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
