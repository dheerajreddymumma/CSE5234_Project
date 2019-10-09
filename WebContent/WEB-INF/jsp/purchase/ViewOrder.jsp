<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<title>Order entry form</title>
	<style>
		table,
		th,
		td {
			border: 1px solid black;
		}
	</style>
</head>

<body>
	<jsp:include page="../common/header.jsp" />

	<form:form modelAttribute="order" method="post" action="confirmOrder">
		<table>
			<tr>
				<th>Name</th>
				<th>Price</th>
				<th>Quantity</th>
			</tr>
			<c:forEach items="${order.items}" var="item" varStatus="loop">
				<tr>
					<td>
						<form:input path="items[${loop.index}].name" readonly="true" />
					</td>
					<td>$
						<form:input path="items[${loop.index}].price" readonly="true" />
					</td>
					<td>
						<form:input path="items[${loop.index}].quantity" readonly="true" />
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="2"><input type="submit" value="Confirm"></td>
			</tr>
		</table>
	</form:form>
</body>
<jsp:include page="../common/footer.jsp"/>

</html>