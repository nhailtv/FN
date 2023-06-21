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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<%@include file="includes/Head.jsp"%>
<title>Index</title>
<style>
.card-img-top {
	height: 300px;
	object-fit: cover;
}
.input-group {
    position: relative;
    display: flex;
    flex-wrap: wrap;
    align-items: stretch;
    width: 50%;
     margin: 0 auto;
}

  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  

</style>
</head>
<body>
<script>
    // Get the current scroll position
    var scrollPos = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0;

    // Store the scroll position in a hidden input field
    document.getElementById("scrollPosInput").value = scrollPos;

    // Restore the scroll position after page reloads
    window.onload = function() {
        var storedScrollPos = document.getElementById("scrollPosInput").value;
        window.scrollTo(0, storedScrollPos);
    };
</script>

<input type="hidden" id="scrollPosInput" name="scrollPos" />


	<!-- NavBar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container">
			<a class="navbar-brand" href="Index.jsp"> <img src="img/Logo.png"
				alt="GoodGear Logo" class="nav-logo"> <span class="brand-text">GoodGear</span>
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
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="Index.jsp"><i class="fas fa-home"></i>
							Home</a></li>
					<%
					if (auth != null) {
						if (cart_list != null && cart_list.size() > 0) {
					%>
					<li class="nav-item"><a class="nav-link" href="cart.jsp">
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
	
	<div class="container ">
		 	<div class="alert alert-success text-center mt-4"> <strong>We have update many keyboards with good price! The picture below is products that will arrived soon.</strong></div>
		       </div>
	
	
<div id="demo" class="carousel slide" data-ride="carousel" style="padding-top:50px ">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active bg-dark"></li>
    <li data-target="#demo" data-slide-to="1" class="bg-dark"></li>
    <li data-target="#demo" data-slide-to="2" class="bg-dark"></li>
    <li data-target="#demo" data-slide-to="3" class="bg-dark"></li>
    
  </ul>
  
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/Dyno75-V2.png" alt="PC" style="margin:auto;width:20%;heigt:25%;display:flex;" >
    </div>
    <div class="carousel-item">
      <img src="img/c2.jpg" alt="PC"  style="margin:auto;width:15%;heigt:25%;display:flex;">
    </div>
    <div class="carousel-item">
      <img src="img/c3.jpg" alt="PC"  style="margin:auto;width:13%;heigt:15%;display:flex;">
    </div>
    <div class="carousel-item">
      <img src="img/c4.jpg" alt="PC"  style="margin:auto;width:15%;heigt:15%;display:flex;">
    </div>
     
  
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon bg-dark"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon bg-dark"></span>
  </a>
</div>
	
	
	
	<div class="container">
		<form action="search-servlet" method="get" class="my-3">
			<div class="input-group">
				<input type="text" name="search" class="form-control"
					placeholder="Search" style="width: 50%">
				<button class="btn btn-primary" type="submit">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<a href="SortedProduct.jsp" class="btn btn-outline-info">Display by category!</a>
    </div>



<div class="container">
    <div class="card-header my-3">All Products</div>
      
    
    <div class="row">
        <%
        if (!prd.isEmpty()) {
            List<Product> inStockProducts = new ArrayList<>();
            List<Product> outOfStockProducts = new ArrayList<>();

            for (Product p : prd) {
                if (p.getStock() > 0) {
                    inStockProducts.add(p);
                } else {
                    outOfStockProducts.add(p);
                }
            }

            for (Product p : inStockProducts) {
        %>
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="card mb-4">
                <img src="img/<%=p.getImage()%>" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">
                        Name:
                        <%=p.getName()%>
                    </h5>
                    <h6 class="category">
                        Category:
                        <%=p.getCategory()%>
                    </h6>
                    <h6 class="category" style="color: blue;">
                        <h6 class="price">
                            Price: <span class="text-success rounded px-2 fs-5">$<%=p.getPrice()%></span>
                        </h6>
                        <h6 class="text-primary">
                            In-Stock:
                            <%=p.getStock()%>
                        </h6>
                        <%
                        if (auth != null) {
                        %>
                        <div class="mt-3 d-flex justify-content-between">
                            <a href="add-to-cart?Name=<%=p.getName()%>" class="btn btn-dark">Add to cart!</a>
                            <a href="order-now-servlet?quantity=1&Name=<%=p.getName()%>" class="btn btn-primary">Buy now!</a>
                        </div>
                        <%
                        }
                        %>
                    </h6>
                </div>
            </div>
        </div>
        <%
            }
            for (Product p : outOfStockProducts) {
        %>
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="card mb-4">
                <img src="img/<%=p.getImage()%>" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">
                        Name:
                        <%=p.getName()%>
                    </h5>
                    <h6 class="category">
                        Category:
                        <%=p.getCategory()%>
                    </h6>
                    <h6 class="category" style="color: red;">
                        Out of Stock
                    </h6>
                </div>
            </div>
        </div>
        <%
            }
        }
        %>
    </div>
</div>



	<footer class="footer bg-dark text-white py-5 text-center text-white mt-4">
		<div class="container">
		 	<div class="alert alert-success"> <strong>NEW PRODUCTS ARRIVED SOON! SEE YOU AT OUR EVENT!</strong><pre> Make sure you don't miss this! <a href="#" style="text-decoration:none">Join now !</a></pre></div>
		       </div>
		
		<div class="container">
			<div class="row">
				<div class="col">
					<h5>WEB-Maker:</h5>
					<ul class="list-unstyled">
						<li>Thai Ba Bau</li>
						<li>Nguyen Hong Nguyen Hai</li>
					</ul>
				</div>
				<div class="col">
					<h5>WEB-Language:</h5>
					<ul class="list-unstyled">
						<li>Java</li>
						<li>HTML</li>
						<li>CSS</li>
					</ul>
				</div>
				<div class="col">
					<a href="aboutUS.jsp" style="text-decoration: none;" class="button"><h4>Contact us !</h4><a>
					
				</div>
			</div>
		</div>
	</footer>


	<%@include file="includes/Footer.jsp"%>
</body>
</html>
