<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<style>
h3 {
	text-align: center;
	background-color: #347B98;
}
</style>
</head>
<body>
	<div class='container'>

		<h3 style="background-color: aqua;">Customer Relationship
			Management</h3>

		<br> <br>
		<form action="/CustomerRelationshipManagement/customers/search"
			class="form-inline">

			<!-- 			!Add a button -->
			<a href="/CustomerRelationshipManagement/customers/add"
				class="btn btn-secondary btn-sm mb-3"> Add Customer </a> <input
				type="search" name="firstName" placeholder="first Name"
				class="form-control-sm ml-5 mr-2 mb-3" /> <input type="search"
				name="lastName" placeholder="last name"
				class="form-control-sm mr-2 mb-3" />

			<button type="submit" class="btn btn-success btn-sm mb-3">Search</button>
			<br> <br>
		</form>
		<table class="table table-striped">
			<tr>
				<th style="background-color: aqua;">First Name</th>
				<th style="background-color: aqua;">Last Name</th>
				<th style="background-color: aqua;">Email</th>
				<th style="background-color: aqua;">Action</th>

			</tr>
			<c:forEach items="${customers}" var="customer">
				<tr>
					<td>${customer.firstName }</td>
					<td>${customer.lastName }</td>
					<td>${customer.email }</td>
					<td>
						<!-- Add "update" button/link --> <a
						href="/CustomerRelationshipManagement/customers/update?custId=${customer.custId}"
						class="btn btn-link btn-sm"> Update </a> <!-- Add "delete" button/link -->
						<a
						href="/CustomerRelationshipManagement/customers/delete?custId=${customer.custId}"
						class="btn btn-link btn-sm"
						onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">
							Delete </a>
					</td>
				</tr>

			</c:forEach>
		</table>
	</div>
</body>
</html>