<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("shopid") == null)
        {
            response.sendRedirect("../");
        }
    %>