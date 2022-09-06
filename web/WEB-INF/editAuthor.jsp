<%@ page import="model.Author" %><%--
  Created by IntelliJ IDEA.
  User: 37493
  Date: 06.09.2022
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
  <title>edit author</title>
</head>
<body>

<%
  Author author = (Author) request.getAttribute("author");
%>

<form method="post" action="/author/edit">
  <input type="hidden" name="authorId" value="<%=author.getId()%>">
  <input type="text" name="name" value="<%=author.getName()%>">
  <input type="text" name="surname" value="<%=author.getSurname()%>">
  <input type="email" name="email" value="<%=author.getEmail()%>">
  <input type="number" name="age" value="<%=author.getAge()%>">
  <input type="submit" value="update">
</form>
</body>
</html>
