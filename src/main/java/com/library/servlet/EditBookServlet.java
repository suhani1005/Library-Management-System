package com.library.servlet;

import com.library.dao.BookDAO;
import com.library.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/edit-book")
public class EditBookServlet extends HttpServlet {

    private final BookDAO bookDAO = new BookDAO();

    // Open edit form with existing book details
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String idText = request.getParameter("id");

        try {
            int id = Integer.parseInt(idText);

            String sql = "SELECT * FROM books WHERE book_id = ?";

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setInt(1, id);

                try (ResultSet rs = ps.executeQuery()) {

                    if (rs.next()) {

                        request.setAttribute("book_id", rs.getInt("book_id"));
                        request.setAttribute("title", rs.getString("title"));
                        request.setAttribute("author", rs.getString("author"));
                        request.setAttribute("category", rs.getString("category"));
                        request.setAttribute("isbn", rs.getString("isbn"));
                        request.setAttribute("publisher", rs.getString("publisher"));
                        request.setAttribute("total_copies", rs.getInt("total_copies"));

                        request.getRequestDispatcher("/edit-book.jsp")
                                .forward(request, response);

                    } else {
                        response.sendRedirect(
                                request.getContextPath() + "/books");
                    }
                }
            }

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid book ID.");
        } catch (java.sql.SQLException e) {
            throw new ServletException("Unable to load book details.", e);
        }
    }

    // Save updated book details
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {
            int id = Integer.parseInt(request.getParameter("book_id"));
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String category = request.getParameter("category");
            String isbn = request.getParameter("isbn");
            String publisher = request.getParameter("publisher");
            int totalCopies = Integer.parseInt(
                    request.getParameter("totalCopies"));

            if (title == null || title.trim().isEmpty()
                    || author == null || author.trim().isEmpty()
                    || totalCopies < 1 || totalCopies > 100000) {

                response.sendError(HttpServletResponse.SC_BAD_REQUEST,
                        "Please enter valid book details.");
                return;
            }

            boolean updated = bookDAO.updateBook(
                    id,
                    title.trim(),
                    author.trim(),
                    category == null ? null : category.trim(),
                    isbn == null ? null : isbn.trim(),
                    publisher == null ? null : publisher.trim(),
                    totalCopies
            );

            if (updated) {
                response.sendRedirect(
                        request.getContextPath() + "/books?updated=1");
            } else {
                response.sendRedirect(
                        request.getContextPath() + "/books");
            }

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid book ID or number of copies.");
        } catch (RuntimeException e) {
            throw new ServletException("Unable to update book.", e);
        }
    }
}