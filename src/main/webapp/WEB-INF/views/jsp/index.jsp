<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>First Project</title>

<spring:url value="/resources/core/css/hello.css" var="coreCss" />
<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />
</head>

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Azure Devops</a>
		</div>
	</div>
</nav>

<div class="jumbotron">
	<div class="container">
		<h1>${title}</h1>
		<p>
			<c:if test="${not empty msg}">
				Hello ${msg}
			</c:if>

			<c:if test="${empty msg}">
				Welcome To Azure DevOps!
			</c:if>
		<p>
			<a class="btn btn-primary btn-lg" href="https://azure.microsoft.com/en-in/services/devops/" role="button">Learn more</a>
		</p>
	</div>
</div>

<div class="container">

	<div class="row">
		<div class="col-md-8">
			<h2>Azure DevOps</h2>
			<img src="https://p2zk82o7hr3yb6ge7gzxx4ki-wpengine.netdna-ssl.com/wp-content/uploads/Azure-DevOps-3.png" alt="lamp" width="32" height="32">
			<p> Azure DevOps Server is a Microsoft product that provides version control, reporting, requirements management, project management, automated builds, testing and release management capabilities. </p>
		</div>	
	</div>


	<hr>
	<footer>
		<p>&copy; AzureDevops ltd</p>
	</footer>
</div>

<spring:url value="/resources/core/css/hello.js" var="coreJs" />
<spring:url value="/resources/core/css/bootstrap.min.js" var="bootstrapJs" />

<script src="${coreJs}"></script>
<script src="${bootstrapJs}"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>
</html>
