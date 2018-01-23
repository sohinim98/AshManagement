<%-- 
    Document   : excel
    Created on : Jul 31, 2017, 11:12:36 AM
    Author     : cesc
--%>

<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
    <body>
    
        <% 
            String fileName = request.getParameter("filename") +".xls";
           // String fileName = "Result.xls";  
   String strHeader = "attachment;filename=" + fileName; 
   response.setContentType("application/vnd.ms-excel");   
   response.setHeader("Content-disposition",strHeader);
            
        
        String date1=request.getParameter("date1");
        String date2=request.getParameter("date2");
        String date3=request.getParameter("date3");
        String date4=request.getParameter("date4");
        String counter=request.getParameter("counter");
        String counter1=request.getParameter("counter1");
        String counter2=request.getParameter("counter2");
        int c1=Integer.parseInt(counter);
        int c2=Integer.parseInt(counter1);
        int c3=Integer.parseInt(counter2);
  try{
HSSFWorkbook wb = new HSSFWorkbook();
HSSFSheet sheet = wb.createSheet("new sheet");
HSSFRow row1 = sheet.createRow((short)0);
HSSFCell cell = row1.createCell((short)0);
cell.setCellValue(date1);
row1.createCell((short)1).setCellValue(date2);
row1.createCell((short)2).setCellValue(date4);
int store=2;
for(int i=1;i<=c2;i++)
{
    row1.createCell((short)(2+i)).setCellValue(request.getParameter("dt"+Integer.toString(i)));
    store++;
}
store++;
row1.createCell((short)store++).setCellValue(request.getParameter("mtd"));
row1.createCell((short)store++).setCellValue(request.getParameter("atd"));
row1.createCell((short)store++).setCellValue(request.getParameter("lmv"));
row1.createCell((short)store++).setCellValue(request.getParameter("ytd"));
row1.createCell((short)store++).setCellValue(request.getParameter("pytd"));
HSSFRow row2 = sheet.createRow((short)1);
HSSFCell cell2 = row2.createCell((short)0);
cell2.setCellValue(request.getParameter("sn"));
row2.createCell((short)1).setCellValue(request.getParameter("cn0"));
row2.createCell((short)2).setCellValue(request.getParameter("cc0"));
store=2;
for(int i=1;i<=c2;i++)
{
    row2.createCell((short)(2+i)).setCellValue(request.getParameter("qt"+Integer.toString(i)));
    store++;
}
store++;
row2.createCell((short)store++).setCellValue(request.getParameter("mt"));
row2.createCell((short)store++).setCellValue(request.getParameter("mt1"));
row2.createCell((short)store++).setCellValue(request.getParameter("lm"));
row2.createCell((short)store++).setCellValue(request.getParameter("cy"));
row2.createCell((short)store++).setCellValue(request.getParameter("py"));
for(int i=1;i<=c1;i++)
{
    HSSFRow row3 = sheet.createRow((short)1+i);
    HSSFCell cell3 = row3.createCell((short)0);
    cell3.setCellValue(request.getParameter("sn"+Integer.toString(i)));
}
for(int i=1;i<=c1;i++)
{
    HSSFRow row3 = sheet.createRow((short)1+i);
    HSSFCell cell3 = row3.createCell((short)1);
    cell3.setCellValue(request.getParameter("cn"+Integer.toString(i)));
}
for(int i=1;i<=c1;i++)
{
    HSSFRow row3 = sheet.createRow((short)1+i);
    HSSFCell cell3 = row3.createCell((short)2);
    cell3.setCellValue(request.getParameter("cc"+Integer.toString(i)));
}
store=1;
for(int i=1;i<=c1;i++)
{
    HSSFRow row3 = sheet.createRow((short)1+i);
    for(int j=1;j<=c2;j++)
    {
    HSSFCell cell3 = row3.createCell((short)(j+2));
    cell3.setCellValue(request.getParameter("tqm"+Integer.toString(store++)));
    }
}
store=c2+3;
for(int i=1;i<=c1;i++)
{
    HSSFRow row3 = sheet.createRow((short)1+i);
    HSSFCell cell3 = row3.createCell((short)store);
    cell3.setCellValue(request.getParameter("mtq"+Integer.toString(i)));
}
store++;
for(int i=1;i<=c1;i++)
{
    HSSFRow row3 = sheet.createRow((short)1+i);
    HSSFCell cell3 = row3.createCell((short)store);
    cell3.setCellValue(request.getParameter("atd"+Integer.toString(i)));
}
store++;
for(int i=1;i<=c1;i++)
{
    HSSFRow row3 = sheet.createRow((short)1+i);
    HSSFCell cell3 = row3.createCell((short)store);
    cell3.setCellValue(request.getParameter("lmv"+Integer.toString(i)));
}
store++;
for(int i=1;i<=c1;i++)
{
    HSSFRow row3 = sheet.createRow((short)1+i);
    HSSFCell cell3 = row3.createCell((short)store);
    cell3.setCellValue(request.getParameter("cy"+Integer.toString(i)));
}
store++;
for(int i=1;i<=c1;i++)
{
    HSSFRow row3 = sheet.createRow((short)1+i);
    HSSFCell cell3 = row3.createCell((short)store);
    cell3.setCellValue(request.getParameter("py"+Integer.toString(i)));
}
int storerow=c1+3;
HSSFRow lastrow = sheet.createRow((short)storerow);
 HSSFCell lastcell = lastrow.createCell((short)0);
    lastrow.createCell((short)0).setCellValue(request.getParameter("t0"));
    lastrow.createCell((short)1).setCellValue(request.getParameter("t1"));
    lastrow.createCell((short)2).setCellValue(request.getParameter("t2"));
    store=2;
    for(int i=1;i<=c2;i++)
    {
        lastrow.createCell((short)(2+i)).setCellValue(request.getParameter("tot"+Integer.toString(i)));
    store++;
    }
    store++;
   lastrow.createCell((short)store++).setCellValue(request.getParameter("sum1"));
   lastrow.createCell((short)store++).setCellValue(request.getParameter("sum2"));
   lastrow.createCell((short)store++).setCellValue(request.getParameter("sum3"));
   lastrow.createCell((short)store++).setCellValue(request.getParameter("sum4"));
   lastrow.createCell((short)store++).setCellValue(request.getParameter("sum5"));
     
/* FileOutputStream fileOut = new FileOutputStream(home+"\\Downloads\\"+name+".xls");
wb.write(fileOut);
fileOut.close(); */

OutputStream outstr = response.getOutputStream();
wb.write(outstr);
outstr.close();


}catch ( Exception ex ){ 
    out.println(ex.getMessage());
} 
%>

    </body>
</html>
