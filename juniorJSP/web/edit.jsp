<%-- 
    Document   : index
    Created on : 21/08/2015, 12:55:34 AM
    Author     : Magwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="jsp/admin/conexion.jsp" %>
<%@include file="jsp/dao/Model.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="resources/css/style.css">
    </head>
    <body>
        <%
        consulta = ("select * from guille where id = ?");
        ps = conex.prepareStatement(consulta);
        ps.setString(1, request.getParameter("idG"));
        rs = ps.executeQuery();
        %>
        
        <div class="principal">
        <%if (rs.next()){
        %>    
            <form action="jsp/dao/guilleDao.jsp" method="POST">
                <input type="text" name="txtname" value="<%=rs.getString("nombre")%>"/><br>
                <input type="text" name="txtcargo" value="<%=rs.getString("cargo") %>" /><br>
                <input type="hidden" name="accion" value="actualizar">
                <%}%> 
                 <input type="hidden" name="idG" value="<%=rs.getString("id")%>">
                <input type="submit" name="update" value="Actualizar">
                
            </form>    
               
        </div>
        <br>


    </body>
</html>