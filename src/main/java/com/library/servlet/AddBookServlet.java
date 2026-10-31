package com.library.servlet;

import com.library.dao.BookDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/add-book")
public class AddBookServlet extends HttpServlet {

    private final BookDAO bookDAO = new BookDAO();

    // Open Add Book form
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/add-book.jsp")
                .forward(request, response);
    }

    // Save book in database
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        String isbn = request.getParameter("isbn");
        String publisher = request.getParameter("publisher");
        String copiesText = request.getParameter("totalCopies");

        // Validate required fields
        if (title == null || title.trim().isEmpty()
                || author == null || author.trim().isEmpty()
                || copiesText == null || copiesText.trim().isEmpty()) {

            response.sendRedirect(
                    request.getContextPath() + "/add-book.jsp?error=1");
            return;
        }

        try {
            int totalCopies = Integer.parseInt(copiesText.trim());

            if (totalCopies < 1 || totalCopies > 100000) {
                response.sendRedirect(
                        request.getContextPath() + "/add-book.jsp?error=1");
                return;
            }

            boolean added = bookDAO.addBook(
                    title.trim(),
                    author.trim(),
                    clean(category),
                    clean(isbn),
                    clean(publisher),
                    totalCopies
            );

            if (added) {
                // Book saved; open the updated book list
                response.sendRedirect(
                        request.getContextPath() + "/books?added=1");
            } else {
                response.sendRedirect(
                        request.getContextPath() + "/add-book.jsp?error=1");
            }

        } catch (NumberFormatException e) {
            response.sendRedirect(
                    request.getContextPath() + "/add-book.jsp?error=1");
        } catch (RuntimeException e) {
            throw new ServletException("Unable to add book to database.", e);
        }
    }

    private String clean(String value) {
        if (value == null || value.trim().isEmpty()) {
            return null;
        }
        return value.trim();
    }
}