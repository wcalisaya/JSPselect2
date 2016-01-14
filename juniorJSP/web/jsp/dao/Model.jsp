<%
    String accion = request.getParameter("accion") == null ? "" : request.getParameter("accion");
    String idG = request.getParameter("idG") == null ? "" : request.getParameter("idG");
    String nombre = request.getParameter("nombre") == null ? "" : request.getParameter("nombre");
    String cargo = request.getParameter("cargo") == null ? "" : request.getParameter("cargo");
    String user = request.getParameter("user") == null ? "" : request.getParameter("user");
    String pass = request.getParameter("pass") == null ? "" : request.getParameter("pass");
%>