<%@ page import="java.util.List" %>
<%@ page import="model.Author" %><%--
  Created by IntelliJ IDEA.
  User: 37493
  Date: 06.09.2022
  Time: 17:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>add book</title>
</head>
<body>

<%
    List<Author> authorList = (List<Author>) request.getAttribute("authors");
%>

<form method="post" action="/book/add" style="color: chartreuse">
    <input type="text" name="title" placeholder="title">
    <input type="text" name="description" placeholder="description">
    <input type="number" name="price" placeholder="price">

    <select name="authorId">
        <%for (Author author : authorList) {%>
        <option value="<%=author.getId()%>"><%=author.getName() + " " + author.getSurname() + " " + author.getEmail()%></option>
        <%}%>
    </select>

    <input type="submit" value="add">
</form>
</body>
</html>
