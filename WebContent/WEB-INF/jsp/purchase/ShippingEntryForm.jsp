<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment entry form</title>
<style>
table, th, td {
border: 1px solid black;
}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	
<form:form modelAttribute="shippingInfo" method="post" action="submitShipping">
	<table>
		<tr>
			<td>Name</td>
			<td><form:input path="name" /></td>
		</tr>
		<tr>
			<td>Address Line 1</td>
			<td><form:input path="addressLine1" /></td>
		</tr>
		<tr>
			<td>Address Line 2</td>
			<td><form:input path="addressLine2" /></td>
		</tr>
		<tr>
			<td>City</td>
			<td><form:input path="city" /></td>
		</tr>
		<tr>
			<td>State</td>
			<td><form:input path="state" /></td>
		</tr>
		<tr>
			<td>Zip</td>
			<td><form:input path="zip" /></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="Submit"></td>
		</tr>
	</table>
</form:form>
<jsp:include page="../common/footer.jsp"/>

</body>
</html>