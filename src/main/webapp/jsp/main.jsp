<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01
Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>My Page</title>
</head>
<body>
<c:url value="/myui" var="myui" />
<c:redirect url="${myui}"/>
</body>
</html>