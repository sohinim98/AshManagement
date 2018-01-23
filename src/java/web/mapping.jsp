<%-- 
    Document   : mapping
    Created on : Jul 24, 2017, 4:45:48 PM
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
    <body style="background-color:#FFEFDF">
        <%@ include file="style.html" %>
        <a href="index.jsp"><img src="back.png" alt="back_logo" style="width:40px;height:25px"></a>
        <br/> <br/> <br/>
        <img src="customer.png" width="64" height="64" align="left" alt="customer_logo"/>
        <img src="truck.png" width="64" height="64" align="right" alt="transporter_logo"/>
        <h1 style="font-size:300%;text-align:center;font-family:cooperblack">Customer-Transporter Mapping</h1>
        <%@ include file="con1.jsp" %>
        <%
PreparedStatement selectTrans = null;
ResultSet rs = null;
ResultSet rs1 = null;
ResultSet rs2 = null;
selectTrans = connection.prepareStatement("SELECT c.SRL_NO, c.CUSTOMER_CODE, c.TRANSPORTER_CODE, c.ENABLED_FLAG, a.CUSTOMER_NAME, b.TRANSPORTER_NAME FROM customer_mst a, transporter_mst b, customer_transporter_map c WHERE a.CUSTOMER_CODE = c.CUSTOMER_CODE AND b.TRANSPORTER_CODE = c.TRANSPORTER_CODE" );
rs = selectTrans.executeQuery();
selectTrans = connection.prepareStatement("SELECT CUSTOMER_CODE, CUSTOMER_NAME FROM customer_mst" );
rs1 = selectTrans.executeQuery();
selectTrans = connection.prepareStatement("SELECT TRANSPORTER_CODE, TRANSPORTER_NAME FROM transporter_mst" );
rs2 = selectTrans.executeQuery();


              %>
              <form name="myform" action="datamapping.jsp" method="POST">
                <div style="overflow-x:auto;">
                    <div style="overflow-y:auto;">
                        <table id="customers" style="text-align:center;background-color:#FFEFDF" align="center" border="1">
                  <tbody>
                      <tr>
                          <td>Serial Number</td>
                          <td>Customer Code</td>
                          <td>Customer Name (Automatic Alteration)</td>
                          <td>Transporter Code</td>
                          <td>Transporter Name (Automatic Alteration)</td>
                          <td>Enabled Flag</td>
                          <td>Update/Delete/Insert</td>
                      </tr>
                      <% int n = 1;
                      while(rs.next()) {
                          String s= Integer.toString(n);
                          ResultSet rs3 = null;
                          selectTrans = connection.prepareStatement("SELECT CUSTOMER_CODE, CUSTOMER_NAME FROM customer_mst" );
                          rs3 = selectTrans.executeQuery();
                          ResultSet rs4 = null;
                          selectTrans = connection.prepareStatement("SELECT TRANSPORTER_CODE, TRANSPORTER_NAME FROM transporter_mst" );
                          rs4 = selectTrans.executeQuery();
                      %>
                      <tr>
                          <td><input type="text" name="sn<%=s%>" value="<%= rs.getString(1)%>" size="10" readonly="readonly"/></td>
                          <td><select name="cc<%=s%>" style="width: 100%">
                                  <option value= "<%= rs.getString(2)%>" hidden selected="selected"> <%= rs.getString(2)%> </option>
                                  <% while(rs3.next()) { %>
                                  <option value= "" disabled><%= rs3.getString(2)%> - <%= rs3.getString(1)%></option>
                                  <option value= "<%= rs3.getString(1)%>" ><%= rs3.getString(1)%></option>
                                  <% } %>
                              </select></td>
                          <td><input type="text" name="cn<%=s%>" value="<%= rs.getString(5)%>" size="50" readonly="readonly"/></td>
                          <td><select name="tc<%=s%>" style="width: 100%">
                                  <option value= "<%= rs.getString(3)%>" hidden selected="selected"> <%= rs.getString(3)%> </option>
                                  <% while(rs4.next()) { %>
                                  <option value= "" disabled><%= rs4.getString(2)%> - <%= rs4.getString(1)%></option>
                                  <option value= "<%= rs4.getString(1)%>"><%= rs4.getString(1)%></option>
                                  <% } %>
                              </select></td>
                          <td><input type="text" name="tn<%=s%>" value="<%= rs.getString(6)%>" size="50" readonly="readonly"/></td>
                          <td><select name="ef<%=s%>">
                                  <option value="<%= rs.getString(4)%>" hidden selected="selected"><%= rs.getString(4)%></option>
                                  <option value= "Y">Y</option>
                                  <option value= "N">N</option>
                              </select></td>
                          <td><select name="mylist<%=s%>">
                                  <option hidden value="" selected>Choose Action</option>
                                  <option value= "Update">Update</option>
                                  <option value= "Delete">Delete</option>
                              </select></td>
                      </tr>
                      <% n++; } %>
                      <tr>
                          <td><input type="text" name="sn0" value="<%= n%>" size="5" readonly="readonly" /></td>
                          <td><select name="cc0" style="width: 100%">
                                  <option value= "" hidden selected="selected">Pick Customer</option>
                                  <% while(rs1.next()) { %>
                                  <option value= "" disabled><%= rs1.getString(2)%> - <%= rs1.getString(1)%></option>
                                  <option value= "<%= rs1.getString(1)%>"><%= rs1.getString(1)%></option>
                                  <% } %>
                              </select></td>
                          <td><input type="text" name="cn0" value="WILL BE FILLED AUTOMATICALLY AS PER THE CODE" size="50" readonly="readonly"/></td>
                          <td><select name="tc0" style="width: 100%">
                                  <option value= "" hidden selected="selected" style="">Pick Transporter</option>
                                  <% while(rs2.next()) { %>
                                  <option value= "" disabled><%= rs2.getString(2)%> - <%= rs2.getString(1)%></option>
                                  <option value= "<%= rs2.getString(1)%>"><%= rs2.getString(1)%></option>
                                  <% } %>
                              </select></td>
                          <td><input type="text" name="tn0" value="WILL BE FILLED AUTOMATICALLY AS PER THE CODE" size="50" readonly="readonly"/></td>
                          <td><select name="ef0">
                                  <option hidden selected="selected" value = "">Y/N</option>
                                  <option value = "Y">Y</option>
                                  <option value = "N">N</option>
                              </select></td>
                          <td><select name="mylist0">
                                  <option hidden value= "" selected="selected">Confirm Insertion</option>
                                  <option value= "Insert">Insert</option>
                              </select></td>
                      </tr>
                  </tbody>
                </table>
                    </div>
                </div>
                      <% n--;
                          String s= Integer.toString(n); %>
                      <input type="hidden" name="counter" value="<%=s%>" />     
                <p align="center">
                    <input class="button" type="reset" value="Reset" name="reset" />
                      <input class="button" type="submit" value="Save" name="submit" /> 
                </p>
              </form>       
    </body>
</html>
