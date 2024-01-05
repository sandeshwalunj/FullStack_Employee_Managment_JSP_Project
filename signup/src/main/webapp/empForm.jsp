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


<form action="insert" method="post">

<div class="container row g-3 mb-4">
<h2 class="col-12 mb-4 text-left">Personal Details</h2>
<input type="hidden" value="<c:out value="${user.id }"/>" name="id">
<div class="col-md-4">
<label class="form-label fs-4" for="empfirstname"> First Name</label>
<input class="form-control" type="text" name="empfirstname" value='<c:out value="${user.firstname}" />' required>
</div>
<div class="col-md-4">
<label class="form-label fs-4" for="empmiddlename">Middle Name</label>
<input type="text" name="empmiddlename" class="form-control" value='<c:out value="${user.middlename}" />' required>
</div>
<div class="col-md-4">
<label class="form-label fs-4" for="emplastname">Last Name</label>
<input type="text" name="emplastname" class="form-control" value='<c:out value="${user.lastname}"/>' required>
</div>
<div class="col-md-4">
<label class="form-label fs-4" for="Gender">Gender</label>
<select class="form-select" id="Gender" name="gender" required>
<option value="" selected>Select Gender</option>
<option value="Male" >Male</option>
<option value="Femail" >Female</option>
<option value="Other">Other</option>
</select>
</div>
<div class="col-md-4">
<label class="form-label fs-4" for="empdob">DOB</label>
<input class="form-control" type="date" name="empdob" value='<c:out value="${user.dob}"/>' required>
</div>
<div class="col-md-4">
<label class="form-label fs-4" for="empposition">Position</label>
<input class="form-control" type="text" name="empposition" value='<c:out value="${user.position}"/>' required>
</div>
<div class="col-md-4 mb-4">
<label class="form-label fs-4" for="email">Email ID</label>
<input class="form-control" type="text" name="email" value='<c:out value="${user.email}"/>' required>
</div>

<div class="col-md-4 mb-4">
<label class="form-label fs-4" for="mobile">Mobile Number</label>
<input class="form-control" id="mobile" type="text" name="mobile" value='<c:out value="${user.mobile}"/>' required>
</div>
</div>

<div class="row-md-4 text-center">
<input class="btn btn-lg btn-primary mb-4 " type="submit" value="submit">
</div>
</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>