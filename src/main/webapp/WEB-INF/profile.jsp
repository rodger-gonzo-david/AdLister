<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar_logout.jsp" />

    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
        <form action="/profile" method="post">
            <h3>Email: ${sessionScope.user.email}</h3>
            <label for="emailInput"><input type="text" name="emailInput" id="emailInput" placeholder="update email"></label>
            <h3>Update Password</h3>
            <label for="passwordInput"><input type="text" name="passwordInput" id="passwordInput" placeholder="update password"></label>
            <button type="submit" class="btn btn-primary">Edit Email</button>
        </form>
        <c:forEach var="ad" items="${profileAds}">
            <div class="col-md-6">
                <h2>${ad.title}</h2>
                <p>${ad.description}</p>
                <a href="/ads/editAd?ad-id=${ad.id}">Edit this ad.</a>
            </div>
        </c:forEach>

        <jsp:include page="/WEB-INF/partials/scripts.jsp" />

</body>
</html>