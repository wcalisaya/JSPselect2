<%-- 
    Document   : index
    Created on : 21/08/2015, 12:55:34 AM
    Author     : Magwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="jsp/admin/conexion.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="resources/css/style.css">
        
    </head>
    <body>
        <%            
            consulta = "select * from guille ";
            ps = conex.prepareStatement(consulta);
            rs = ps.executeQuery();
        %>
        <div class="principal">
            <h2>GUILLERMO</h2>
            <form id="form">
                <input type="text" id="txtname" name="name" placeholder="nombre" required=""/><br>
                <input type="text" id="txtcargo" name="txtcargo" placeholder="cargo" required=""/><br>
                <input type="text" id="txtuser" name="txtuser" placeholder="username"/><br>
                <input type="password" id="txtpass" name="txtpass" placeholder="pass"/><br>

                <input type="hidden" id="accion" value="guardar">
                <input type="button" name="Add" value="Agregar" onclick="postAdd();">
            </form>
            <div style="display:none;" id="exito">
                <p>Se inserto OK.</p>
            </div>
        </div>
        <br>
        <input type="text" name="">
        <br>
        <br>
        <div class="listado" id="lista">
            <table>
                <tr class="cabecera">
                    <th>Nombre</th>    
                    <th>Cargo</th>    
                    <th>username</th>
                    <th>OPT</th>
                </tr>   
                <div id="mostrar"></div>
                <% while (rs.next()) {%>
                <tr>
                    <td><%=rs.getString("nombre")%></td>
                    <td><%=rs.getString("cargo")%></td>
                    <td><%=rs.getString("username")%></td>  
                    <td><a href="edit.jsp?idG=<%=rs.getString("id")%>">Edit</a></td>
                    <td><a href="jsp/dao/guilleDao.jsp?accion=eliminar&idG=<%=rs.getString("id")%>"
                           onclick="return confirm('¿Estas seguro de ELIMINAR?');">Delet</a>
                    </td>
                </tr>
                <%}%>
            </table>
        </div>
            <script src="resources/js/jquery-1.11.2.js"></script>
            <script src="resources/js/ajax.js"></script>
    </body>
</html>