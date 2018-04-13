<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: rodgerscott
  Date: 4/10/18
  Time: 10:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="This Add Page" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1 style="text-align: center">Viewing Add</h1>
    <div class="row">
        <c:forEach var="ad" items="${single}">
        <div class="col-sm-8 col-sm-offset-2 center-block">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
        </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
