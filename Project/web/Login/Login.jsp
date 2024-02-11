<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="en">
<head>
    <%
            if(request.getParameter("btnlogin")!=null)
            {
                String selu="select * from tbl_user where user_email='"+request.getParameter("txtuname")+"' and user_password='"+request.getParameter("txtpwd")+"' ";
                ResultSet rs=con.selectCommand(selu);
                
                String selw="select * from tbl_worker where worker_email='"+request.getParameter("txtuname")+"' and worker_password='"+request.getParameter("txtpwd")+"' and worker_vstatus='1'";
                ResultSet rs1=con.selectCommand(selw);
                
                String sell="select * from tbl_landlord where landlord_email='"+request.getParameter("txtuname")+"' and landlord_password='"+request.getParameter("txtpwd")+"' and landlord_vstatus='1'";
                ResultSet res=con.selectCommand(sell);
                
                String selAdmin="select * from tbl_admin where admin_username='"+request.getParameter("txtuname")+"' and admin_password='"+request.getParameter("txtpwd")+"' ";
                ResultSet rsAdmin=con.selectCommand(selAdmin);
                
                String sels="select * from tbl_shop where shop_email='"+request.getParameter("txtuname")+"' and shop_password='"+request.getParameter("txtpwd")+"' and shop_vstatus='1'";
                ResultSet ress=con.selectCommand(sels);
                
                if(rs.next())
                {
                    session.setAttribute("userid",rs.getString("user_id"));
                    session.setAttribute("username", rs.getString("user_name"));
                    response.sendRedirect("../User/Homepage.jsp");
                }
                else if(rs1.next())
                {
                    session.setAttribute("workerid",rs1.getString("worker_id"));
                    session.setAttribute("workername", rs1.getString("worker_name"));
                    response.sendRedirect("../Worker/Homepage.jsp");
                }
                else if(res.next())
                {
                    session.setAttribute("landlordid",res.getString("landlord_id"));
                    session.setAttribute("landlordname", res.getString("landlord_name"));
                    response.sendRedirect("../Landlord/Homepage.jsp");
                }
                else if(ress.next())
                {
                    session.setAttribute("shopid",ress.getString("shop_id"));
                    session.setAttribute("shopname", ress.getString("shop_name"));
                    response.sendRedirect("../Shop/Homepage.jsp");
                }
                 else if(rsAdmin.next())
                {
                    session.setAttribute("adminid",rsAdmin.getString("admin_id"));
                    session.setAttribute("adminusername", rsAdmin.getString("admin_username"));
                    response.sendRedirect("../Admin/Homepage.jsp");
                }
                else
                {
                    %>
                    <script>alert('Invalid Login')</script>
                    <%
                }
            }
        %>
	<title>Login </title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="images/img-01.png" alt="IMG">
				</div>

                            <form class="login100-form validate-form" method="post">
					<span class="login100-form-title">
						 Login
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="txtuname" placeholder="Email">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="txtpwd" placeholder="Password">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="container-login100-form-btn">
                                            <button class="login100-form-btn" name="btnlogin">
							Login
						</button>
					</div>

					<div class="text-center p-t-12">
						<span class="txt1">
							Forgot
						</span>
						<a class="txt2" href="#">
							Username / Password?
						</a>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="#">
							Create your Account
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	

	
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>