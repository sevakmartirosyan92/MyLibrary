<%@ page import="java.util.List" %>
<%@ page import="model.Author" %>
<%@ page import="model.Book" %><%--
  Created by IntelliJ IDEA.
  User: 37493
  Date: 05.09.2022
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>books</title>
</head>
<body>

<%
    List<Book> bookList = (List<Book>) request.getAttribute("books");
%>

<table border="1px" style="color: #51048b">

    <tr>
        <th>title</th>
        <th>description</th>
        <th>price</th>
        <th>author</th>
        <th>action</th>
    </tr>

    <%for (Book book : bookList) {%>
    <tr>
        <td><%=book.getTitle()%></td>
        <td><%=book.getDescription()%></td>
        <td><%=book.getPrice()%></td>
        <td><%=book.getAuthor()%></td>
        <td><a href="/book/remove?bookId=<%=book.getId()%>">remove</a></td>
        <td><a href="/book/edit?bookId=<%=book.getId()%>">edit</a></td>
    </tr>
    <%}%>

</table>

</body>
</html>
