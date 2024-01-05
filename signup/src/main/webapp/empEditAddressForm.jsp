<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Update Employee Address</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        /* Center the form */
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
    </style>
</head>

<body>
    <form action="updateaddress" method="post" class="container">
        <h2 class="mb-4 text-center">Update Address Details</h2>
        <div class="row g-3">
        
       <div class="col-md-4">
                    <label class="form-label fs-5" for="id">Id</label>
                    <input class="form-control" id="id" type="text" name="addressID" value='<c:out value="${address.id}"/>' required>
                </div>
            <div class="col-md-4">
                <label class="form-label fs-5" for="country">Country</label>
                <input class="form-control" id="country" type="text" name="country" value='<c:out value="${address.country}"/>' required>
            </div>

            <div class="col-md-4">
                <label class="form-label fs-5" for="state">State</label>
                <input class="form-control" id="state" type="text" name="state" value='<c:out value="${address.state}"/>' required>
            </div>

            <div class="col-md-4">
                <label class="form-label fs-5" for="district">District</label>
                <input class="form-control" id="district" type="text" name="district" value='<c:out value="${address.district}"/>' required>
            </div>

            <div class="col-md-4">
                <label class="form-label fs-5" for="pincode">Pincode</label>
                <input class="form-control" id="pincode" type="number" name="pincode" value='<c:out value="${address.pincode}"/>' required>
            </div>

            <div class="col-md-4">
                <label class="form-label fs-5" for="city">City</label>
                <input class="form-control" id="city" type="text" name="city" value='<c:out value="${address.city}"/>' required>
            </div>

            <div class="col-12">
                <label class="form-label fs-5" for="address1">Address Line 1</label>
                <input class="form-control" id="address1" type="text" name="address1" value='<c:out value="${address.address1}"/>' required>
            </div>

            <div class="col-12">
                <label class="form-label fs-5" for="address2">Address Line 2</label>
                <input class="form-control" id="address2" type="text" name="address2" value='<c:out value="${address.address2}"/>' required>
            </div>

            <div class="col-12 mt-3 text-center">
                <button class="btn btn-lg btn-success " type="submit">Update</button>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
