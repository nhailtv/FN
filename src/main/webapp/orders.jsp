<%@page import="java.util.List"%>
<%@page import="DAO.OrderDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="JDBC.ConnectJDBC"%>
<%@page import="Java.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
 DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
List<Order> orders = null ;
if (auth != null) {
	request.setAttribute("auth", auth);
	orders = new OrderDAO(ConnectJDBC.getConnection()).userOrder(auth.getEmail());
	
} else {
	//response.sendRedirect("Login.jsp");
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="includes/Head.jsp"%>
<title>Orders</title>
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
				<li class="nav-item"><a class="nav-link active" href="orders.jsp">Order</a></li>
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
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thread>
			<tr>
				<th scope="col">Date</th>
				<th scope="col">Name</th>
				<th scope="col">Category</th>
				<th scope="col">Quantity</th>
				<th scope="col">Price</th>
				<th scope="col">Cancel</th>
			</tr>
			</thread>
			<tbody>
			<%
			if(orders != null){
				for(Order o: orders){%>
					<td> <%=o.getDate() %></td>
					<td> <%=o.getOrderName() %></td>
					<td><%=o.getCategory() %></td>
					<td><%=o.getQuantity() %></td>
					<td><%= dcf.format(o.getPrice())%></td>
					<td><a class = "btn btn-sm btn-danger" href ="cancel-order-servlet?Name=<%=o.getOrderName()%>" >Cancel</a></tr>
				<% }
			}else{
				System.out.print("null orders");
			}
			%>
			</tbody>
		</table>
	</div>


	<%@include file="includes/Footer.jsp"%>
</body>
</html>