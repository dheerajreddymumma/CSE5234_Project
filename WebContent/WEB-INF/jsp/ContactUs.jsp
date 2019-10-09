<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Contact us</title>
</head>
<body>
<jsp:include page="common/header.jsp"/>


<div class="jumbotron jumbotron-sm" style="background-color:transparent">
	<div class="container">
	    <div class="row">
	        <div class="col-md-8">
	            <form>
	            <legend><span class="glyphicon glyphicon-globe"></span> Our office</legend>
	            <address>
	                <strong>Distributed convenience, Inc.</strong><br>
	                The Ohio State University<br>
	                Columbus, OH 43202<br>
	                <abbr title="Phone">
	                    P:</abbr>
	                (123) 456-7890
	            </address>
	            <address>
	                <strong>Email to</strong><br>
	                <a href="mailto:#">srander@gmail.com</a>
	            </address>
	            </form>
	        </div>
	    </div>
	</div>
</div>
	
<jsp:include page="common/footer.jsp"/>
</body>
</html>
