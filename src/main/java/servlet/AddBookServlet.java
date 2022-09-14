package servlet;

import manager.AuthorManager;
import manager.BookManager;
import model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;

@WebServlet(urlPatterns = "/book/add")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, //1MB
        maxFileSize = 1024 * 1024 * 10, //10MB
        maxRequestSize = 1024 * 1024 * 100 //100MB
)
public class AddBookServlet extends HttpServlet {

    private final BookManager bookManager = new BookManager();
    private final AuthorManager authorManager = new AuthorManager();
    private static String IMAGE_PATH = "C:\\Users\\37493\\Java 2022\\MyLibrary\\projectImages\\";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("authors", authorManager.showAuthors());
        req.getRequestDispatcher("/WEB-INF/addBook.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String description = req.getParameter("description");
        double price = Double.parseDouble(req.getParameter("price"));
        int authorId = Integer.parseInt(req.getParameter("authorId"));

        Part profilePicPart = req.getPart("profilePic");
        String filename = null;
        if (profilePicPart != null) {
            long nanoTime = System.nanoTime();
            filename = nanoTime + "_" + profilePicPart.getSubmittedFileName();
            profilePicPart.write(IMAGE_PATH + filename);
        }
        Book book = Book.builder()
                .title(title)
                .description(description)
                .price(price)
                .author(authorManager.getAuthorById(authorId))
                .profilePic(filename)
                .build();
        bookManager.addBook(book);
        resp.sendRedirect("/books");
    }
}
