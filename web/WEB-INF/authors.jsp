<%@ page import="java.util.List" %>
<%@ page import="model.Author" %><%--
  Created by IntelliJ IDEA.
  User: 37493
  Date: 05.09.2022
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>authors</title>
</head>
<body>

<%
    List<Author> authorList = (List<Author>) request.getAttribute("authors");
%>

<table border="1px" style="color: #052881">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>surname</th>
        <th>email</th>
        <th>age</th>
        <th>action</th>
    </tr>

    <% for (Author author : authorList) {%>
    <tr>
        <td><%=author.getId()%>
        </td>
        <td><%=author.getName()%>
        </td>
        <td><%=author.getSurname()%>
        </td>
        <td><%=author.getEmail()%>
        </td>
        <td><%=author.getAge()%>
        </td>
        <td><a href="/author/remove?authorId=<%=author.getId()%>">remove</a></td>
        <td><a href="/author/edit?authorId=<%=author.getId()%>">edit</a></td>
    </tr>
    <% } %>

</table>
</body>
</html>
