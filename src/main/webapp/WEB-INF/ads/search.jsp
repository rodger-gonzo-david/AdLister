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
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-offset-4 col-xs-4">
            <h1 class="text-center">Search Page</h1>
            <div class="text-center">
                <form action="/ads/search" method="get" class="center-text center-block">
                    <label for="search">Title: <input type="text" name="searchInput" id="search"></label><br>
                    <label for="searchCat"> Category: <select id="searchCat" name="searchCat">
                        <option value="Home">Home</option>
                        <option value="Auto">Auto</option>
                    </select></label><br>
                    <button>Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <hr>
    <c:forEach var="ad" items="${search}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
        </div>
    </c:forEach>
</div>
</body>
</html>
