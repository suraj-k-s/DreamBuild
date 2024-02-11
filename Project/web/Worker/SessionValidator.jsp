<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("workerid") == null)
        {
            response.sendRedirect("../");
        }
    %>