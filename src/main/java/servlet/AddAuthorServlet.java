package servlet;


import manager.AuthorManager;
import model.Author;
import model.AuthorRole;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;

@WebServlet(urlPatterns = "/author/add")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, //1MB
        maxFileSize = 1024 * 1024 * 10, //10MB
        maxRequestSize = 1024 * 1024 * 100 //100MB
)
public class AddAuthorServlet extends HttpServlet {
    private final AuthorManager authorManager = new AuthorManager();
    private static String IMAGE_PATH = "C:\\Users\\37493\\Java 2022\\MyLibrary\\projectImages\\";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/addAuthor.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        if (authorManager.getAuthorByEmail(email) != null) {
            req.setAttribute("msg", "Author already exists");
            req.getRequestDispatcher("/WEB-INF/addAuthor.jsp");
        } else {
            String name = req.getParameter("name");
            String surname = req.getParameter("surname");
            int age = Integer.parseInt(req.getParameter("age"));
            String password = req.getParameter("password");
            AuthorRole authorRole = AuthorRole.valueOf(req.getParameter("author_role"));

            Part profilePicturePart = req.getPart("profilePicture");
            String fileName = null;
            if (profilePicturePart != null) {
                long nanoTime = System.nanoTime();
                fileName = nanoTime + "_" + profilePicturePart.getSubmittedFileName();
                profilePicturePart.write(IMAGE_PATH + fileName);
            }
            Author author = Author.builder()
                    .name(name)
                    .surname(surname)
                    .email(email)
                    .password(password)
                    .authorRole(authorRole)
                    .age(age)
                    .profilePicture(fileName)
                    .build();
            authorManager.addAuthor(author);
            resp.sendRedirect("/login");
        }
    }
}