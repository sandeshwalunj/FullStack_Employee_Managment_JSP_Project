<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>

<div class="container border-2 rounded p-3 mt-4">


<form class="row g-3 text-center" action="update" method="post">

<h2 class=col-12>Edit Details</h2>
<input type="hidden" value="<c:out value="${user.id}"/>" name="id">
<div class="col-md-4">
<label class="form-label" for="empfirstname"> First Name</label>
<input class="form-control" type="text" name="empfirstname" value='<c:out value="${user.firstname}" />' required>
</div>
<div class="col-md-4">
<label class="form-label" for="empmiddlename">Middle Name</label>
<input type="text" name="empmiddlename" class="form-control" value='<c:out value="${user.middlename}" />' required>
</div>
<div class="col-md-4">
<label class="form-label" for="emplastname">Last Name</label>
<input type="text" name="emplastname" class="form-control" value='<c:out value="${user.lastname}"/>' required>
</div>
<div class="col-md-4">
<label class="form-label" for="Gender">Gender</label>
<select class="form-select" id="Gender" name="gender" required>
<option selected><c:out value="${user.gender}"/></option>
<option value="Male" >Male</option>
<option value="Femail" >Female</option>
<option value="Other">Other</option>
</select>
</div>
<div class="col-md-4">
<label class="form-label" for="empdob">DOB</label>
<input class="form-control" type="date" name="empdob" value='<c:out value="${user.dob}"/>' required >
</div>
<div class="col-md-4">
<label class="form-label" for="empposition">Position</label>
<input class="form-control" type="text" name="empposition" value='<c:out value="${user.position}"/>' required>
</div>
<div class="col-md-4">
<label class="form-label" for="email">Email ID</label>
<input class="form-control" type="text" name="email" value='<c:out value="${user.email}"/>' required>
</div>
<div class="row-md-4">
<input class="btn btn-lg btn-success " type="submit" value="Update">
</div>
</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>