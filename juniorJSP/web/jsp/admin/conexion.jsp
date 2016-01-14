<%-- 
    Document   : conexion
    Created on : 21/08/2015, 12:56:41 AM
    Author     : Magwi
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DriverManager.deregisterDriver(new com.mysql.jdbc.Driver());
    Connection conex = DriverManager.getConnection("jdbc:mysql://localhost:3306/magwi?user=root&password");
    //variables
    Statement st = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
   
    String consulta = null;
    String qry = null;
%>