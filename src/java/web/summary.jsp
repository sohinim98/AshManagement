<%-- 
    Document   : summary
    Created on : Jul 28, 2017, 11:08:43 AM
    Author     : cesc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language = "java" import = "java.sql.*" %>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@ page import="java.io.*" %>
<% Class.forName("com.mysql.jdbc.Driver").newInstance(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Haldia Ash Management System</title>
    </head>
    <body style="background-color:#7091B2">
        <%@ include file="style.html" %>
        <a href="trans.jsp"><img src="back.png" alt="back_logo" style="width:40px;height:25px"></a>
        <br/> <br/> <br/>
        <img src="HEL_company_logo.jpg" width="128" height="64" align="left" alt="HEL_company_logo"/>
        <h1 style="font-size:300%;text-align:center;font-family:cooperblack">Ash Disposal Report Summary</h1>
        <%@ include file="con1.jsp" %>
        <% String m = request.getParameter("mymonth");
        String cc = request.getParameter("customer");
PreparedStatement selectTrans = null;
ResultSet rs0 = null;
ResultSet rs = null;
ResultSet rs1 = null;
ResultSet rs2 = null;
ResultSet rs3 = null;
ResultSet rs4 = null;
//out.println(m);
try{
CallableStatement cs = connection.prepareCall("{call GetAshReportData(?)}");
cs.setString(1,m);
cs.execute();
}
catch(Exception e){
    out.println("Error! Enter the value in the correct format(eg:2017-07)" +e.getMessage());
}
//out.println("After proc call");
selectTrans = connection.prepareStatement("SELECT DISTINCT b.CUSTOMER_NAME,a.CUST_CODE,a.MONTH_TOT_QTY,a.CURR_YTD,ROUND(a.MONTH_TOT_QTY/2,4) AVG_TTD,a.UPTO_LAST_MONTH_QTY,a.LAST_YTD FROM hel_ash_report_data a,customer_mst b WHERE a.CUST_CODE = b.CUSTOMER_CODE AND b.ENABLED_FLAG = 'Y'");
rs0 = selectTrans.executeQuery();
selectTrans = connection.prepareStatement("SELECT DISTINCT CURR_FY,LAST_FY FROM hel_ash_report_data");
rs2 = selectTrans.executeQuery();
%>
<form name="myform" method="POST">
        <div style="overflow-x:auto;">
            <div style="overflow-y:auto;">
<table id="customers" style="text-align:center;background-color:#A8C0D8" align="center" border="1">
    <tbody>
        <tr>
            <td><input type="text" name="date1" value="" size="5" readonly="readonly" style="background-color: powderblue;border: none; border-bottom: 2px solid darkslateblue;" /></td>
            <td><input type="text" name="date2" value="" size="20" readonly="readonly" style="background-color: powderblue;border: none; border-bottom: 2px solid darkslateblue;"/></td>
            <td><input type="text" name="date3" value="" size="20" readonly="readonly" style="background-color: powderblue;border: none; border-bottom: 2px solid darkslateblue;"/></td>
            <td><input type="text" name="date4" value="DATE" size="20" readonly="readonly" style="background-color: powderblue;border: none; border-bottom: 2px solid darkslateblue;"/></td>
            <% selectTrans = connection.prepareStatement("SELECT DISTINCT DATE_FORMAT(IN_DATE,'%d/%m/%Y') FROM hel_ash_report_data" );
            rs = selectTrans.executeQuery();
            int n=0;
            while(rs.next()) { n++;
            String s= Integer.toString(n);
            %>
            <td><input style="background-color: powderblue;border: none; border-bottom: 2px solid darkslateblue;" type="text" name="dt<%=s%>" value="<%= rs.getString(1)%>" size="20" readonly="readonly" /></td>
            <% } %>
            <td><input style="background-color: powderblue;border: none; border-bottom: 2px solid darkslateblue;" type="text" name="mtd" value="MTD" size="20" readonly="readonly" /></td>
            <td><input style="background-color: powderblue;border: none; border-bottom: 2px solid darkslateblue;" type="text" name="atd" value="AVERAGE TPD" size="20" readonly="readonly" /></td>
            <td><input style="background-color: powderblue;border: none; border-bottom: 2px solid darkslateblue;" type="text" name="lmv" value="UPTO LAST MONTH" size="20" readonly="readonly" /></td>
            <td><input style="background-color: powderblue;border: none; border-bottom: 2px solid darkslateblue;" type="text" name="ytd" value="YTD(MT)" size="20" readonly="readonly" /></td>
            <td><input style="background-color: powderblue;border: none; border-bottom: 2px solid darkslateblue;" type="text" name="pytd" value="YTD(MT)" size="20" readonly="readonly" /></td>
        </tr>
        <tr>
            <td><input style="background-color: powderblue;border: 2px solid darkslateblue;border-radius: 4px;" type="text" name="sn" value="SRL NO" size="5" readonly="readonly" /></td>
            <td><input style="background-color: powderblue;border: 2px solid darkslateblue;border-radius: 4px;" type="text" name="mycol" value="VIEW DETAILED REPORT" size="20" readonly="readonly" /></td>
            <td><input style="background-color: powderblue;border: 2px solid darkslateblue;border-radius: 4px;" type="text" name="cn0" value="CUSTOMER NAME" size="20" readonly="readonly" /></td>
            <td><input style="background-color: powderblue;border: 2px solid darkslateblue;border-radius: 4px;" type="text" name="cc0" value="CUSTOMER CODE" size="20" readonly="readonly" /></td>
            <% for(int i=1;i<=n;i++) { 
            String s=Integer.toString(i); %>
            <td><input style="background-color: powderblue;border: 2px solid darkslateblue;border-radius: 4px;" type="text" name="qt<%=s%>" value="QTY IN MT" size="20" readonly="readonly" /></td>
            <% } %>
            <td><input style="background-color: powderblue;border: 2px solid darkslateblue;border-radius: 4px;" type="text" name="mt" value="(MT)" size="20" readonly="readonly" /></td>
            <td><input style="background-color: powderblue;border: 2px solid darkslateblue;border-radius: 4px;" type="text" name="mt1" value="(MT)" size="20" readonly="readonly" /></td>
            <td><input style="background-color: powderblue;border: 2px solid darkslateblue;border-radius: 4px;" type="text" name="lm" value="(MT)" size="20" readonly="readonly" /></td>
            <% while(rs2.next()) { %>
            <td><input style="background-color: powderblue;border: 2px solid darkslateblue;border-radius: 4px;" type="text" name="cy" value="<%= rs2.getString(1)%>" size="20" readonly="readonly" /></td>
            <td><input style="background-color: powderblue;border: 2px solid darkslateblue;border-radius: 4px;" type="text" name="py" value="<%= rs2.getString(2)%>" size="20" readonly="readonly" /></td>
            <% } %>
        </tr>
        <% int n1=0,n2=0; while(rs0.next()) {
            n1++;
            String s1= Integer.toString(n1);
            String c0 = rs0.getString(1);
            String c= rs0.getString(2); %>
        <tr>
            <td><input type="text" name="sn<%=s1%>" value="<%=n1%>" size="5" readonly="readonly"/></td>
            <td><select name="mylist<%=s1%>" style="width: 100%">
                    <option hidden selected="selected" value = "">Choose action</option>
                    <option value="show">Show Detail</option>
                </select></td>
             <td><input type="text" name="cn<%=s1%>" value="<%=c0%>" size="20" readonly="readonly" /></td>   
            <td><input type="text" name="cc<%=s1%>" value="<%=c%>" size="20" readonly="readonly" /></td>
            <% selectTrans = connection.prepareStatement("SELECT DISTINCT IN_DATE,TOT_QTY_MT FROM hel_ash_report_data WHERE CUST_CODE = '"+c+"'" );
            rs1 = selectTrans.executeQuery();
            while(rs1.next()) {
                n2++;
            String s2= Integer.toString(n2);
            %>
            <td><input type="text" name="tqm<%=s2%>" value="<%= rs1.getString(2)%>" size="20" readonly="readonly" /></td>
            <% } %>
            <td><input type="text" name="mtq<%=s1%>" value="<%= rs0.getString(3)%>" size="20" readonly="readonly" /></td>
            <td><input type="text" name="atd<%=s1%>" value="<%= rs0.getString(5)%>" size="20" readonly="readonly" /></td>
            <td><input type="text" name="lmv<%=s1%>" value="<%= rs0.getString(6)%>" size="20" readonly="readonly" /></td>
            <td><input type="text" name="cy<%=s1%>" value="<%= rs0.getString(4)%>" size="20" readonly="readonly" /></td>
        <td><input type="text" name="py<%=s1%>" value="<%= rs0.getString(7)%>" size="20" readonly="readonly" /></td> </tr>
            
        <% } %>
        <tr>
            <td><input type="text" name="t" value="" size="5" readonly="readonly" /></td>
            <td><input type="text" name="t0" value="" size="20" readonly="readonly" /></td>
            <td><input type="text" name="t1" value="" size="20" readonly="readonly" /></td>
            <td><input type="text" name="t2" value="TOTAL:" size="20" readonly="readonly" /></td>
            <% int count=0;
            selectTrans = connection.prepareStatement("SELECT IN_DATE,SUM(TOT_QTY_MT)DAILY_SUM FROM hel_ash_report_data GROUP BY IN_DATE ORDER BY IN_DATE");
            rs3 = selectTrans.executeQuery();
            while(rs3.next()) { count++;
            String s=Integer.toString(count); %>
            <td><input type="text" name="tot<%=s%>" value="<%= rs3.getString(2)%>" size="20" readonly="readonly" /></td>
            <% } %>
            <% selectTrans = connection.prepareStatement("SELECT SUM(DISTINCT MONTH_TOT_QTY) GTOT_MTD,SUM(DISTINCT (ROUND(MONTH_TOT_QTY/2,4))) GTOT_AVG_TPD,SUM(DISTINCT UPTO_LAST_MONTH_QTY) GTOT_UPTO_LAST_MONTH,SUM(DISTINCT CURR_YTD) GTOT_CURR_YTD,SUM(DISTINCT LAST_YTD) GTOT_LAST_YTD FROM hel_ash_report_data");
            rs4 = selectTrans.executeQuery(); %>
            <% while(rs4.next()) { 
            %>
            <td><input type="text" name="sum1" value="<%= rs4.getDouble(1)%>" size="20" readonly="readonly" /></td>
            <td><input type="text" name="sum2" value="<%= rs4.getDouble(2)%>" size="20" readonly="readonly" /></td>
            <td><input type="text" name="sum3" value="<%= rs4.getDouble(3)%>" size="20" readonly="readonly" /></td>
            <td><input type="text" name="sum4" value="<%= rs4.getDouble(4)%>" size="20" readonly="readonly" /></td>
            <td><input type="text" name="sum5" value="<%= rs4.getDouble(5)%>" size="20" readonly="readonly" /></td>
         <% } %>
        </tr>
    </tbody>
</table>
    </div>
        </div>
    <% String c1=Integer.toString(n1);
    String c2=Integer.toString(n);
    String c3=Integer.toString(n2);
    %>
    <input type="hidden" name="counter" value="<%=c1%>" />
    <input type="hidden" name="counter1" value="<%=c2%>" />
    <input type="hidden" name="counter2" value="<%=c3%>" />
    <p style="text-align: center">
    <input class="button" type="reset" value="Reset" name="reset" />
    <input class="button" type="submit" value="Go" name="mybutton" formaction="detail.jsp"/> <p/>
 
    <p>To save as .xls file, enter file name:
<input type="text" name="filename" size="20">
<input class="button" type="submit" value="Download" formaction="excel.jsp"  />
 <%--  onclick="document.location='excel.jsp';"/> --%>
 </p>

    </form>
    </body>
</html>
