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
        <h3>Email: ${sessionScope.user.email}</h3>
        <form action="/profile" method="post">
            <label for="emailInput"><input type="text" name="emailInput" id="emailInput" placeholder="update email"></label>
            <button type="submit" class="btn btn-primary">Edit Email</button>
        </form>
        <h3>Change Password</h3>
        <form action="/profile" method="post">
            <label for="passwordInput"><input type="text" name="passwordInput" id="passwordInput" placeholder="update password"></label>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
        <c:forEach var="ad" items="${profileAds}">
            <div class="col-md-6">
                <h2>${ad.title}</h2>
                <p>${ad.description}</p>
                <button type="button" class="btn btn-primary">Edit Ad</button>
                <button type="button" class="btn btn-danger">Delete Ad</button>
            </div>
        </c:forEach>



</body>
</html>