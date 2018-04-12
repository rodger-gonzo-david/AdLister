<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="${navbar}"/>
<%--<jsp:include page="/WEB-INF/partials/navbar.jsp" />--%>

<div class="container">
    <h1>Here Are all the ads!</h1>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
            <a href="/ads/single?ad-id=${ad.id}">Check this ad out!</a>
        </div>
    </c:forEach>
</div>
<jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
