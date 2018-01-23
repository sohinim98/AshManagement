<%-- 
    Document   : customer
    Created on : Jul 15, 2017, 11:43:53 AM
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
    <body style="background-color:#E6E6FA">
        <a href="index.jsp"><img src="back.png" alt="back_logo" style="width:40px;height:25px"></a>

                <br/> <br/> <br/>
        <img src="customer.png" width="64" height="64" align="left" alt="customer_logo"/>
        <h1 style="font-size:300%;text-align:center;font-family:cooperblack">Customer Master</h1>
        <%@ include file="con1.jsp" %>
        <%@ include file="style.html" %>
        <% PreparedStatement selectTrans = null;
ResultSet rs = null;
selectTrans = connection.prepareStatement("SELECT * FROM customer_mst" );
rs = selectTrans.executeQuery();

              %>
              <form name="myform0" action="datacustomer.jsp" method="POST">
                  <div style="overflow-x:auto;">
                      <div style="overflow-y:auto;">
                <table id="customers" style="text-align:center;background-color:#FFEFDF" align="center" border="1">
                  <tbody>
                      <tr>
                          <td>Customer Code</td>
                          <td>Customer Name</td>
                          <td>Enabled Flag</td>
                          <td>Update/Delete/Insert</td>
                      </tr>
                      <% int n = 1;
                      while(rs.next()) {
                          String s= Integer.toString(n); %>
                      <tr>
                          <td><input type="text" name="cc<%=s%>" value="<%= rs.getString(1)%>" size="5" readonly="readonly"/></td>
                          <td><input type="text" name="cn<%=s%>" value="<%= rs.getString(2)%>" size="50" /></td>
                          <td><select name="ef<%=s%>">
                                  <option value="<%= rs.getString(3)%>" hidden selected="selected"><%= rs.getString(3)%></option>
                                  <option value= "Y">Y</option>
                                  <option value= "N">N</option></select></td>
                          <td><select name="mylist<%=s%>">
                                  <option hidden value="" selected>Choose Action</option>
                                  <option value= "Update">Update</option>
                                  <option value= "Delete">Delete</option>
                              </select></td>
                      </tr>
                      <% n++; } %>
                      <tr>
                          <td><input type="text" name="cc0" value="" size="5" /></td>
                          <td><input type="text" name="cn0" value="" size="50" /></td>
                          <td><select name="ef0">
                                  <option hidden selected="selected" value = "">Y/N</option>
                                  <option value = "Y">Y</option>
                                  <option value = "N">N</option>
                              </select></td>
                          <td><select name="mylist0">
                                  <option hidden value= "" selected>Confirm Insertion</option>
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
                    <input type="reset" class="button" value="Reset" name="reset" />
                      <input type="submit" class="button" value="Save" name="submit" />
                </p>
              </form>
    </body>
</html>
