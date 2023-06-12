
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
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="Index.jsp">Home</a></li>
				<%
				if (auth != null) {
				%>
				<li class="nav-item"><a class="nav-link" href="cart.jsp">Cart<span class="badge bg-danger px-1">${cart_list.size()}</span></a></li>
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