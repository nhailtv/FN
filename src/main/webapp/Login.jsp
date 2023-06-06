<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="includes/Head.jsp"%>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/styleLogin.css">
</head>
<body>
	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">User Login</div>
			<div class="card-body">

				<!-- Form dang nhap bat dau tu day -->
				<form action="" method="post">
				
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
