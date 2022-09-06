package manager;


import com.sun.istack.internal.NotNull;
import db.DBConnectionProvider;
import model.Author;
import model.Book;

import java.sql.*;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

public class BookManager {
    private final Connection connection = DBConnectionProvider.getINSTANCE().getConnection();


    private final AuthorManager authorManager = new AuthorManager();

    public void addBook(Book book) {
        String sql = "INSERT INTO book(title, description, price, author_id) VALUES(?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, book.getTitle());
            ps.setString(2, book.getDescription());
            ps.setDouble(3, book.getPrice());
            ps.setInt(4, book.getAuthor().getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Book> showBooks() {
        List<Book> bookList = new ArrayList<>();
        String sql = "SELECT * FROM book";
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Book book = Book.builder()
                        .id(resultSet.getInt(1))
                        .title(resultSet.getString(2))
                        .description(resultSet.getString(3))
                        .price(resultSet.getDouble(4))
                        .author(authorManager.getAuthorById(resultSet.getInt(5)))
                        .build();
                bookList.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookList;
    }

    public void removeBookById(int id) {
        String sql = "DELETE FROM book WHERE id = " + id;
        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public void edit(@NotNull Book book) {
        String sql = "UPDATE book SET title=?, description=?, price=?, author_id=? WHERE id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, book.getTitle());
            ps.setString(2, book.getDescription());
            ps.setDouble(3, book.getPrice());
            ps.setInt(4, book.getAuthor().getId());
            ps.setInt(5, book.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Book getBookById(int id) {
        String sql = "SELECT * FROM book WHERE id = " + id;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            if (resultSet.next()) {
                return Book.builder()
                        .id(resultSet.getInt(1))
                        .title(resultSet.getString(2))
                        .description(resultSet.getString(3))
                        .price(resultSet.getDouble(4))
                        .author(authorManager.getAuthorById(resultSet.getInt(5)))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}