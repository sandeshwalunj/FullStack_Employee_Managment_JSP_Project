<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up Form</title>




<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.css">

<!--<link rel="stylesheet" href="css/style.css">  -->
</head>
<body>
	<input type="hidden" id="status"
		value=<%=request.getAttribute("status")%>>


	<div class="container my-5">
		<div class="d-flex justify-content-center align-items-center">
			<div class="mx-4">
				<h2 class="mb-4 text-center">Sign up</h2>

				<form method="post" action="register" class="register-form"
					id="register-form" class="fs-4 fw-bold">
					<div class="row mb-3">
						<label for="name" class="col-sm-2 col-form-label">Name</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="name" id="name">
						</div>
					</div>
					<div class="row mb-3">
						<label for="email" class="col-sm-2 col-form-label">Email</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="email" id="email">
						</div>
					</div>
					<div class="row mb-3">
						<label for="password" class="col-sm-2 col-form-label">Password</label>
						<div class="col-sm-10">
							<input type="password" name="pass" class="form-control" id="pass">
						</div>
					</div>
					<div class="row mb-3">
						<label for="re-pass" class="col-sm-2 col-form-label">Repeate
							Password</label>
						<div class="col-sm-10">
							<input type="password" name="re_pass" id="re_pass"
								class="fw-bold fs-6 form-control" onchange="fun()"
								placeholder="Repeat your password" required />
						</div>
					</div>
					<div class="row mb-3">
						<label for="contact" class="col-sm-2 col-form-label">Contact</label>
						<div class="col-sm-10">
							<input type="number" name="contact" id="contact"
								class="fw-bold fs-6 form-control" placeholder="Contact no" />
						</div>
					</div>

					<div class="text-center">
						<input type="submit" class="btn btn-primary" name="signup"
							id="signup" class="form-submit" value="Register" />
					</div>
				</form>
			</div>
			<div class="signup-image">

				<img src="./register.png"
					class="img-fluid" alt="Sign up image" style="height: 500px;">
				<a href="login.jsp" class="signup-image-link fw-bold">I am
					already member</a>
			</div>
		</div>
	</div>



	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script type="text/javascript">
		var fun = function() {
			var repeatepassword = document.getElementById("re_pass");
			var pass = document.getElementById("pass").value;
			if (pass !== repeatepassword.value) {
				{
					swal("Failed", "Repeat Password did not match", "error");
				}
				document.getElementById("re_pass").value = "";
			}

		}
		fun();
		var status = document.getElementById("status").value;
		if (status == "success") {
			swal("Congrats", "Account Created Succesfully!", "success");
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	<script
		src="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.min.js"></script>

</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>