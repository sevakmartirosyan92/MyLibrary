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

<form method="post" action="/book/add"  enctype="multipart/form-data">
    <input type="text" name="title" placeholder="title"><br><br>
    <input type="text" name="description" placeholder="description"><br><br>
    <input type="number" name="price" placeholder="price"><br><br>

    <select name="authorId">
        <%for (Author author : authorList) {%>
        <option value="<%=author.getId()%>"><%=author.getName() + " " + author.getSurname() + " " + author.getEmail()%>
        </option>
        <%}%>
    </select>
    <br><br><br>
    Profile Picture:<br><br>
    <input type="file" name="profilePic">


    <input type="submit" value="register">
</form>
</body>
</html>
