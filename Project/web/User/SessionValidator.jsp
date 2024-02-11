<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("userid") == null)
        {
            response.sendRedirect("../");
        }
    %>