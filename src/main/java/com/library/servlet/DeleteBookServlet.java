package com.library.servlet;

import com.library.dao.BookDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/delete-book")
public class DeleteBookServlet extends HttpServlet {

    private final BookDAO bookDAO = new BookDAO();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String idText = request.getParameter("id");

        try {
            int bookId = Integer.parseInt(idText);

            if (bookId <= 0) {
                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Invalid book ID.");
                return;
            }

            boolean deleted = bookDAO.deleteBook(bookId);

            if (deleted) {
                response.sendRedirect(
                        request.getContextPath() + "/books?deleted=1");
            } else {
                response.sendRedirect(
                        request.getContextPath() + "/books?deleteError=1");
            }

        } catch (NumberFormatException e) {
            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid book ID.");
        } catch (RuntimeException e) {
            throw new ServletException("Unable to delete book.", e);
        }
    }
}
