<%-- 
    Document   : guilleDao
    Created on : 21/08/2015, 01:05:40 AM
    Author     : Magwi
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="com.sun.xml.internal.ws.api.message.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../admin/conexion.jsp" %>
<%@include file="Model.jsp" %>
<%    if (accion.equals("guardar")) {
            consulta = ("insert into guille (nombre, cargo, username, pass ) "
                    + "values(?,?,?,?)");
            ps = conex.prepareStatement(consulta);
            ps.setString(1, nombre);
            ps.setString(2, cargo);
            ps.setString(3, user);
            ps.setString(4, pass);
            if (ps.executeUpdate() == 1) {
                JOptionPane.showMessageDialog(null, "Insert OK -> " + nombre +"  "+cargo);
                //out.print("exito");
                response.sendRedirect("../../index_1.jsp");
            } else {
                out.print("no se pudo insertar");
            }
    } else {
        if (accion.equals("eliminar")) {

            consulta = ("delete from guille where id=?");
            ps = conex.prepareStatement(consulta);
            ps.setString(1, idG);

            if (ps.executeUpdate() == 1) {
                out.println("se elimino ok");
                response.sendRedirect("../../index.jsp");

            };
        } else {
            if (accion.equals("actualizar")) {
                consulta = ("update guille set nombre=?,cargo=? where id=?;");
                ps = conex.prepareStatement(consulta);
                ps.setString(1, nombre);
                ps.setString(2, cargo);
                ps.setString(3, idG);

                if (ps.executeUpdate() == 1) {
                    response.sendRedirect("../../index.jsp");
                } else {
                    out.println("no se actualizo");

                }
            }
        }
    }

%>