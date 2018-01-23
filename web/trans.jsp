<%-- 
    Document   : trans
    Created on : Jul 24, 2017, 4:06:45 PM
    Author     : cesc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="style.html" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Haldia Ash Management System</title>
    </head>
    <body style="background-color:#FFE4C4">
        <a href="index.jsp"><img src="back.png" alt="back_logo" style="width:40px;height:25px"></a>
        <br/> <br/> <br/>
        <img src="HEL_company_logo.jpg" width="128" height="64" align="left" alt="HEL_company_logo"/> <br/> <br/>
        <br/> <br/> <br/>
        <p class="flip" onclick="myFunction()">Click to Search</p>
        <div id="panel">
        <h1 style="font-size:300%;text-align:center;font-family:cooperblack">Transaction Details Finder</h1>
              <p style="text-align: center;font-size: 160%">
            <img src="magnifying_glass.png" width="88" height="88" alt="search logo"/>
            <br/>
        </p>

        <form name="myform" action="summary.jsp" method="POST">
            <p style="font-size:150%;text-align:center;font-family:cooperblack">
                Select Month and Year:
                <input type="month" name="mymonth" placeholder="YYYY-DD"/>
            <br/><br/> <input class="button" type="reset" value="Reset" name="reset" />
            <input class="button" type="submit" value="Search" name="submit" />
            </p>
                </div>
        </form>
<script>
function myFunction() {
    document.getElementById("panel").style.display = "block";
}
</script>
    </body>
</html>
