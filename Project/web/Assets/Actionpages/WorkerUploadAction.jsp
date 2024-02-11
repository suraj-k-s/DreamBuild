<%-- 
    Document   : WorkerUploadAction
    Created on : 25 Jan, 2022, 12:53:07 PM
    Author     : asanj
--%>

<%@page import="java.sql.ResultSet"%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Citizen</title>
    </head>
    <body>
        <%

            File savedFile = null;
            FileItem f_item = null;

            String field_name = "";
            String file_name = "";
            String fn = "";
            String fnp = "";

            String field[] = new String[20];
            String value[] = new String[20];

//checking if request cotains multipart data
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);

            if (isMultipart) {
                System.out.println("ifff");

                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);

                //declaring a list of form fields
                List items_list = null;

                //assigning fields to list 'items_list'
                try {
                    items_list = upload.parseRequest(request);
                } catch (FileUploadException ex) {
                    out.println(ex);
                }

                //declaring iterator
                Iterator itr = items_list.iterator();
                int k = 0;
                //iterating through the list 'items_list'
                while (itr.hasNext()) {

                    //typecasting next element in items_list as fileitem
                    f_item = (FileItem) itr.next();

                    //checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc)
                    if (f_item.isFormField()) {

                        //getting fieldname and value
                        field[k] = f_item.getFieldName();
                        value[k] = f_item.getString();

                        k++;
                    } else {

           //f_item=(FileItem)itr.next();
                        file_name = f_item.getName();
                        field_name = f_item.getFieldName();
                        if (field_name.equals("image")) {
                            String ext = file_name.substring(file_name.lastIndexOf("."));
                            //setting path to store image
                            File proj_path = new File(config.getServletContext().getRealPath("/"));
                            String file_path = proj_path.getParentFile().getParentFile().getPath() + "\\web\\Assets\\Worker\\";
                            Random r = new Random();
                            int r_num = r.nextInt(1111) + 999;

                            fn = "Worker_" + r_num + ext;
                            //creating a file object
                            savedFile = new File(file_path + fn);
                            try {
                                //writing the file object
                                f_item.write(savedFile);

                            } catch (Exception ex) {
                                out.println(ex);
                            }
                        }

                        if (field_name.equals("proof")) {
                            String ext = file_name.substring(file_name.lastIndexOf("."));
                            //setting path to store image
                            File proj_path = new File(config.getServletContext().getRealPath("/"));
                            String file_path = proj_path.getParentFile().getParentFile().getPath() + "\\web\\Assets\\Worker\\";
                            Random r = new Random();
                            int r_num = r.nextInt(1111) + 999;

                            fnp = "WorkerProof_" + r_num + ext;
                            //creating a file object
                            savedFile = new File(file_path + fnp);
                            try {
                                //writing the file object
                                f_item.write(savedFile);

                            } catch (Exception ex) {
                                out.println(ex);
                            }
                        }

                    }

                }
    //Strinh str1="insert into tbl_wantedlist ()";
                //if((request.getParameter("txtpwd")).equals(request.getParameter("txtpwd1")))
                String s = "select * from tbl_worker where worker_email='" + value[4] + "'";
                ResultSet r = con.selectCommand(s);
                String st = "select * from tbl_landlord where landlord_email='" + value[4] + "'";
                ResultSet rt = con.selectCommand(st);
                String u = "select * from tbl_user where user_email='" + value[4] + "'";
                ResultSet stu = con.selectCommand(u);
                if (r.next()) {
        %> 
        <script type="text/javascript">
            alert("Existing Email..");
            setTimeout(function() {
                window.location.href = '../../Guest/Worker.jsp'
            }, 100);
        </script>
        <%
        } else if (rt.next()) {
        %> 
        <script type="text/javascript">
            alert("Existing Email..");
            setTimeout(function() {
                window.location.href = '../../Guest/Worker.jsp'
            }, 100);
        </script>
        <%
        } else if (stu.next()) {
        %> 
        <script type="text/javascript">
            alert("Existing Email..");
            setTimeout(function() {
                window.location.href = '../../Guest/Worker.jsp'
            }, 100);
        </script>
        <%
        } else {
            if (value[9].equals(value[10])) {
                String str1 = "insert into tbl_worker(worker_name,worker_gender,workertype_id,worker_contact,worker_email,worker_dob,place_id,worker_address,worker_photo,worker_proof,worker_password,worker_doj)values('" + value[0] + "','" + value[1] + "','" + value[2] + "','" + value[3] + "','" + value[4] + "','" + value[5] + "','" + value[7] + "','" + value[8] + "','" + fn + "','" + fnp + "','" + value[9] + "',curdate())";
                System.out.println(str1);

                boolean status = con.executeCommand(str1);

                if (status == true) {
                    DB.mailconnection m = new DB.mailconnection();
                    String mailid[] = {value[4]};
                    String name = value[0];
                    String subject = "Registartion SucessFull and Under Veification";
                   

                        String text = "Respected " + name + "  \r\n \r\n"
                                + " This is from Dream Build team,thank you for signing up to our service. \r\n"
                                + " We established Dream Build in order to bring the dream about your home come true. \r\n"
                                + " If you have any questions,and if there is anything we can improve please reply to this email. \r\n"
                                + " we were always happy to help!. \r\n \r\n"
                                + " Team Dream Build.";
                        boolean b = m.sendMail(mailid, subject, text);
                        System.out.println(b);

        %> 
        <script type="text/javascript">
            alert("Upload Successfully..");
            setTimeout(function() {
                window.location.href = '../../Guest/Worker.jsp'
            }, 100);
        </script>
        <%             
            }
        } else {
        %>
        <script type="text/javascript">
            alert("Password Mismatch..");
            setTimeout(function() {
                window.location.href = '../../Guest/Worker.jsp'
            }, 100);
        </script>        
        <%
                    }

                }
            }

        %>
    </body>
</html>

