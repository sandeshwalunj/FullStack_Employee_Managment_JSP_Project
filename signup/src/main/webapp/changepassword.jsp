<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="alert/dist/sweetalert.css">
</head>
<body>
<body style="background-color:#6DB9EF">
<div class="container mt-5 text-center fw-bold fs-4 ">
<input type="hidden" id="passmatch" value=<%=request.getAttribute("passmatch") %>>
  <form class="col-lg-6 mx-auto shadow-lg p-5 border-success" action="changepass" method="post" onsubmit="return validatepassword()">
    <div class="mb-3">
      <label for="oldpass" class="form-label">Old Password</label>
      <input type="password" class="form-control fs-4" name="oldpass" id="oldpass" required>
    </div>
    <div class="mb-3">
      <label for="newpass" class="form-label">New Password</label>
      <input type="password" class="form-control fs-4" id="newpass" name="newpass" required>
    </div>
    <div class="mb-3">
      <label for="confirmpass" class="form-label">Confirm New Password</label>
      <input type="password" class="form-control fs-4" name="confirmpass" id="confirmpass" required>
    </div>
    <button type="submit" class="btn btn-success">Change Password</button>
  </form>
</div>

<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script>
	var passmatch=document.getElementById("passmatch");
	if(passmatch.value=="fail")
		{
		swal("Failed!","Old password is Incorrect!","error");
		}
	function validatepassword() {
	    var newpass = document.getElementById("newpass");
	    var confirmpass = document.getElementById("confirmpass");
	    var oldpass=document.getElementById("oldpass")

	    if (newpass.value !== confirmpass.value) {
	        swal("Mismatch!", "New password and confirm password do not match.", "error");
	        newpass.value="";
	        confirmpass.value="";
	        oldpass.value="";
	        return false;
	    }

	    return true;
	}

	
	</script>
</body>
</html>