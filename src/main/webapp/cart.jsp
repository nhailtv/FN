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
	<%@include file="includes/navbar.jsp"%>
	<!-- NavBar End-->

	<div class="container">
		<div class="d-flex py-3 ">
			<h3>Total Price:$ ${ (total>0)?dcf.format(total):0 }</h3>
			<a class="mx-3 btn btn-primary" href="#">Check-out</a>
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
						<form action="order-now-servlet" method="post">
							<input type="hidden" name="Name" value="<%c.getName();%>"
								class="form-input">
							<div class="form-group d-flex justify-content-between w-50">
								<a class="btn btn-sm btn-decre"
									href="quantity-inc-dec-servlet?action=dec&Name=<%=c.getName()%>"><i
									class="fas fa-minus-square"></i> </a> <input type="text" class=""
									name="quantity" class="form-control w-50"
									value="<%=c.getQuantity()%>" readonly> <a
									class="btn btn-sm btn-incre"
									href="quantity-inc-dec-servlet?action=inc&Name=<%=c.getName()%>"><i
									class="fas fa-plus-square"></i></a>
								<button type="submit" class="btn btn-primary btn-sm">Buy now</button>
							</div>
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