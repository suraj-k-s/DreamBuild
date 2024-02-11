<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String usercount="", aworker="", rworker="", alord="", rlord="", ashop="", rshop="";
    String sel="select count(user_id) as id from tbl_user";
    ResultSet rs=con.selectCommand(sel);
    rs.next();
    usercount=rs.getString("id");
    
    String se="select count(worker_id) as wid from tbl_worker where worker_vstatus='1'";
    ResultSet r=con.selectCommand(se);
    r.next();
    aworker=r.getString("wid");
    
    String s="select count(worker_id) as rwid from tbl_worker where worker_vstatus='2'";
    ResultSet rw=con.selectCommand(s);
    rw.next();
    rworker=rw.getString("rwid");
    
    String sland="select count(landlord_id) as lid from tbl_landlord where landlord_vstatus='1'";
    ResultSet rl=con.selectCommand(sland);
    rl.next();
    alord=rl.getString("lid");
    
    String sla="select count(landlord_id) as lid from tbl_landlord where landlord_vstatus='2'";
    ResultSet rlr=con.selectCommand(sla);
    rlr.next();
    rlord=rlr.getString("lid");
    
    String sshop="select count(shop_id) as sid from tbl_shop where shop_vstatus='1'";
    ResultSet rsh=con.selectCommand(sshop);
    rsh.next();
    ashop=rsh.getString("sid");
    
    String ssh="select count(shop_id) as sid from tbl_shop where shop_vstatus='2'";
    ResultSet rh=con.selectCommand(ssh);
    rh.next();
    rshop=rh.getString("sid");
