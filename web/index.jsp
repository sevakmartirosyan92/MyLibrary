<%@ page import="model.Author" %>
<%@ page import="model.AuthorRole" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title style="color: lawngreen" aria-flowto="">My Library</title>
</head>

<%
    Author author = (Author) session.getAttribute("author");
%>

<body>
<div style="width: 500px; margin: 0 auto">
    <div>
        <img src="/image/my%20library.jpg" width="300" height="300"/>
    </div>
    <div>
        <h1>My Lybrary</h1>
        <div style="color: lime">
            <a href="/books" style="border: orange" target="_top">Show All books</a>
            <%if (author != null && author.getAuthorRole() == AuthorRole.ADMIN) {%>
            <a href="/book/add" style="border: orange" target="_top">Add book</a>
            <%}%>

            <%if (author != null){%>
            <a href="/authors" style="border: limegreen" target="_top">Show All authors</a>
<a href="/logout">Logout</a>
            <%} else {%>

            <a href="/author/add" style="border: limegreen" target="_top">Register</a>

            <a href="/login">Login</a>
            <%}%>
        </div>
    </div>
</div>

</body>
</html>
