<%--
  Created by IntelliJ IDEA.
  User: 37493
  Date: 05.09.2022
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add author</title>
    <head>
        <title>add author</title>
    </head>
<body>

<form method="post" action="/author/add" style="background: chartreuse">
    <input type="text" name="name" placeholder="name">
    <input type="text" name="surname" placeholder="surname">
    <input type="email" name="email" placeholder="email">
    <input type="number" name="age" placeholder="age">
    <input type="submit" value="add">
</form>
</body>
</html>
