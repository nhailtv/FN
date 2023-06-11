<%@page import="DAO.ProductDAO"%>
<%@page import="java.util.*"%>
<%@page import="JDBC.ConnectJDBC"%>
<%@page import="Java.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list"); 
List<Cart> cartProducts  = null;
if(cart_list != null){
	ProductDAO pDao = new ProductDAO(ConnectJDBC.getConnection());
	cartProducts = pDao.getCartsProducts(cart_list);
	double total = pDao.GetTotalPrice(cart_list);
	request.setAttribute("cart_list",cart_list);
	request.setAttribute("total", total);
}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="includes/Head.jsp"%>
<style type="text/css">
	.table tbody td{
		vartical-align : middle;
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
			<h3>Total Price:$ ${ (total>0)?total:0 }</h3>
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
			<%if(cart_list != null){
				for(Cart c : cartProducts){
				System.out.println(c.getName());
				
				
				
				%>
					<tr>
					<td><%= c.getCategory()%></td>
					<td><%= c.getName()%></td>
					<td>$<%= c.getPrice() %></td>
					<td>
						<form action="" method="post" class="form-inline">
							<input type="hidden" name="id" value="<%c.getName();%>" class="form-input">
							<div class="form-group d-flex justify-content-between">
								<a class = "btn btn-sm btn-decre" href = "quantity-inc-dec-servlet"><i class = "fas fa-minus-square"></i></a>
								<input type = "text" class ="" name ="quantity" class = "form-control" value ="1" readonly>
								<a class = "btn btn-sm btn-incre" href = "quantity-inc-dec-servlet"><i class = "fas fa-plus-square"></i></a>
							</div>
						</form>
					</td>
					<td>
						<a class ="btn btn-sm btn-danger" href="">Remove</a>
					</td>
				</tr>
				<%}
				
			}
				%>
			
				


			</tbody>
		</table>
	</div>

	<%@include file="includes/Footer.jsp"%>
</body>
</html>