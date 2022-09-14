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

<%
    String msg = (String) request.getAttribute("msg");
%>
<%if (msg != null) {%>
<p style="color: red"><%=msg%>
</p>
<%}%>


<form method="post" action="/author/add" style="background: chartreuse" enctype="multipart/form-data">
    <input type="text" name="name" placeholder="name"><br><br>
    <input type="text" name="surname" placeholder="surname"><br><br>
    <input type="email" name="email" placeholder="email"><br><br>
    <input type="number" name="age" placeholder="age"><br><br>
    <input type="password" name="password" placeholder="Please input password"><br>
    <select name="author_role">
        <option value="ADMIN">Admin</option>
        <option value="AUTHOR">Author</option>
    </select>

    Profile picture:
    <input type="file" name="profilePicture">

    <input type="submit" value="register">
</form>
</body>
</html>
