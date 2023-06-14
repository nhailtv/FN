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
	<%@include file="includes/navbar.jsp"%>

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