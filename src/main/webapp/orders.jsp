<%@page import="JDBC.ConnectJDBC"%>
<%@page import="Java.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth != null){
    	request.setAttribute("auth", auth);
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list"); 

    if(cart_list != null){
    	request.setAttribute("cart_list",cart_list);
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file = "includes/Head.jsp" %>
<title>Orders</title>
</head>
<body>
<%@include file = "includes/navbar.jsp" %>
<%@include file = "includes/Footer.jsp" %>
</body>
</html>