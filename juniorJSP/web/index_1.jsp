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
        <link href="resources/css/select2.css" rel="stylesheet" />
        <link href="resources/css/bootstrap.min.css" rel="stylesheet"/>
        <script src="resources/js/jquery-1.12.0.min.js"></script>
        <script src="resources/js/select2.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#multiple").select2({
                  placeholder: "Seleccione",
                   maximumSelectionLength: 2
                });
            });
        </script>
    </head>
    <body>
        <div class="principal">
            <h2>GUILLERMO</h2>
            <form action="jsp/dao/guilleDao.jsp" method="POST">
                <input type="text" name="nombre" placeholder="nombre wi" required=""/><br>
                <input type="text" name="cargo" placeholder="cargo" required=""/><br>
                <input type="text" name="user" placeholder="username"/><br>
                <input type="password" name="pass" placeholder="pass"/><br>
                <input type="hidden" name="accion" value="guardar">
                <input type="submit" name="Add" value="Agregar">
            </form>    

            <br>
            <div class="listado">
                <table border="1">
                    <tr>
                    <form action="index_1.jsp" method="POST">
                        <%  consulta = "SELECT * FROM guille group by nombre";
                            ps = conex.prepareStatement(consulta);
                            rs = ps.executeQuery();
                        %> 
                        Buscar: 
                        <div class="select2-container select2-container-multi populate" id="s2id_e9" style="width:300px">
                            <select id="multiple" class="form-control" name="txtbuscar">
                            <option value=""></option>
                            <% while (rs.next()) {%>
                            <option value="<%=rs.getString("nombre")%>"><%=rs.getString("nombre")%></option>
                            <%}%>
                        </select>
                        </div>
                        <input class="btn btn-success"type="submit" value="Search"/>
                        
                    </form>
                    <br>
                    </tr>
                    <tr class="cabecera">
                        <th>Nombre</th>    
                        <th>Cargo</th>    
                        <th>username</th>
                        <th>OPT</th>
                    </tr>
                    <%  String valor = "%" + request.getParameter("txtbuscar") + "%";
                        consulta = "SELECT * FROM guille WHERE nombre LIKE ? OR cargo LIKE ? OR username LIKE ?";
                        ps = conex.prepareStatement(consulta);
                        ps.setString(1, valor);
                        ps.setString(2, valor);
                        ps.setString(3, valor);
                        rs = ps.executeQuery();
                    %>
                    <% while (rs.next()) {%>
                    <tr>
                        <td><%=rs.getString("nombre")%></td>
                        <td><%=rs.getString("cargo")%></td>
                        <td><%=rs.getString("username")%></td>  
                        <td><a href="jsp/dao/guilleDao.jsp?accion=eliminar&idG=<%=rs.getString("id")%>">eliminar</a></td>
                    </tr>
                    <%}%>
                </table>
            </div>
        </div>
    </body>
</html>