<%-- 
    Document   : SearchShop
    Created on : 11 Mar, 2022, 10:30:10 AM
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
        <title>Search Shop</title>
        <link rel="stylesheet" href="form.css">
        <style>
.zoom {
  padding: 50px;
  background-color: palegreen;
  transition: transform .2s; /* Animation */
  width: 300px;
  height: 200px;
  margin: 0 auto;
}

.zoom:hover {
  transform: scale(1.5); /* (150% zoom - Note: if the zoom is too large, it will go outside of the viewport) */
}
.btn {
  background-color: null ;
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  font-size: 16px;
  margin: 4px 2px;
  opacity: 0.6;
  transition: 0.3s;
  text-decoration: none;
}
a{
    text-decoration: none;
}

.btn:hover {opacity: 1}
</style>
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
           
            function getShop()
            {
                    //alert(did);
                    var did=document.getElementById("district").value;
                    var pid=document.getElementById("place").value;
                    //var wid=document.getElementById("worktype").value;
                    //alert(did);
                    $.ajax({
                    url: "../Assets/Ajaxpages/AjaxShopSearch.jsp?did="+did+"&pid="+pid,
                      success: function(html){
                            $("#search").html(html);
                            //alert(html);
                      }
                    });
            }
            
        </script>
        
    </head>
    <body>
       
         <%@include file="Head.jsp" %>
          <h1>Search Shop</h1>
         <div id="tab">
        <form name="frmsearch" method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
                <tr>
                <td>District
                    
                    <select name="district" id="district" required  onchange="getPlace(this.value),getShop()">
                            <option value="" selected>--Select--</option>
                            <%
                             String st="select * from tbl_district";
                             ResultSet r=con.selectCommand(st);
           
                                while(r.next())
                                {
                         
                            %>
                            <option value="<%=r.getString("district_id")%>"><%=r.getString("district_name") %></option>
                            <%
                             }
                            %>
                        </select>    
                    </td>
                
                    <td>Place
                        
                        <select name="place" id="place" required onchange="getShop()">
                            <option value="" selected>--Select--</option>
                          
                        </select>    
                    </td>
                    
                    
                </tr> 
                
            </table>
        </form>
                        <hr>
                        <br>
                        <div id="search">
                        <table align="center">
                            
                            <tr>
                                <%
                                String sel="select * from tbl_shop w inner join tbl_place p on p.place_id=w.place_id inner join tbl_district d on d.district_id=p.district_id where w.shop_vstatus=1";
                                ResultSet rw=con.selectCommand(sel);
                                
                                int i=0;
                                while(rw.next())
                                {  
                                    
                                i++;
                            %>
                            <td class="zoom"><p style="text-align:center;border:1px solid #999;margin:22px;padding:10px">
                                    <img src="../Assets/Shop/<%=rw.getString("shop_logo")%>" width="100" height="100"><br>
                                    Name:<%=rw.getString("shop_name")%><br>
                                    Contact:<%=rw.getString("shop_contact")%><br>
                                    Email:<%=rw.getString("shop_email")%><br>
                                   
                                    <br>
                                    <button class="btn"><a href="ViewProducts.jsp?sid=<%=rw.getString("shop_id")%>">View Products</a></button>
                                    <br>
                                    <!-- 
                                    <a href="ViewLatestWork.jsp?wid=<%//=rw.getString("worker_id")%>">View Latest Work</a>
                                    <br>
                                    <a href="ViewService.jsp?wid=<%//=rw.getString("worker_id")%>">View Services</a>
                                    <br>
                                    <a href="Wishlist.jsp?wid=<%//=rw.getString("worker_id")%>">Add to wishlist</a>
                               -->
                                  </p></td>
                            <%
                            if(i%4==0){
                                out.println("</tr>");
                                
                                out.println("<tr>");
                                i=0;
                            }
                                }
                            %>
       
        </table>
                        </div>
         </div>             
    </body>
    <br>  <br>  <br>  <br>  <br>  <br>  <br>
    <%@include file="Foot.jsp" %>
</html>

