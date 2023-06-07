<%@page import="JDBC.ConnectJDBC"%>
<%@page import="Java.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth != null){
    	request.setAttribute("auth", auth);
    }
    %>
    
<!doctype html>
<html lang="en">
  <head>
   <%@include file = "includes/Head.jsp" %>
        <title>Index</title>
  </head>
  <body>
  
  <!-- NavBar -->
	<%@include file = "includes/navbar.jsp" %>
 <!-- NavBar End-->
    <% out.print(ConnectJDBC.getConnection());%>
    
    
    
    <%@include file = "includes/Footer.jsp" %>
  </body>
</html>