<%-- 
    Document   : SerarchWorker
    Created on : 28 Jan, 2022, 1:37:09 PM
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
        <title>Search Worker</title>
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
  background-color: #f4511e;
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
           
            function getWorker()
            {
                    //alert(did);
                    var did=document.getElementById("district").value;
                    var pid=document.getElementById("place").value;
                    var wid=document.getElementById("worktype").value;
                    //alert(did);
                    $.ajax({
                    url: "../Assets/Ajaxpages/AjaxWorkerSearch.jsp?did="+did+"&pid="+pid+"&wid="+wid,
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
         <h1>Search Worker</h1>
         <div id="tab">
        <form name="frmsearch" method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
                <tr>
                <td>District
                    
                    <select name="district" id="district" required  onchange="getPlace(this.value),getWorker()">
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
                        
                        <select name="place" id="place" required onchange="getWorker()">
                            <option value="" selected>--Select--</option>
                          
                        </select>    
                    </td>
                    
                    <td>Work Type
                    
                        <select name="worktype" id="worktype" required onchange="getWorker()">
                            <option value="" selected>--Select--</option>
                            <%
                             String s="select * from tbl_workertype";
                             ResultSet rs=con.selectCommand(s);
           
                                while(rs.next())
                                {
                         
                            %>
                            <option value="<%=rs.getString("workertype_id")%>"><%=rs.getString("workertype_name") %></option>
                            <%
                             }
                            %>
                        </select>    
                    </td>
                </tr> 
                
            </table>
        </form>
                        <hr>
                        <br>
                        <div id="search">
                        <table cellpadding="80" align="center">
                            
                            <tr>
                                <%
                                String sel="select * from tbl_worker w inner join tbl_workertype wt on wt.workertype_id=w.workertype_id inner join tbl_place p on p.place_id=w.place_id inner join tbl_district d on d.district_id=p.district_id where w.worker_vstatus=1";
                                ResultSet rw=con.selectCommand(sel);
                                
                                int i=0;
                                while(rw.next())
                                {  
                                      int average_rating = 0;
                                        int total_review = 0;
                                        int five_star_review = 0;
                                        int four_star_review = 0;
                                        int three_star_review = 0;
                                        int two_star_review = 0;
                                        int one_star_review = 0;                                   
                                        int total_user_rating = 0;

                                        String query = "SELECT * FROM tbl_review where worker_id = '" + rw.getString("worker_id") + "' ORDER BY review_id DESC";
                                        ResultSet rs1 = con.selectCommand(query);
                                        while (rs1.next()) {
                                            if (rs1.getString("user_rating").equals("5")) {
                                                five_star_review++;
                                            }
                                            if (rs1.getString("user_rating").equals("4")) {
                                                four_star_review++;
                                            }
                                            if (rs1.getString("user_rating").equals("3")) {
                                                three_star_review++;
                                            }
                                            if (rs1.getString("user_rating").equals("2")) {
                                                two_star_review++;
                                            }
                                            if (rs1.getString("user_rating").equals("1")) {
                                                one_star_review++;
                                            }
                                            total_review++;
                                            total_user_rating = total_user_rating + Integer.parseInt(rs1.getString("user_rating"));
                                        }
                                        if (total_user_rating > 0) {
                                            average_rating = total_user_rating / total_review;
                                        }
                                    
                                i++;
                            %>
                            <td class="zoom"><p style="text-align:center;border:1px solid #999;margin:22px;padding:10px">
                                    <img src="../Assets/Worker/<%=rw.getString("worker_photo")%>" width="100" height="100"><br>
                                    Name:<%=rw.getString("worker_name")%><br>
                                    Contact: <%=rw.getString("worker_contact") %><br>
                                    Rating:<%=average_rating%>
                                    
                                    <br>
                                    <button class="btn"><a href="ViewPreviousWork.jsp?wid=<%=rw.getString("worker_id")%>">View Previous Work</a></button>
                                    <br>
                                    <button class="btn"><a href="ViewLatestWork.jsp?wid=<%=rw.getString("worker_id")%>">View Latest Work</a></button>
                                    <br>
                                    <button class="btn"><a href="ViewService.jsp?wid=<%=rw.getString("worker_id")%>">View Services</a></button>
                                    <br>
                                    <button class="btn"><a href="Wishlist.jsp?wid=<%=rw.getString("worker_id")%>">Add to wishlist</a></button>
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
