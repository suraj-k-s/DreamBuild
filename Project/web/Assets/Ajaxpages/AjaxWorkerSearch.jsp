<%-- 
    Document   : AjaxDistrictWorkerSearch
    Created on : 28 Jan, 2022, 3:37:23 PM
    Author     : asanj
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
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
    </head>
    <body>
<%
    String did="", pid="", wid="";
    did=request.getParameter("did");
    pid=request.getParameter("pid");
    wid=request.getParameter("wid");
    
    String sel="select * from tbl_worker w inner join tbl_workertype wt on wt.workertype_id=w.workertype_id inner join tbl_place p on p.place_id=w.place_id inner join tbl_district d on d.district_id=p.district_id where w.worker_vstatus=1";
    if(did!="")
    {
        sel+=" and d.district_id='"+did+"' ";
    }
    if(pid!="")
    {
        sel+=" and p.place_id='"+pid+"' ";
    }
    if(wid!="")
    {
        //out.println(wid);
        sel+=" and wt.workertype_id='"+wid+"' ";
        //out.println(sel);
    }
    %>
<table align="center">
    <tr>
<%
    ResultSet rs=con.selectCommand(sel);
    System.out.println(sel);
    int i=0;
    while(rs.next())
    {
          int average_rating = 0;
                                        int total_review = 0;
                                        int five_star_review = 0;
                                        int four_star_review = 0;
                                        int three_star_review = 0;
                                        int two_star_review = 0;
                                        int one_star_review = 0;                                   
                                        int total_user_rating = 0;

                                        String query = "SELECT * FROM tbl_review where worker_id = '" + rs.getString("worker_id") + "' ORDER BY review_id DESC";
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
                <img src="../Assets/Worker/<%=rs.getString("worker_photo")%>" width="100" height="100"><br>
           Name: <%=rs.getString("worker_name") %><br>
           Contact: <%=rs.getString("worker_contact") %><br>
             Rating:<%=average_rating%>
             
             <br>
             <button class="btn"> <a href="ViewPreviousWork.jsp?wid=<%=rs.getString("worker_id")%>">View Previous Work</a></button>
                                    <br>
                                    <button class="btn"> <a href="ViewLatestWork.jsp?wid=<%=rs.getString("worker_id")%>">View Latest Work</a></button>
                                    <br>
                                    <button class="btn"> <a href="ViewService.jsp?wid=<%=rs.getString("worker_id")%>">View Services</a></button>
                                    <br>
                                    <button class="btn"><a href="Wishlist.jsp?wid=<%=rs.getString("worker_id")%>">Add to wishlist</a></button>
            </p></td>
     <% 
            if(i%4==0)
            {
                out.println("</tr>");
                                
                out.println("<tr>");
                 i=0;
            }
    }
%>
</table>
</body>
</html>