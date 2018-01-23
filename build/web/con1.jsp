<%-- 
    Document   : con1
    Created on : Aug 2, 2017, 3:37:33 PM
    Author     : cesc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language = "java" import = "java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver").newInstance(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Haldia Ash Management System</title>
    </head>
    <body>
        <% String URL = "jdbc:mysql://localhost:3306/hel_ash";
String USERNAME = "root";
String PASSWORD = "";
Connection connection = null;
connection = DriverManager.getConnection(URL, USERNAME, PASSWORD); %>
    </body>
</html>
