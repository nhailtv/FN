<%@page import="DAO.ProductDAO"%>
<%@page import="JDBC.ConnectJDBC"%>
<%@page import="Java.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth",auth);
}


ProductDAO pd= new ProductDAO(ConnectJDBC.getConnection());
List<Product> prd = pd.getAllProducts();
%>

<!doctype html>
<html lang="en">
<head>
<%@include file="includes/Head.jsp"%>
<title>Index</title>

<style>
    .card-img-top {
        height: 200px;
        object-fit: cover;
    }
	</style>

</head>
<body>

	<!-- NavBar -->
	<%@include file="includes/navbar.jsp"%>
	<!-- NavBar End-->
	
	<div class="container">
    <div class="card-header my-3">All Products</div>
    <div class="row">
        <% if(!prd.isEmpty()) {
            for(Product p : prd) {
                %>
                <div class="col-md-3 my-3">
                    <div class="card h-100" style="width: 18rem;">
                        <img src="img/<%=p.getImage() %>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Name: <%= p.getName()%></h5>
                            <h6 class="price">price: <%=p.getPrice() %></h6>
                            <h6 class="category">Category: <%=p.getCategory() %></h6>
                            <div class="mt-3 d-flex justify-content-between">
                                <a href="#" class="btn btn-primary">Add to cart!</a> 
                                <a href="#" class="btn btn-primary">Buy now!</a>
                            </div>
                        </div>
                    </div>
                </div>
                
            <% }
        } %>
    </div>
</div>





	<%@include file="includes/Footer.jsp"%>
</body>
</html>