<%-- 
    Document   : excel2
    Created on : Jul 31, 2017, 2:41:21 PM
    Author     : cesc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Haldia Ash Management System</title>
    </head>
    <body>
        <a href="trans.jsp"><input type="button" value="<-- Back" name="Back to Finder" /></a>
<% String name=request.getParameter("filename");
String counter=request.getParameter("counter");
int c1=Integer.parseInt(counter); %>
<%try{
HSSFWorkbook wb = new HSSFWorkbook();
HSSFSheet sheet = wb.createSheet("new sheet");
HSSFRow row1 = sheet.createRow((short)0);
HSSFCell cell = row1.createCell((short)0);
cell.setCellValue(request.getParameter("sn0"));
row1.createCell((short)1).setCellValue(request.getParameter("date0"));
row1.createCell((short)2).setCellValue(request.getParameter("vehicle0"));
row1.createCell((short)3).setCellValue(request.getParameter("challan0"));
row1.createCell((short)4).setCellValue(request.getParameter("date1"));
row1.createCell((short)5).setCellValue(request.getParameter("time0"));
row1.createCell((short)6).setCellValue(request.getParameter("time1"));
row1.createCell((short)7).setCellValue(request.getParameter("net0"));
row1.createCell((short)8).setCellValue(request.getParameter("transporter0"));
for(int i=1;i<=c1;i++)
{
    
    HSSFRow row2 = sheet.createRow((short)i);
HSSFCell cell2 = row2.createCell((short)0);
cell2.setCellValue(request.getParameter("sn"+Integer.toString(i)));
}
for(int i=1;i<=c1;i++)
{
    
    HSSFRow row2 = sheet.createRow((short)i);
HSSFCell cell2 = row2.createCell((short)1);
cell2.setCellValue(request.getParameter("di"+Integer.toString(i)));
}
for(int i=1;i<=c1;i++)
{
    
    HSSFRow row2 = sheet.createRow((short)i);
HSSFCell cell2 = row2.createCell((short)2);
cell2.setCellValue(request.getParameter("vn"+Integer.toString(i)));
}
for(int i=1;i<=c1;i++)
{
    
    HSSFRow row2 = sheet.createRow((short)i);
HSSFCell cell2 = row2.createCell((short)3);
cell2.setCellValue(request.getParameter("chn"+Integer.toString(i)));
}
for(int i=1;i<=c1;i++)
{
    
    HSSFRow row2 = sheet.createRow((short)i);
HSSFCell cell2 = row2.createCell((short)4);
cell2.setCellValue(request.getParameter("do"+Integer.toString(i)));
}
for(int i=1;i<=c1;i++)
{
    
    HSSFRow row2 = sheet.createRow((short)i);
HSSFCell cell2 = row2.createCell((short)5);
cell2.setCellValue(request.getParameter("ti"+Integer.toString(i)));
}
for(int i=1;i<=c1;i++)
{
    
    HSSFRow row2 = sheet.createRow((short)i);
HSSFCell cell2 = row2.createCell((short)6);
cell2.setCellValue(request.getParameter("to"+Integer.toString(i)));
}
for(int i=1;i<=c1;i++)
{
    
    HSSFRow row2 = sheet.createRow((short)i);
HSSFCell cell2 = row2.createCell((short)7);
cell2.setCellValue(request.getParameter("nt"+Integer.toString(i)));
}
for(int i=1;i<=c1;i++)
{
    
    HSSFRow row2 = sheet.createRow((short)i);
HSSFCell cell2 = row2.createCell((short)8);
cell2.setCellValue(request.getParameter("trans"+Integer.toString(i)));
}
int storerow=c1+1;
HSSFRow lastrow = sheet.createRow((short)storerow);
 HSSFCell lastcell = lastrow.createCell((short)0);
    lastrow.createCell((short)0).setCellValue(request.getParameter("total"));
    lastrow.createCell((short)1).setCellValue(request.getParameter("box1"));
    lastrow.createCell((short)2).setCellValue(request.getParameter("box2"));
    lastrow.createCell((short)3).setCellValue(request.getParameter("box3"));
    lastrow.createCell((short)4).setCellValue(request.getParameter("box4"));
    lastrow.createCell((short)5).setCellValue(request.getParameter("box5"));
    lastrow.createCell((short)6).setCellValue(request.getParameter("box6"));
    lastrow.createCell((short)7).setCellValue(request.getParameter("total1"));
    lastrow.createCell((short)8).setCellValue(request.getParameter("box7"));
String home = System.getProperty("user.home");
FileOutputStream fileOut = new FileOutputStream(home+"\\Downloads\\"+name+".xls");
wb.write(fileOut);
fileOut.close();
}
catch ( Exception ex ){ 
} 
%>
<p style="font-size:180%;text-align:center;font-family:aharoni;color:maroon">File downloaded successfully!</p>
    </body>
</html>