%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Dream Build</title>

        <!-- <link rel="icon" href="img/favicon.png" type="image/png"> -->
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../Template/Admin/css/bootstrap.min.css" />
        <!-- themefy CSS -->
        <link rel="stylesheet" href="../Template/Admin/vendors/themefy_icon/themify-icons.css" />
        <!-- swiper slider CSS -->
        <link rel="stylesheet" href="../Template/Admin/vendors/swiper_slider/css/swiper.min.css" />
        <!-- select2 CSS -->
        <link rel="stylesheet" href="../Template/Admin/vendors/select2/css/select2.min.css" />
        <!-- select2 CSS -->
        <link rel="stylesheet" href="../Template/Admin/vendors/niceselect/css/nice-select.css" />
        <!-- owl carousel CSS -->
        <link rel="stylesheet" href="../Template/Admin/vendors/owl_carousel/css/owl.carousel.css" />
        <!-- gijgo css -->
        <link rel="stylesheet" href="../Template/Admin/vendors/gijgo/gijgo.min.css" />
        <!-- font awesome CSS -->
        <link rel="stylesheet" href="../Template/Admin/vendors/font_awesome/css/all.min.css" />
        <link rel="stylesheet" href="../Template/Admin/vendors/tagsinput/tagsinput.css" />
        <!-- datatable CSS -->
        <link rel="stylesheet" href="../Template/Admin/vendors/datatable/css/jquery.dataTables.min.css" />
        <link rel="stylesheet" href="../Template/Admin/vendors/datatable/css/responsive.dataTables.min.css" />
        <link rel="stylesheet" href="../Template/Admin/vendors/datatable/css/buttons.dataTables.min.css" />
        <!-- text editor css -->
        <link rel="stylesheet" href="../Template/Admin/vendors/text_editor/summernote-bs4.css" />
        <!-- morris css -->
        <link rel="stylesheet" href="../Template/Admin/vendors/morris/morris.css">
        <!-- metarial icon css -->
        <link rel="stylesheet" href="../Template/Admin/vendors/material_icon/material-icons.css" />

        <!-- menu css  -->
        <link rel="stylesheet" href="../Template/Admin/css/metisMenu.css">
        <!-- style CSS -->
        <link rel="stylesheet" href="../Template/Admin/css/style.css" />
        <link rel="stylesheet" href="../Template/Admin/css/colors/default.css" id="colorSkinCSS">
    </head>
    <body class="crm_body_bg">



        <!-- main content part here -->

        <!-- sidebar  -->
        <!-- sidebar part here -->
        <nav class="sidebar">
            <div class="logo d-flex justify-content-between">
                <a href="index.html"><img src="img/logo.png" alt=""></a>
                <div class="sidebar_close_icon d-lg-none">
                    <i class="ti-close"></i>
                </div>
            </div>
            <ul id="sidebar_menu">
                <li class="side_menu_title">
                    <span>Dashboard</span>
                </li>
                <li class="mm-active">
                    <a  href="#"  aria-expanded="false">
                        <img src="../Template/Admin/img/menu-icon/1.svg" alt="">
                        <span>Dashboard</span>
                    </a>
                   
                </li>
                <li class="side_menu_title">
                    <span>Applications</span>
                </li>
                <li class="">
                    <a   class="has-arrow" href="#" aria-expanded="false">
                        <img src="../Template/Admin/img/menu-icon/2.svg" alt="">
                        <span>Basic Data</span>
                    </a>
                    <ul>
                        <li><a href="District.jsp">District</a></li>
                        <li><a href="Place.jsp">Place</a></li>
                        <li><a href="Location.jsp">Location</a></li>
                    </ul>
                </li>
                <li class="">
                    <a   class="has-arrow" href="#" aria-expanded="false">
                        <img src="../Template/Admin/img/menu-icon/2.svg" alt="">
                        <span>Verification</span>
                    </a>
                    <ul>
                        <li><a href="Landlordlist.jsp">Landlord</a></li>
                        <li><a href="Shoplist.jsp">Shop</a></li>
                        <li><a href="Workerlist.jsp">Worker</a></li>
                    </ul>
                </li>
                <li class="">
                    <a   class="has-arrow" href="#" aria-expanded="false">
                        <img src="../Template/Admin/img/menu-icon/2.svg" alt="">
                        <span>LogOut</span>
                    </a>
                    <ul>
                        <li><a href="../Login/Login.jsp">LogOut</a></li>
                        
                    </ul>
                </li>
            </ul>

        </nav>
        <!-- sidebar part end -->
        <!--/ sidebar  -->


        <section class="main_content dashboard_part">
            <!-- menu  -->
           
            <!--/ menu  -->
            <div class="main_content_iner ">
                <div class="container-fluid p-0">
                    <div class="row justify-content-center">
                        <div class="col-lg-12">
                            <div class="single_element">
                                <div class="quick_activity">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="quick_activity_wrap">
                                                <div class="single_quick_activity d-flex">
                                                    <div class="icon">
                                                        <img src="img/icon/College.png" alt="">
                                                    </div>
                                                    <div class="count_content">
                                                        <h3><span class="counter"><%=usercount%></span> </h3>
                                                        <p>User</p>
                                                    </div>
                                                </div>
                                                <div class="single_quick_activity d-flex">
                                                    <div class="icon">
                                                        <img src="img/icon/Department.png" alt="">
                                                    </div>
                                                    <div class="count_content">
                                                        <h3><span class="counter"><%=aworker%></span> </h3>
                                                        <p>Accepted Workers</p>
                                                    </div>
                                                </div>
                                                <div class="single_quick_activity d-flex">
                                                    <div class="icon">
                                                        <img src="img/icon/professor.png" alt="">
                                                    </div>
                                                    <div class="count_content">
                                                        <h3><span class="counter"><%=rworker%></span> </h3>
                                                        <p>Rejected Workers</p>
                                                    </div>
                                                </div>
                                                <div class="single_quick_activity d-flex">
                                                    <div class="icon">
                                                        <img src="img/icon/Student.png" alt="">
                                                    </div>
                                                    <div class="count_content">
                                                        <h3><span class="counter"><%=alord%></span> </h3>
                                                        <p>Accepted Landlords</p>
                                                    </div>
                                                </div>
                                                <div class="single_quick_activity d-flex">
                                                    <div class="icon">
                                                        <img src="img/icon/Student.png" alt="">
                                                    </div>
                                                    <div class="count_content">
                                                        <h3><span class="counter"><%=rlord%></span> </h3>
                                                        <p>Rejected Landlords</p>
                                                    </div>
                                                </div>
                                                <div class="single_quick_activity d-flex">
                                                    <div class="icon">
                                                        <img src="img/icon/Student.png" alt="">
                                                    </div>
                                                    <div class="count_content">
                                                        <h3><span class="counter"><%=ashop%></span> </h3>
                                                        <p>Accepted Shops</p>
                                                    </div>
                                                </div>
                                                <div class="single_quick_activity d-flex">
                                                    <div class="icon">
                                                        <img src="img/icon/Student.png" alt="">
                                                    </div>
                                                    <div class="count_content">
                                                        <h3><span class="counter"><%=rshop%></span> </h3>
                                                        <p>Rejected Shops</p>
                                                    </div>
                                                </div>        
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-12">
                            <div class="white_box card_height_100">
                                <div class="box_header border_bottom_1px  ">
                                    <div class="main-title">
                                        <h3 class="mb_25">Workers</h3>
                                    </div>
                                </div>
                               
                                <div class="staf_list_wrapper sraf_active owl-carousel">
                                     <%
                                String wo="select * from tbl_worker where worker_vstatus='1'";
                                ResultSet w=con.selectCommand(wo);
                                while(w.next())
                                {
                                %>
                                    <!-- single carousel  -->
                                    <div class="single_staf">
                                        <div class="staf_thumb">
                                            <img src="../Assets/Worker/<%=w.getString("worker_photo")%>" alt="">
                                        </div>
                                        <h4><%=w.getString("worker_name")%></h4>
                                        <p><%=w.getString("worker_contact")%></p>
                                        
                                    </div>
                                   
                                     <%}%>
                                     
                                </div>
                                  <div class="box_header border_bottom_1px  ">
                                    <div class="main-title">
                                        <h3 class="mb_25">Landlords</h3>
                                    </div>
                                </div>
                               
                                <div class="staf_list_wrapper sraf_active owl-carousel">
                                     <%
                                String wodd="select * from tbl_landlord where landlord_vstatus='1'";
                                ResultSet wdd=con.selectCommand(wodd);
                                while(wdd.next())
                                {
                                %>
                                    <!-- single carousel  -->
                                    <div class="single_staf">
                                        <div class="staf_thumb">
                                            <img src="../Assets/Landlord/<%=wdd.getString("landlord_photo")%>" alt="">
                                        </div>
                                        <h4><%=wdd.getString("landlord_name")%></h4>
                                        <p><%=wdd.getString("landlord_contact")%></p>
                                        
                                    </div>
                                   
                                     <%}%>
                                     
                                </div>  
                                       <div class="box_header border_bottom_1px  ">
                                    <div class="main-title">
                                        <h3 class="mb_25">Shops</h3>
                                    </div>
                                </div>
                               
                                <div class="staf_list_wrapper sraf_active owl-carousel">
                                     <%
                                String ll="select * from tbl_shop where shop_vstatus='1'";
                                ResultSet lal=con.selectCommand(ll);
                                while(lal.next())
                                {
                                %>
                                    <!-- single carousel  -->
                                    <div class="single_staf">
                                        <div class="staf_thumb">
                                            <img src="../Assets/Shop/<%=lal.getString("shop_logo")%>" alt="">
                                        </div>
                                        <h4><%=lal.getString("shop_name")%></h4>
                                        <p><%=lal.getString("shop_contact")%></p>
                                        
                                    </div>
                                   
                                     <%}%>
                                     
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </section>
        <!-- main content part end -->

        <!-- footer  -->
        <!-- jquery slim -->
        <script src="../Template/Admin/js/jquery-3.4.1.min.js"></script>
        <!-- popper js -->
        <script src="../Template/Admin/js/popper.min.js"></script>
        <!-- bootstarp js -->
        <script src="../Template/Admin/js/bootstrap.min.js"></script>
        <!-- sidebar menu  -->
        <script src="../Template/Admin/js/metisMenu.js"></script>
        <!-- waypoints js -->
        <script src="../Template/Admin/vendors/count_up/jquery.waypoints.min.js"></script>
        <!-- waypoints js -->
        <script src="../Template/Admin/vendors/chartlist/Chart.min.js"></script>
        <!-- counterup js -->
        <script src="../Template/Admin/vendors/count_up/jquery.counterup.min.js"></script>
        <!-- swiper slider js -->
        <script src="../Template/Admin/vendors/swiper_slider/js/swiper.min.js"></script>
        <!-- nice select -->
        <script src="../Template/Admin/vendors/niceselect/js/jquery.nice-select.min.js"></script>
        <!-- owl carousel -->
        <script src="../Template/Admin/vendors/owl_carousel/js/owl.carousel.min.js"></script>
        <!-- gijgo css -->
        <script src="../Template/Admin/vendors/gijgo/gijgo.min.js"></script>
        <!-- responsive table -->
        <script src="../Template/Admin/vendors/datatable/js/jquery.dataTables.min.js"></script>
        <script src="../Template/Admin/vendors/datatable/js/dataTables.responsive.min.js"></script>
        <script src="../Template/Admin/vendors/datatable/js/dataTables.buttons.min.js"></script>
        <script src="../Template/Admin/vendors/datatable/js/buttons.flash.min.js"></script>
        <script src="../Template/Admin/vendors/datatable/js/jszip.min.js"></script>
        <script src="../Template/Admin/vendors/datatable/js/pdfmake.min.js"></script>
        <script src="../Template/Admin/vendors/datatable/js/vfs_fonts.js"></script>
        <script src="../Template/Admin/vendors/datatable/js/buttons.html5.min.js"></script>
        <script src="../Template/Admin/vendors/datatable/js/buttons.print.min.js"></script>

        <script src="../Template/Admin/js/chart.min.js"></script>
        <!-- progressbar js -->
        <script src="../Template/Admin/vendors/progressbar/jquery.barfiller.js"></script>
        <!-- tag input -->
        <script src="../Template/Admin/vendors/tagsinput/tagsinput.js"></script>
        <!-- text editor js -->
        <script src="../Template/Admin/vendors/text_editor/summernote-bs4.js"></script>

        <script src="../Template/Admin/vendors/apex_chart/apexcharts.js"></script>

        <!-- custom js -->
        <script src="../Template/Admin/js/custom.js"></script>

        <script src="../Template/Admin/vendors/apex_chart/bar_active_1.js"></script>
        <script src="../Template/Admin/vendors/apex_chart/apex_chart_list.js"></script>
    </body>
</html>