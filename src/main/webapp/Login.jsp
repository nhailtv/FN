<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="Java.*"%>
<%@page import="java.util.*"%>
 <%
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth != null){
    	response.sendRedirect("Index.jsp");
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
<%@include file="includes/Head.jsp"%>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/styleLogin.css">
</head>
<body>

<!-- NavBar -->
<nav class="navbar navbar-expand-lg bg-body-tertiary">
	<div class="container-fluid">
		<a href="#" class="fas fa-shopping-cart" sty></a>
		<a class="navbar-brand" href="Index.jsp">E-Shopee</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link"
					aria-current="page" href="Index.jsp">Home</a></li>
				<%
				if (auth != null) {
				%>
				<li class="nav-item"><a class="nav-link" href="cart.jsp">Cart
					<% if (cart_list.size() > 0) { %>
						<span class="badge bg-danger px-1">${cart_list.size()}</span>
					<% } %>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="orders.jsp">Order</a></li>
				<li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>
				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link active" href="Login.jsp">Login</a></li>
				<%
				}
				%>
			
		</div>
	</div>
</nav>

	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">User Login</div>
			<div class="card-body">

				<!-- Form dang nhap bat dau tu day -->
				<form action="LoginServlet" method="post">
				
					<!-- Email -->
					<div class="form-group mb-5">
						<label>Email</label>
						<input type="email" class="form-control" name="Login-email" placeholder="Put your Email here!" required="required">
					</div>
					
					<!-- Password -->
					<div class="form-group mb-3">
						<label>Password</label>
						<input type="password" class="form-control" name="Login-password" placeholder="Put your password here!" required="required">
					</div>
					
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Login</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@include file="includes/Footer.jsp"%>
</body>
</html>
