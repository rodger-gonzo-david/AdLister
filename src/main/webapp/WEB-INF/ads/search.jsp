<%--
  Created by IntelliJ IDEA.
  User: rodgerscott
  Date: 4/9/18
  Time: 3:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Search Page" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<h1>Welcome to the Search Page</h1>
<form action="/ads/search" method="get">
    <label for="search"><input type="text" name="searchInput" id="search"></label>
    <label for="searchCat"><select id="searchCat" name="searchCat">
        <option value="Home">Home</option>
        <option value="Auto">Auto</option>
    </select></label>
    <button>Submit</button>
</form>

<div class="container">
    <h1>Here Are all the ads!</h1>
    <c:forEach var="ad" items="${search}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
        </div>
    </c:forEach>
</div>
</body>
</html>
