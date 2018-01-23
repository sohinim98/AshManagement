<%-- 
    Document   : dataash
    Created on : Jul 19, 2017, 11:57:56 AM
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
    <body link="yellow" vlink="greenyellow" alink="red" style="background-color:midnightblue;text-align: center">
        <h1 style="font-size:300%;text-align:center;font-family:cooperblack;color:gold">Ash Details Modification</h1>
        <%@ include file="con1.jsp" %>
        <%
            PreparedStatement selectTrans = null;
            ResultSet rs = null;
            ResultSet rs1 = null;
            Statement st = connection.createStatement();
String cc = request.getParameter("cc0");
String cn = request.getParameter("cn0");
String ef = request.getParameter("ef0");
String res = request.getParameter("mylist0");
selectTrans = connection.prepareStatement("SELECT PRODUCT_CODE FROM ash_mst WHERE PRODUCT_CODE = '"+cc+"'" );
rs = selectTrans.executeQuery();
 int n=0;
    while (rs.next())
{

    n++;
}
if(res.equals("Insert")&& !cc.equals("") && !cn.equals("") && (ef.equals("Y") || ef.equals("N")) && n == 0)
{
    st.executeUpdate("INSERT INTO ash_mst(PRODUCT_CODE, PRODUCT_NAME, ENABLED_FLAG) VALUES('"+cc+"','"+cn+"','"+ef+"' )");
    %>
    <br/>
    <h2 style="font-size:180%;text-align:center;font-family:aharoni;color:white">Data has been inserted!</h2>
    <br/> <br/>
        <img src="thankyou.png" width="64" height="64" align="center" alt="thankyou_logo"/>
        <br/>  <br/>
        <p style="text-align: center;font-size:160%">
            <a  href = "ash.jsp" > Click to view the updated table</a > </p>
<% }
else
{
    String counter1 = request.getParameter("counter");
    int c = Integer.parseInt(counter1); int i, f=0;
    for(i=1;i<=c;i++)
    {
        String i2 = Integer.toString(i);
        String c1 = request.getParameter("cc"+i2);
        String c2 = request.getParameter("cn"+i2);
        String e1 = request.getParameter("ef"+i2);
        String res1 = request.getParameter("mylist"+i2);
int n1=0;
        selectTrans = connection.prepareStatement("SELECT PRODUCT_CODE FROM ash_mst WHERE PRODUCT_CODE = '"+c1+"'" );
        rs1 = selectTrans.executeQuery();
while (rs1.next())
{

    n1++;
}
        if(res1.equals("Update") && !c1.equals("") && !c2.equals("") && n1==1)
        {
            st.executeUpdate("UPDATE ash_mst SET PRODUCT_CODE='"+c1+"', PRODUCT_NAME= '"+c2+"', ENABLED_FLAG='"+e1+"' WHERE PRODUCT_CODE = '"+c1+"'");
            f=1;
        }
        else if(res1.equals("Delete") && !c1.equals("") && !c2.equals("") && n1==1)
        {
            st.executeUpdate("DELETE FROM ash_mst WHERE PRODUCT_CODE = '"+c1+"' AND PRODUCT_NAME = '"+c2+"'");
            f=1;
           
        }
    }
if(f==1){
%>
<br/>
            <h2 style="font-size:180%;text-align:center;font-family:aharoni;color:white">Changes have been saved successfully!</h2>
            <br/> <br/>
        <img src="thankyou.png" width="64" height="64" align="center" alt="thankyou_logo"/>
        <br/>  <br/>
        <p style="text-align: center;font-size:160%">
            <a href="ash.jsp">Click to view the updated table</a></p>
<%
        }
else if(f!=1)
    { %>
            <br/> <br/>
        <img src="oops.jpg" width="64" height="64" align="center" alt="thankyou_logo"/>
        <br/>
        <p style="font-size:180%;text-align:center;font-family:aharoni;color:red">
            Action could not be executed. Enter proper data! </p>       

        <p style="font-size:120%;color:white;text-align:left"> <br/> <br/> Make sure: </p>
            <ul style="font-size:120%;color:white;text-align:left">
            <li>None of the fields are empty.</li>
            <li>The Product Code is unique.</li>
            <li>While inserting, the Enabled Flag says Y or N.</li>
            <li> While inserting, you have confirmed insertion.</li>
            </ul>
        <br/> <br/>
        <p style="text-align: center;font-size:160%">
        <a href="ash.jsp">Click to go back to the table to re-enter data</a>
        </p>
    <% }
}
        %>
        
    </body>
</html>
