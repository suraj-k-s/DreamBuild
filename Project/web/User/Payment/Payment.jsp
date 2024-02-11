<%-- 
    Document   : Payment.jsp
    Created on : 26-Jan-2020, 16:42:43
    Author     : hp -pc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String name="";
    String sel="select * from tbl_user where user_id='"+session.getAttribute("userid")+"'";
    System.out.println(sel);
    ResultSet rsc=con.selectCommand(sel);
    rsc.next();
    name=rsc.getString("user_name");
 session.setAttribute("name", name);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="payment.css">
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <title>Document</title>
</head>

<section class="section">
	<h1>Payment Gateway....</h1>

	<div class="form-progress">
		<progress class="form-progress-bar" min="0" max="100" value="0" step="33" aria-labelledby="form-progress-completion"></progress>
		
		<div class="form-progress-indicator one active"></div>
		<div class="form-progress-indicator two"></div>
		<div class="form-progress-indicator three"></div>
		<div class="form-progress-indicator four"></div>
		
		<p id="form-progress-completion" class="js-form-progress-completion sr-only" aria-live="polite">0% complete</p>
	</div>
	
	
	<div class="animation-container">
		<!-- Step one -->
		<div class="form-step js-form-step" data-step="1">

			<p class="form-instructions"><strong>Lorem ipsum dolor sit amet consectetur adipisicing.</strong><br>
				Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi vitae corrupti assumenda expedita incidunt?<sup><small>TM</small></sup> Lorem ipsum dolor sit amet.</p>

			<form action="" name="form-step-1">
				<div class="fieldgroup">
                                    <input type="text" name="firstName" id="firstName"  value="<%=session.getAttribute("name")%>"/>
					<label class="control-label" for="firstName">Name</label></label><i class="bar"></i>
				</div>
				
				      <div class="form-group">
                                          <textarea ><%=session.getAttribute("total")%></textarea>
        <label for="textarea" class="control-label">Amount</label><i class="bar"></i>
      </div>
        
      <div class="form-group">
          <textarea ></textarea>
        <label for="textarea" class="control-label">Order Address</label><i class="bar"></i>
      </div>
				
                                 <div class="form-group">
                                    <textarea ></textarea>
                                     <label for="textarea" class="control-label">Email</label><i class="bar"></i>
                                 </div>

				<div class="fieldgroup">
					<input type="text" name="postalCode" id="postalCode" />
					<label class="control-label" for="postalCode">Postal code</label><i class="bar"></i>
				</div>

				<div class="buttons">
							<!-- <button type="button" class="btn btn-alt js-reset">Reset</button> -->

						<button type="submit" class="btn">Continue</button>
				</div>
			</form>

		</div>
		
			<!-- Step two -->
			<div class="form-step js-form-step waiting hidden" data-step="2">

				<p class="form-instructions"><strong>Lorem, ipsum dolor sit amet consectetur adipisicing.</strong>
						<br>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, modi!</p>

				<form action="" name="form-step-2">
          <div class="form-radio">
                    <div class="radio">
                    	<label>
                        	<input type="radio" name="radio" value="visa"/>
                        	<i class="helper"></i>
						</label>
                        	<img style="margin-left: 20px" width="40" height="40" src="icons/visa.svg" alt='visa' />
                    </div>
                    <div class="radio">
                    	<label>
                        	<input type="radio" name="radio" value="master"/>
							<i class="helper"></i>
						</label>
                        <img style="margin-left: 20px" width="40" height="40" src="icons/mastercard.svg" alt='jcb' />
                    </div>
                    <div class="radio">
                    	<label>
	                        <input type="radio" name="radio" value="jcb"/>
	                        <i class="helper"></i>
	                    </label>

                        <img style="margin-left: 20px" width="40" height="40" src="icons/jcb.svg" alt='jcb' />
                    </div>
          </div>
						<div class="buttons">
								<!-- <button type="button" class="btn btn-alt js-reset">Reset</button> -->
								<button type="submit" class="btn">Continue</button>
						</div>
				</form>

		</div>
		
		
		
					<!-- Step three -->
			<div class="form-step js-form-step waiting hidden" data-step="3">

				<p class="form-instructions"><strong>Lorem ipsum dolor sit amet consectetur adipisicing elit.</strong>
						<br>Lorem ipsum, dolor sit amet consectetur adipisicing elit. A, dolores sunt quia voluptates sit omnis.</p>

				<form action="" name="form-step-3">
						<div class="fieldgroup">
								<input type="text" name="credit-card" id="credit-card" />
								<label for="credit-card">Credit card number</label>
						</div>
					
						<div class="fieldgroup">
								<input type="text" name="credit-card-expiry" id="credit-card-expiry" />
								<label for="credit-card-expiry">Credit card expiry</label>
						</div>

						<div class="buttons">
								<!-- <button type="button" class="btn btn-alt js-reset">Reset</button> -->

								<button type="submit" class="btn">Continue</button>
						</div>
				</form>

		</div>
		
		
		
		<!-- Step four -->
			<div class="form-step js-form-step waiting hidden" data-step="4">

				<p class="form-instructions"><strong>Lorem ipsum dolor sit amet consectetur adipisicing elit.</strong>
						<br> Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt fuga inventore incidunt itaque quae? Debitis.</p>

				<!-- <form action="" name="form-step-4">
          <div class="checkbox">
            <label>
              <input type="checkbox"/><i class="helper"></i>I Agree
            </label>
          </div>
          <div class="form-radio">
            <div class="radio">
              <label>
                <input type="radio" name="radio"/><i class="helper"></i>I'm the label from a radio button
              </label>
            </div>
            <div class="radio">
              <label>
                <input type="radio" name="radio"/><i class="helper"></i>I'm the label from a radio button
              </label>
            </div>
          </div>
						<div class="buttons"> -->
								<!-- <button type="button" class="btn btn-alt js-reset">Reset</button> -->
						<!-- </div>
        </form> -->
        
        <!-- Success check starts here -->
        <div class="success-checkmark">
          <div class="check-icon">
            <span class="icon-line line-tip"></span>
            <span class="icon-line line-long"></span>
            <div class="icon-circle"></div>
            <div class="icon-fix"></div>
          </div>
        </div>
        <!-- Success ends here -->
        <div align="center">
            <form method="post">
                <a href="Payment.jsp?id=1" class="l">Done</a>
                   <!-- <input type="submit" class="btn" name="btndone">-->
            </form>
        </div>

		</div>
	</div>
</section>
<!-- scripts -->
<script src="jquery-3.4.1.min.js"></script>
<script src="progress-controller.js"></script>
<script src="select_search.js"></script>
</body>
</html>
<%
    if(request.getParameter("id")!=null){
        String up="update tbl_carthead set  payment_status=1 where cart_id='"+session.getAttribute("spid")+"'";
        con.executeCommand(up);
        response.sendRedirect("../Homepage.jsp");
    }
%>
