<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01
Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/VAADIN/themes/mytheme/styles.css?v=7.6.6" />
<title>Custom Login Page</title>

<style>
html, body {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
	display: table;
}

.container {
	display: table-cell;
	text-align: center;
	vertical-align: middle;
}

.content {
	display: inline-block;
	text-align: left;
	width: 600px;
	margin: 0 auto;
}
</style>

</head>
<body onload='document.username.focus();' bgcolor="#464646">
	<div class="container">
		<div class="content">
			<div style="border-radius: 25px;" class="v-app mytheme myui">
				<%
					String errorString = (String) request.getAttribute("error");
					if (errorString != null && errorString.trim().equals("true")) {
						out.println("Incorrect login name or password. Please retry using correct login name and password.");
					}
				%>
				<c:url value="/login" var="loginUrl" />
				<form action="${loginUrl}" method="post">
					<c:if test="${param.error != null}">
						<p>Invalid username and password.</p>
					</c:if>
					<c:if test="${param.logout != null}">
						<p>You have been logged out.</p>
					</c:if>

					<div
						class="v-horizontallayout v-layout v-horizontal v-widget v-margin-top v-margin-right v-margin-bottom v-margin-left">
						<div class="v-slot">
							<div class="v-widget v-has-caption v-caption-on-top">
								<div id="gwt-uid-2" class="v-caption">
									<span class="v-captiontext">Username:</span>
								</div>
								<input type="text" class="v-textfield v-widget" id="username"
									name="username" tabindex="0">
							</div>
						</div>
						<div class="v-spacing"></div>
						<div class="v-slot">
							<div class="v-widget v-has-caption v-caption-on-top">
								<div id="gwt-uid-4" class="v-caption">
									<span class="v-captiontext">Password:</span>
								</div>
								<input type="password" class="v-textfield v-widget"
									id="password" name="password" tabindex="0">
							</div>
						</div>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<div class="v-spacing"></div>
						<div class="v-slot v-align-bottom">
							<div class="v-verticallayout v-layout v-vertical v-widget">
								<div class="v-slot v-align-bottom">
									<button type="submit" class="v-button v-widget">Log in</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>