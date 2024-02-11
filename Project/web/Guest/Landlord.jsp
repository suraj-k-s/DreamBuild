<%-- 
    Document   : Landlord
    Created on : 25 Jan, 2022, 2:02:53 PM
    Author     : asanj
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <%@include file="Head.jsp" %>
    </head>
    <body>
        <br> <br> <br> <br>
      
        
                  <div class="contact wow fadeInUp">
                <div class="container">
                    <div class="section-header text-center">
                        <p>Registration</p>
                        <h2>Land Lord</h2>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="contact-info">
us
                                <img src="../Template/Main/usd.jpg" style="margin-left:80px;margin-top:250px" width="300" height="250"/>

                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="contact-form">
            <form name="frmlandlord" method="post" action="../Assets/Actionpages/LandlordUploadAction.jsp" enctype="multipart/form-data">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
                    <div class="control-group">
                        <input type="text" name="txtname" class="form-control" value="" placeholder="Enter Your Name" required onchange="nameval(this)">
                    <div id="name"></div>
                    </div><br>
                         <div class="control-group">
             <input type="radio" name='gender' value='Male'>Male
                        <input type="radio" name='gender' value='Female'>Female
                    
                        
                         </div><br>
                
                         <div class="control-group"><input class="form-control" placeholder="Enter Contact Number" type="text" name="txtcontact" value="" pattern="[0-9]{10}" required onchange="checknum(this)">
                   <div id="contact"></div>
                   </div>
                         <br>
                         
                         <div class="control-group"><input type="email" class="form-control" placeholder="Enter Your Email" name="email" value="" id="email" required onkeyup="emailval(this),checkEmail(this.value)">
                         <div id="content"></div></div>
                         <br>
                         
                         <div class="control-group"><input type="date" name="dob" class="form-control" value="" required></div><br>
                         
                    <div class="control-group">
                        <select name="district" style="background-color: transparent;" class="form-control" required onchange="getPlace(this.value)">
                            <option value="" style="text-align: center" selected>--Select District--</option>
                            <%
                             String st="select * from tbl_district";
                             ResultSet rs=con.selectCommand(st);
           
                                while(rs.next())
                                {
                         
                            %>
                            <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name") %></option>
                            <%
                             }
                            %>
                        </select>    
                    </div>  <br>
                    <div class="control-group">
                        <select name="place"  class="form-control" id="place" required="" style="background-color: transparent">
                            <option value="" selected="" style="text-align: center">--Select Place--</option>
                          
                        </select>    
                    </div><br>
                <div class="control-group"><textarea class="form-control" placeholder="Address" required data-validation-required-message="Please enter your Address" name="txtaddress"required></textarea>
                </div><br>
                <div class="control-group">
                        <label id="txt_label" style="color: white">Select Your Photo</label>
                    <input class="form-control" type="file" name="image"  required></div>
                <br>
                <div class="control-group">
                        <label id="txt_label" style="color: white">Select Your Proof</label>
                    <input class="form-control" type="file" name="proof"  required>
                </div><br>
                    <div class="control-group">
                        <input type="password" class="form-control" placeholder="Enter Password" name="txtpwd" value="" required></div>
              
                <br>
                <div class="control-group"><input class="form-control" placeholder="ENter Password" type="password" name="txtpwd1" value="" required onchange="chkpwd(this,txtpwd)">
                    <div id="pass"></div>
                </div><br>
                <div align="center">
                    <input type="submit" class="btn" name="btnsave" value="SAVE">
                    <input type="reset" class="btn" name="btncancel" value="CANCEL">
                </div> 
            </table>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
    
    <%@include file="Foot.jsp" %>
</html>
