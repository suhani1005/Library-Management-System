package com.library.servlet;

import com.library.dao.BookDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/books")
public class BookServlet extends HttpServlet {

    private final BookDAO bookDAO = new BookDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");

        List<Map<String, Object>> books;

        if (keyword != null && !keyword.trim().isEmpty()) {
            books = bookDAO.searchBooks(keyword);
        } else {
            books = bookDAO.getAllBooks();
        }

        request.setAttribute("books", books);
        request.setAttribute("keyword",
                keyword == null ? "" : keyword);

        request.getRequestDispatcher("/books.jsp")
                .forward(request, response);
    }
}