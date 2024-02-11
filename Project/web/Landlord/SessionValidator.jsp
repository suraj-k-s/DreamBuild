<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("landlordid") == null)
        {
            response.sendRedirect("../");
        }
    %>