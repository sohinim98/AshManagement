<%-- 
    Document   : index
    Created on : Jul 15, 2017, 12:26:44 PM
    Author     : cesc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Haldia Ash Management System</title>
    </head>
    <body <%-- style="background-color:#FFFACD"/* --%>>
        <%@ include file="style.html" %>
        <div class="background">
        <br/>
        <img src="RPSG_company_logo.jpg" width="128" height="64" align="left" alt="RPSG_company_logo"/>
        <img src="HEL_company_logo.jpg" width="128" height="64" align="right" alt="HEL_company_logo"/>     
        <br/> <br/> <br/> <br/>
        <div class="transbox">
        <h1 style="font-size:300%;text-align:center;font-family:Broadway;color:midnightblue">Haldia Ash Management System</h1>
        </div>
        <p style="text-align: center;font-size: 160%">
            <br/>  <br/>
            <img src="home1.png" width="64" height="64" alt="home logo"/>
            <br/>
        </p>
        <div class="center">
        <div class="dropdown">
        <button class="dropbtn">Master Tables</button>
        <div class="dropdown-content">
            <a href="customer.jsp">Customer Master Table</a>
            <a href="ash.jsp">Ash Master Table</a>
            <a href="transporter.jsp">Transporter Master Table</a>
            <a href="mapping.jsp">Customer-Transporter Map</a>

        </div>
        </div>
            <br/> <br/> <a href="trans.jsp"><input class="button" style="height:45px; width:150px; font-size:75%" type="button" value="Transactions" name="mybutton" /></a>
        </div>
    <%-- <h2 style="font-size:180%;text-align:center;font-family:cooperblack;"><em>Select the Master Table you want to view and update:</em></h2>
        <p style="text-align: center;font-size: 160%">
        <a href="customer.jsp">Customer Master Table</a> <br/>
        <a href="ash.jsp">Ash Master Table</a> <br/>
        <a href="transporter.jsp">Transporter Master Table</a> <br/>
        <a href="mapping.jsp">Customer-Transporter Map</a>
        <br/> <br/>
       <a href="trans.jsp"><input class="button" style="height:45px; width:150px; font-size:75%" type="button" value="Transactions" name="mybutton" /></a>
        </p> --%>
        </div>
    </body>
</html>
