<%@page import="DAO.ProductDAO"%>
<%@page import="JDBC.ConnectJDBC"%>
<%@page import="Java.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

ProductDAO pd = new ProductDAO(ConnectJDBC.getConnection());
List<Product> prd = pd.getAllProducts();

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>

<!doctype html>
<html lang="en">
<head>
<%@include file="includes/Head.jsp"%>
<title>Index</title>
<style>
.card-img-top {
	height: 300px;
	object-fit: cover;
}
</style>
</head>
<body>
	<!-- NavBar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a href="#" class="fas fa-shopping-cart" sty></a> <a
				class="navbar-brand" href="Index.jsp">E-Shopee</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="Index.jsp">Home</a></li>
					<%
					if (auth != null) {
					%>
					<li class="nav-item"><a class="nav-link" href="cart.jsp">Cart
							<%
					if (cart_list.size() > 0) {
					%> <span class="badge bg-danger px-1">${cart_list.size()}</span> <%
 }
 %>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="orders.jsp">Order</a></li>
					<li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>
					<%
					} else {
					%>
					<li class="nav-item"><a class="nav-link" href="Login.jsp">Login</a></li>
					<%
					}
					%>
				
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="card-header my-3">All Products</div>
		<div class="row">
			<%
			if (!prd.isEmpty()) {
				for (Product p : prd) {
			%>
			<div class="col-md-4 col-sm-6 col-xs-12">
				<div class="card mb-4">
					<img src="img/<%=p.getImage()%>" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">
							Name:
							<%=p.getName()%></h5>
						<h6 class="price">
							price:
							<%=p.getPrice()%></h6>
						<h6 class="category">
							Category:
							<%=p.getCategory()%></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a href="add-to-cart?Name=<%=p.getName()%>" class="btn btn-dark">Add
								to cart!</a> <a
								href="order-now-servlet?quantity=1&Name=<%=p.getName()%>"
								class="btn btn-primary">Buy now!</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			}
			%>
		</div>
	</div>

	<%@include file="includes/Footer.jsp"%>
</body>
</html>
