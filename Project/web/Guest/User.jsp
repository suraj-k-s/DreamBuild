<%-- 
    Document   : User
    Created on : 25 Jan, 2022, 2:34:40 PM
    Author     : asanj
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
            function chkpwd(txtrp, txtp)
{
	if((txtrp.value)!=(txtp.value))
	{
		document.getElementById("pass").innerHTML = "<span style='color: red;'>Passwords Mismatch</span>";
	}
}

function checknum(elem)
{
	var numericExpression = /^[0-9]{8,10}$/;
	if(elem.value.match(numericExpression))
	{
		document.getElementById("contact").innerHTML = "";
		return true;
	}
	else
	{
		document.getElementById("contact").innerHTML = "<span style='color: red;'>Numbers Only Allowed</span>";
		elem.focus();
		return false;
	}
}



function emailval(elem)
{
	var emailexp=/^([a-zA-Z0-9.\_\-])+\@([a-zA-Z0-9.\_\-])+\.([a-zA-Z]{2,4})$/;
	if(elem.value.match(emailexp))
	{
		document.getElementById("content").innerHTML = "";
		return true;
	}
	else
	{
		
		document.getElementById("content").innerHTML ="<span style='color: red;'>Check Email Address Entered</span>";;
		elem.focus();
		return false;
	}
}
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

        function checkEmail(did)
            {
                    //alert(did);
                    $.ajax({
                    url: "../Assets/Ajaxpages/AjaxEmail.jsp?did="+did,
                      success: function(html){
                            $("#content").html(html);
                      }
                    });
            }
        </script>
        <script src="../Assets/JQ/jQuery.js"></script>
        <script>
            function getLocation(did)
            {
                    //alert(did);
                    $.ajax({
                    url: "../Assets/Ajaxpages/Ajaxlocation.jsp?did="+did,
                      success: function(html){
                            $("#location").html(html);
                      }
                    });
            }
            </script>
           <meta charset="utf-8">
        <title>DREAM BUILD</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Construction Company Website Template" name="keywords">
        <meta content="Construction Company Website Template" name="description">

        <!-- Favicon -->
        <link href="../Template/Main/img/favicon.ico" rel="icon">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="../Template/Main/lib/flaticon/font/flaticon.css" rel="stylesheet"> 
        <link href="../Template/Main/lib/animate/animate.min.css" rel="stylesheet">
        <link href="../Template/Main/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="../Template/Main/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="../Template/Main/lib/slick/slick.css" rel="stylesheet">
        <link href="../Template/Main/lib/slick/slick-theme.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="../Template/Main/css/style.css" rel="stylesheet">
        <script src="../Assets/JQ/jQuery.js"></script>
   

        <%@include file="Head.jsp" %>
    </head>

    <body>

        
                  <div class="contact wow fadeInUp">
                <div class="container">
                    <div class="section-header text-center">
                        <p>Registration</p>
                        <h2>User</h2>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="contact-info">

                                <img src="../Template/Main/user.png" style="margin-left:80px;margin-top:250px" width="300" height="250"/>

                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="contact-form">
        <form name="frmnewuser" method="post" action="../Assets/Actionpages/UserUploadAction.jsp" enctype="multipart/form-data">
            
                <div class="control-group"><input type="text" class="form-control" placeholder="Enter Your Name" name="txtname" value="" required autocomplete="off" onchange="nameval(this)">
                    <div id="name"></div></div><br>

                  <div class="control-group"><input type="radio" name='gender' value='Male'>Male
                        <input type="radio" name='gender' value='Female'>Female
                  </div><br>
                  
  <div class="control-group"><input type="text" class="form-control" placeholder="Enter Your Contact" name="txtcontact" value="" pattern="[0-9]{10}" required onchange="checknum(this)">
      <div id="contact"></div></div><br>
             <div class="control-group">     
      <input type="email" name="email" class="form-control" placeholder="Enter Your Email" value="" required onkeyup="emailval(this), checkEmail(this.value)">
      <div id="content"></div></div><br>
      
      <div class="control-group"><input type="date" class="form-control" name="dob" value="" required>
                
            </div><br>
                      <div class="control-group">
                          <select name="district"class="form-control" style="background-color: transparent" required onchange="getPlace(this.value)">
                              <option value="" selected="" style="text-align: center">--Select District--</option>
                            <%
                                String s = "select * from tbl_district";
                                ResultSet r = con.selectCommand(s);

                                while (r.next()) {

                            %>
                            <option value="<%=r.getString("district_id")%>"><%=r.getString("district_name")%></option>
                            <%
                                }
                            %>
                        </select>    
                      </div><br>
                      
              <div class="control-group">
                  <select name="place" id="place" class="form-control" style="background-color: transparent"  required onchange="getLocation(this.value)">
                      <option value="" selected="" style="text-align: center">--Select Place--</option>

                        </select>    
              </div>
                      <br>
                      
             <div class="control-group">
                 <select name="place" id="location" required="" class="form-control" style="background-color: transparent">
                     <option value="" selected="" style="text-align: center">--Select Location--</option>

                        </select>    
             </div>
                      <br>
                      
                      <div class="control-group"><textarea name="txtaddress" required="" class="form-control" placeholder="Address" required data-validation-required-message="Please enter your Address"></textarea>

                 </div>
                      <br>
                      
                      <div class="control-group">
                          <label id="txt_label" style="color: white">Select Your Photo</label>
                          <input type="file" name="image" class="form-control"  required></div><br>
                      
                          <div class="control-group"><input type="password" class="form-control" name="txtpwd" value="" required></div><br>
                      
                          <div class="control-group"><input type="password" name="txtpwd1" value="" class="form-control" required onchange="chkpwd(this, txtpwd)">
                   <div id="pass"></div></div><br>
                   <div align="center">
                       <input type="submit" class="btn" name="btnsave" value="SAVE">
                       <input type="reset" class="btn" name="btncancel" value="CANCEL">
                   </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>    
    </body>
    <%@include file="Foot.jsp" %>
</html>
