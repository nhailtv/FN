<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="java.util.*"%>
<%@page import="JDBC.ConnectJDBC"%>
<%@page import="Java.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProducts = null;
if (cart_list != null) {
	ProductDAO pDao = new ProductDAO(ConnectJDBC.getConnection());
	cartProducts = pDao.getCartsProducts(cart_list);
	double total = pDao.GetTotalPrice(cart_list);
	request.setAttribute("cart_list", cart_list);
	request.setAttribute("total", total);
}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="includes/Head.jsp"%>

<style type="text/css">
.table tbody td {
	vartical-align: middle;
}
</style>
<meta charset="ISO-8859-1">
<title>Cart page</title>
</head>
<body>
<!-- NavBar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container">
			<a class="navbar-brand" href="Index.jsp">
				<img src="img/Logo.png" alt="GoodGear Logo" class="nav-logo">
				<span class="brand-text">GoodGear</span>	
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-between"
				id="navbarSupportedContent">
				<ul class="navbar-nav mx-auto">
					<li class="nav-item"><a class="nav-link"
						aria-current="page" href="Index.jsp"><i class="fas fa-home"></i>
							Home</a></li>
					<%
					if (auth != null) {
						if (cart_list != null && cart_list.size() > 0) {
					%>
					<li class="nav-item"><a class="nav-link active" href="cart.jsp">
							<i class="fas fa-shopping-cart"></i> Cart <span
							class="badge bg-danger px-1">${cart_list.size()}</span>
					</a></li>
					<%
					} else {
					%>
					<li class="nav-item"><a class="nav-link" href="cart.jsp"><i
							class="fas fa-shopping-cart"></i> Cart</a></li>
					<%
					}
					%>
					<li class="nav-item"><a class="nav-link" href="orders.jsp"><i
							class="fas fa-clipboard-list"></i> Order</a></li>
					<%
					} else {
					%>
					<li class="nav-item"><a class="nav-link" href="Login.jsp"><i
							class="fas fa-sign-in-alt"></i> Login</a></li>
					<%
					}
					%>
				</ul>
				<ul class="navbar-nav">
					<%
					if (auth != null) {
					%>
					<li class="nav-item"><a class="nav-link" href="log-out"><i
							class="fas fa-sign-out-alt"></i> Logout</a></li>
					<%
					}
					%>
				</ul>
			</div>
		</div>
	</nav>


	<div class="container">
		<div class="d-flex py-3 ">
			<h3>Total Price:$ ${ (total>0)?dcf.format(total):0 }</h3>
			<a class="mx-3 btn btn-primary" href="check-out-servlet">Check-out</a>
		</div>
		<table class="table table-loght">
			<thread>
			<tr>
				<th scope="col">Name</th>
				<th scope="col">Category</th>
				<th scope="col">Price</th>
				<th scope="col">Buy now</th>
				<th scope="col">Cancel</th>
			</tr>
			</thread>
			<tbody>
				<%
				if (cart_list != null) {
					for (Cart c : cartProducts) {
				%>
				<tr>
					<td><%=c.getCategory()%></td>
					<td><%=c.getName()%></td>
					<td>$<%=dcf.format(c.getPrice())%></td>
					<td>
						<form action="order-now-servlet" method="post"
							class="d-flex align-items-center">
							<input type="hidden" name="Name" value="<%=c.getName()%>"
								class="form-input">
							<div class="form-group w-50">
								<div class="d-flex justify-content-between align-items-center">
									<a class="btn btn-sm btn-decre"
										href="quantity-inc-dec-servlet?action=dec&Name=<%=c.getName()%>"><i
										class="fas fa-minus-square"></i></a> <input type="text"
										name="quantity" class="form-control w-100"
										value="<%=c.getQuantity()%>" readonly> <a
										class="btn btn-sm btn-incre"
										href="quantity-inc-dec-servlet?action=inc&Name=<%=c.getName()%>"><i
										class="fas fa-plus-square"></i></a>
								</div>
							</div>
							<button type="submit" class="btn btn-primary btn-sm">Buy now</button>
						</form>


					</td>
					<td><a class="btn btn-sm btn-danger"
						href="remove-from-cart-servlet?Name=<%=c.getName()%>">Remove</a></td>
				</tr>
				<%
				}

				}
				%>




			</tbody>
		</table>
	</div>


	<%@include file="includes/Footer.jsp"%>
</body>
</html>