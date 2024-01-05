
<%
if (session.getAttribute("name") == null) {
	response.sendRedirect("login.jsp");
}
%>


<!DOCTYPE html>
<html lang="en">

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Home Page</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	
	 />
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	


	
</head>

<body id="page-top">

	<!-- Navigation-->
	<nav class="navbar bg-body-tertiary navbar-expand-lg fw-bold text-uppercase mb-4"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top">Logo Goes Here</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#portfolio">HomePage</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#about">About</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#contact">Contact</a></li>
				</ul>
				<div class="btn-group mx-0 mx-lg-1 mt-2">
					<button
						class="btn btn-primary dropdown-toggle fw-bold text-uppercase" data-toggle="dropdown"
						type="button" data-bs-toggle="dropdown" aria-expanded="false">
						<%=session.getAttribute("name")%>
					</button>
					<ul class="dropdown-menu text-white">
						<li><a class="dropdown-item active bg-success"
							href="index.jsp">My Profile</a></li>
						<li><a class="dropdown-item" href="changepassword.jsp">Change
								Password</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="logout">LogOut</a></li>
					</ul>
				</div>

			</div>
		</div>
	</nav>




	<section class="page-section portfolio mt-5" id="portfolio">
		<div class="container">
			<div class="row mb-4">
				<div class="col-12 d-flex justify-content-end">

					<form class="d-flex me-2" role="search">
						<input type="search" class="form-control fs-4 me-4 rounded" id="searchInput" oninput="searchTable()" placeholder="Search by email">
						
					</form>
				</div>
			</div>
		</div>
		<div class="container">
		<c:if test="${not empty listUser}">
			<table class="table table-striped table-bordered">
				<thead class="bg-primary text-white text-center">
					<tr>
						<th>Emp ID</th>
						<th>First Name</th>
						<th>Middle Name</th>
						<th>Last Name</th>
						<th>Gender</th>
						<th>DOB</th>
						<th>Position</th>
						<th>Email ID</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody class="text-center">
					<c:forEach var="user" items="${listUser }">
						<tr>
							<td><c:out value="${user.id}" /></td>

							<td><c:out value="${user.firstname}" /></td>

							<td><c:out value="${user.middlename}" /></td>

							<td><c:out value="${user.lastname}" /></td>

							<td><c:out value="${user.gender}" /></td>

							<td><c:out value="${user.dob}" /></td>

							<td><c:out value="${user.position}" /></td>

							<td><c:out value="${user.email}" /></td>
							<td><a href="edit?id=${user.id}"
								class="btn btn-primary me-2">Edit</a> <a
								href="delete?id=${user.id }" class="btn btn-danger" onclick="return confirm('Are you sure to delete!');">Delete</a></td>
						</tr>
					</c:forEach>
				
				</tbody>
			</table>
			</c:if>
			<div class="text-center">
			<a class=" btn btn-lg btn-primary" href="empForm.jsp">Add
				Employee</a>
				</div>
		</div>

	</section>
	<section class="page-section portfolio mt-5" id="portfolio">
	<c:if test="${not empty listAddress }">
		<div class="container">
			<div class="row mb-4">
				<div class="col-12 d-flex justify-content-end">

					<form class="d-flex  me-2" role="search">
						<input type="search" class="form-control fs-4 me-4 rounded" id="searchAddress" oninput="searchAddressTable()" placeholder="Search by State">
						
					</form>
				</div>
			</div>
		</div>
		<div class="container">
			<table class="table table-striped table-bordered" id="searchTable">
				<thead class="bg-primary text-white text-center">
					<tr>
						<th>Address ID</th>
						<th>Country</th>
						<th>State</th>
						<th>District</th>
						<th>Pin code</th>
						<th>City</th>
						<th>Address1</th>
						<th>Address2</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody class="text-center">
					<c:forEach var="address" items="${listAddress }">
						<tr>
							<td><c:out value="${address.id}" /></td>

							<td><c:out value="${address.country}" /></td>

							<td><c:out value="${address.state}" /></td>

							<td><c:out value="${address.district}" /></td>

							<td><c:out value="${address.pincode}" /></td>

							<td><c:out value="${address.city}" /></td>

							<td><c:out value="${address.address1}" /></td>

							<td><c:out value="${address.address2}" /></td>
							<td><a href="editaddress?id=${address.id}"
								class="btn btn-primary me-2" >Edit</a> <a
								href="deleteaddress?id=${address.id }" class="btn btn-danger" onclick="return confirm('Are you sure to delete!');">Delete</a></td>
						</tr>
					</c:forEach>
				
				</tbody>
			</table>
			</div>
			</c:if>
			<div class="text-center">
			<a class=" btn btn-lg btn-primary mt-3r" href="addAddress.jsp">Add
				Address</a>
				</div>
	</section>
	<input type="hidden" value=<%=request.getAttribute("passmatch")%>
		id="passmatch">
	<input type="hidden" value=<%=request.getAttribute("DetailStatus")%>
		id="detailstatus">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://kit.fontawesome.com/ec9165f223.js" ></script>
	
	

	<%
	String successMessage = (String) session.getAttribute("loginstatus");
	if (successMessage != null && successMessage.equals("success")) {
	%>
	<script>
		swal("Success!", "Account Logged In Successfully!", "success");
	</script>
	<%
	session.removeAttribute("loginstatus");
	}
	%>

	<script>
		var passmatch = document.getElementById("passmatch");
		var detailstatus = document.getElementById("detailstatus");
		if (passmatch.value == "success") {
			swal("Success", "Password Change Successfully!", "success");
		}
		if (detailstatus.value == "success") {
			swal("Success", "Employee Details Added Successfully!", "success");
		}
		function searchTable() {
	        var input, table, tr, td, i, txtValue;
	        input = document.getElementById("searchInput").value.trim().toLowerCase();
	        
	        table = document.querySelector(".table");
	        tr = table.getElementsByTagName("tr");

	        for (i = 0; i < tr.length; i++) {
	            td = tr[i].getElementsByTagName("td")[7];
	            if (td) {
	                txtValue = td.textContent || td.innerText;
	                txtValue=txtValue.toLowerCase();
	                if (txtValue.indexOf(input) > -1) {
	                    tr[i].style.display = "";
	                } else {
	                    tr[i].style.display = "none";
	                }
	            }
	            
	        }
	    }
		function searchAddressTable()
		{
			 var input, table, tr, td, i, txtValue;
		        input = document.getElementById("searchAddress").value.trim().toLowerCase();
		        
		        table = document.querySelector("#searchTable");
		        tr = table.getElementsByTagName("tr");

		        for (i = 0; i < tr.length; i++) {
		            td = tr[i].getElementsByTagName("td")[2];
		            if (td) {
		                txtValue = td.textContent || td.innerText;
		                txtValue=txtValue.toLowerCase();
		                if (txtValue.indexOf(input) > -1) {
		                    tr[i].style.display = "";
		                } else {
		                    tr[i].style.display = "none";
		                }
		            }
		            
		        }
		}
		
		
	</script>
</body>

</html>
