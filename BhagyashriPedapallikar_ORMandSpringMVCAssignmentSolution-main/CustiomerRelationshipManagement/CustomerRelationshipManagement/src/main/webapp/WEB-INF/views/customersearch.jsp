<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<title>Search Results</title>
</head>
<body>
	<div class='container'>
		<h1 style="background-color: aqua;">Customer Search Details</h1>

		<form action="/CustomerRelationshipManagement/customers/search"
			class="form-inline"></form>

		<table class="table table-bordered table-striped">
			<tr>

				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>


			</tr>
			<c:forEach items="${customers}" var="customer">
				<tr>

					<td>${customer.firstName}</td>
					<td>${customer.lastName}</td>
					<td>${customer.email}</td>
				</tr>
			</c:forEach>
		</table>
		<hr>
		<a href="/CustomerRelationshipManagement/customers/list">Back to
			Customers List</a>
	</div>
</body>
</html>