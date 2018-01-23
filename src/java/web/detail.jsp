<%-- 
    Document   : detail
    Created on : Jul 24, 2017, 4:31:47 PM
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
    <body style="background-color:#b2cecf">
        <%@ include file="style.html" %>
        <a href="trans.jsp"><img src="back.png" alt="back_logo" style="width:40px;height:25px"></a>
        <br/> <br/> <br/>
        <img src="HEL_company_logo.jpg" width="128" height="64" align="left" alt="HEL_company_logo"/>
        <%@ include file="con1.jsp" %>
        <% String cc="";
        String cn="";
            String counter1 = request.getParameter("counter");
    int c = Integer.parseInt(counter1); int i;
    for(i=1;i<=c;i++)
    {
        String i2 = Integer.toString(i);
        
        String res1 = request.getParameter("mylist"+i2);
        if(res1.equals("show"))
        {
            cc = request.getParameter("cc"+i2);
            cn = request.getParameter("cn"+i2);
        }
    }
    if(!cc.equals(""))
    {
            String m0 = request.getParameter("dt1");
            String m=m0.substring(6)+"-"+m0.substring(3,5);
PreparedStatement selectTrans = null;
ResultSet rs = null;
ResultSet rs1 = null;
selectTrans = connection.prepareStatement("SELECT DATEIN,TRUCK,CHALLANNO,DATEOUT,TIMEIN,TIMEOUT,NETWT,TRANSPORTERNAME FROM transactiondetail WHERE SUPPLIERCODE = '"+cc+"' AND DATE_FORMAT(DATEIN, '%Y-%m') = '"+m+"'" );
rs = selectTrans.executeQuery(); %>
<h1 style="font-size:300%;text-align:center;font-family:cooperblack">Detailed Ash Disposal Report</h1>
<h2 style="font-size:180%;text-align:center;font-family:gisha;color:maroon"><%=cn%>----<%= m %></h2>
<form name="myform" action="excel2" method="POST">
    <div style="overflow-x:auto;">
        <div style="overflow-y:auto;">
<table id="customers" style="text-align:center;background-color:#d1e2e3" align="center" border="1">
    <tbody>
        <tr>
            <td><input style="background-color: powderblue;border: 2px solid darkslateblue;border-radius: 4px;" type="text" name="sn0" value="Srl No." size="5" readonly="readonly" /></td>
            <td><input style="background-color: powderblue;border: 2px solid darkslateblue;border-radius: 4px;" type="text" name="date0" value="Date In" size="20" readonly="readonly" /></td>
            <td><input style="background-color: powderblue;border: 2px solid darkslateblue;border-radius: 4px;" type="text" name="vehicle0" value="Vehicle Number" size="20" readonly="readonly" /></td>
            <td><input style="background-color: powderblue;border: 2px solid darkslateblue;border-radius: 4px;" type="text" name="challan0" value="Transporter Challan Number" size="20" readonly="readonly" /></td>
            <td><input style="background-color: powderblue;border: 2px solid darkslateblue;border-radius: 4px;" type="text" name="date1" value="Date out" size="20" readonly="readonly" /></td>
            <td><input style="background-color: powderblue;border: 2px solid darkslateblue;border-radius: 4px;" type="text" name="time0" value="Time In" size="20" readonly="readonly" /></td>
            <td><input style="background-color: powderblue;border: 2px solid darkslateblue;border-radius: 4px;" type="text" name="time1" value="Time Out" size="20" readonly="readonly" /></td>
            <td><input style="background-color: powderblue;border: 2px solid darkslateblue;border-radius: 4px;" type="text" name="net0" value="Net Weight" size="20" readonly="readonly" /></td>
            <td><input style="background-color: powderblue;border: 2px solid darkslateblue;border-radius: 4px;" type="text" name="transporter0" value="Transporter" size="20" readonly="readonly" /></td>
        </tr>
        <% int n=0; while(rs.next()) { n++;
         String s=Integer.toString(n); %>
        <tr>
            <td><input type="text" name="sn<%=n%>" value="<%= s%>" size="5" readonly="readonly" /></td>
            <td><input type="text" name="di<%=s%>" value="<%= rs.getString(1)%>" size="20" readonly="readonly" /></td>
            <td><input type="text" name="vn<%=s%>" value="<%= rs.getString(2)%>" size="20" readonly="readonly" /></td>
            <td><input type="text" name="chn<%=s%>" value="<%= rs.getString(3)%>" size="20" readonly="readonly" /></td>
            <td><input type="text" name="do<%=s%>" value="<%= rs.getString(4)%>" size="20" readonly="readonly" /></td>
            <td><input type="text" name="ti<%=s%>" value="<%= rs.getString(5)%>" size="20" readonly="readonly" /></td>
            <td><input type="text" name="to<%=s%>" value="<%= rs.getString(6)%>" size="20" readonly="readonly" /></td>
            <td><input type="text" name="nt<%=s%>" value="<%= rs.getString(7)%>" size="20" readonly="readonly" /></td>
            <td><input type="text" name="trans<%=s%>" value="<%= rs.getString(8)%>" size="20" readonly="readonly" /></td>
        </tr>
        <% } %>
        <%
            selectTrans = connection.prepareStatement("SELECT SUM(NETWT) TOTAL FROM transactiondetail WHERE SUPPLIERCODE = '"+cc+"' AND DATE_FORMAT(DATEIN, '%Y-%m') = '"+m+"'" );
           rs1 = selectTrans.executeQuery();
        %>
        <tr>
            <td><input type="text" name="total" value="Total:" size="5" readonly="readonly" /></td>
            <td><input type="text" name="box1" value="" size="20" readonly="readonly" />
            <td><input type="text" name="box2" value="" size="20" readonly="readonly" />
             <td><input type="text" name="box3" value="" size="20" readonly="readonly" />
             <td><input type="text" name="box4" value="" size="20" readonly="readonly" />
              <td><input type="text" name="box5" value="" size="20" readonly="readonly" />
              <td><input type="text" name="box6" value="" size="20" readonly="readonly" />
            <% while (rs1.next()) { %>
            <td><input type="text" name="total1" value="<%= rs1.getString(1)%>" size="20" readonly="readonly" /></td>
           <% } %>
            <td><input type="text" name="box7" value="" size="20" readonly="readonly" />
        </tr>
    </tbody>
</table>
        </div>
    </div>
    <% String c1=Integer.toString(n); %>
        <input type="hidden" name="counter" value="<%=c1%>" />
        <p class="flip" onclick="myFunction()">Click to save as .xls file</p>
        <div id="panel">
    <p>To save as .xls file, enter file name:
<input type="text" name="filename" size="20" value="<%=cn%>">
<input class="button" type="submit" value="Create" formaction="excel2.jsp"
   onclick="document.location='excel2.jsp.jsp';"/>
 </p>
        </div>
<script>
function myFunction() {
    document.getElementById("panel").style.display = "block";
}
</script>
    </form>
<% } 
else { %>
<h1 style="font-size:300%;text-align:center;font-family:aharoni;color:red">
            Select a Customer! </h1>  
<% }%>
</html>
