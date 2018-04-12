<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Little Jeans" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <header class="container-fluid">
        <h1>Welcome to Little Jeans</h1>
        <h2>Your premier source for baby and kids clothes</h2>
    </header>

    <jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
