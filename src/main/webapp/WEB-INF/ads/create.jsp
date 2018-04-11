<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar_logout.jsp" />
    <div class="container">
        <h1>Create a new Ad</h1>
        <form action="/ads/create" method="post">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text"></textarea>
            </div>
            <div class="form-group">
                <label for="price">Price</label>
                <textarea id="price" name="price" class="form-control" type="text" value=0.0></textarea>
            </div>
            <fieldset>
                <legend>Category</legend>
                <div>
                    <input type="checkbox" id="catHome" name="category" value="1">
                    <label for="catHome">Home</label>
                </div>
                <div>
                    <input type="checkbox" id="catAuto" name="category" value="2">
                    <label for="catAuto">Music</label>
                </div>
            </fieldset>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </div>
</body>
</html>
