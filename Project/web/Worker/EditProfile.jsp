<%-- 
    Document   : EditProfile
    Created on : 26 Jan, 2022, 3:19:52 PM
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
        <title>EditProfile</title>
        <link rel="stylesheet" href="form.css">
    </head>
    <body>
        <body>
         <%@include file="Head.jsp" %>
        <h1>Edit Profile</h1>
        
         <div id="tab">
        <form name="frmeditprofile" method="post" action="../Assets/Actionpages/WorkerProfileEditAction.jsp" enctype="multipart/form-data">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
               <%
                  String sel="select * from tbl_worker where worker_id='"+session.getAttribute("workerid")+"'";
                  ResultSet rs=con.selectCommand(sel);
                  if(rs.next())
                {
                %>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtfname" value="<%=rs.getString("worker_name") %>"></td>
                                   
                </tr>
                
                <tr>
                   <td>Contact</td>
                   <td><input type="text" name="txtcontact" value="<%=rs.getString("worker_contact") %>" pattern="[0-9]{10}"></td>
                </tr> 
                <tr>
                   <td>Date of Birth</td>
                    <td><input type="date" name="dob" value="<%=rs.getString("worker_dob") %>" required></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><textarea name="txtaddress"><%=rs.getString("worker_address") %>
                        </textarea>
                    </td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td>
                        <img src="../Assets/Worker/<%=rs.getString("worker_photo") %>" name="txtlogo" id="profile-image" height="120" width="120" align="center" >
                        <input type="file" name="image" id="profile-image-upload" onchange="readURL(this)" style="display: none">
                    </td>
                </tr>
                
                <%}%>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnedit" value="EDIT PROFILE">
                    </td>
                </tr>  
            </table>
        </form>
         </div>
    </body>
     <br>  <br>  <br>  <br>  <br>  <br>  <br>
    <%@include file="Foot.jsp" %>
</html>
<script src="../Assets/JQ/jQuery.js"></script>
<script>
$('#profile-image').on('click', function(callback) {
    $('#profile-image-upload').click();
});
 function readURL(input) {
    if (input.files && input.files[0]) {
    
      var reader = new FileReader();
      reader.onload = function (e) { 
        document.querySelector("#profile-image").setAttribute("src",e.target.result);
      };

      reader.readAsDataURL(input.files[0]); 
    }
  }

	</script>


