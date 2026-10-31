
package com.library.dao;

import com.library.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.LinkedHashMap;
import java.util.Map;

public class BookDAO {

    public List<Map<String, Object>> getAllBooks() {

        List<Map<String, Object>> books = new ArrayList<>();

        String sql = "SELECT * FROM books ORDER BY book_id";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {
            while (rs.next()) {

                Map<String, Object> book = new LinkedHashMap<>();

                book.put("book_id", rs.getInt("book_id"));
                book.put("title", rs.getString("title"));
                book.put("author", rs.getString("author"));
                book.put("category", rs.getString("category"));
                book.put("isbn", rs.getString("isbn"));
                book.put("publisher", rs.getString("publisher"));
                book.put("total_copies", rs.getInt("total_copies"));
                book.put("available_copies",
                         rs.getInt("available_copies"));
                book.put("status", rs.getString("status"));

                books.add(book);
            }

} catch (Exception e) {
    throw new RuntimeException("Error fetching books from database", e);
}

        return books;
    }

public boolean addBook(
        String title,
        String author,
        String category,
        String isbn,
        String publisher,
        int totalCopies) {

    String sql = "INSERT INTO books "
            + "(title, author, category, isbn, publisher, "
            + "total_copies, available_copies, status) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

    try (java.sql.Connection con =
                 com.library.util.DBConnection.getConnection();
         java.sql.PreparedStatement ps =
                 con.prepareStatement(sql)) {

        ps.setString(1, title);
        ps.setString(2, author);
        ps.setString(3, category);
        ps.setString(4, isbn);
        ps.setString(5, publisher);
        ps.setInt(6, totalCopies);
        ps.setInt(7, totalCopies);
        ps.setString(8, "Available");

        return ps.executeUpdate() > 0;

    } catch (java.sql.SQLException e) {
        throw new RuntimeException("Unable to add book", e);
    }
}
// Update an existing book
public boolean updateBook(
        int bookId,
        String title,
        String author,
        String category,
        String isbn,
        String publisher,
        int totalCopies) {

    String sql = "UPDATE books SET "
            + "title = ?, "
            + "author = ?, "
            + "category = ?, "
            + "isbn = ?, "
            + "publisher = ?, "
            + "available_copies = available_copies + (? - total_copies), "
            + "total_copies = ? "
            + "WHERE book_id = ?";

    try (java.sql.Connection con =
                 com.library.util.DBConnection.getConnection();
         java.sql.PreparedStatement ps =
                 con.prepareStatement(sql)) {

        ps.setString(1, title);
        ps.setString(2, author);
        ps.setString(3, category);
        ps.setString(4, isbn);
        ps.setString(5, publisher);
        ps.setInt(6, totalCopies);
        ps.setInt(7, totalCopies);
        ps.setInt(8, bookId);

        return ps.executeUpdate() > 0;

    } catch (java.sql.SQLException e) {
        throw new RuntimeException("Unable to update book", e);
    }
}
// Search books by title, author, or category
public List<Map<String, Object>> searchBooks(String keyword) {

    List<Map<String, Object>> books = new ArrayList<>();

    String sql = "SELECT * FROM books "
            + "WHERE title LIKE ? "
            + "OR author LIKE ? "
            + "OR category LIKE ? "
            + "ORDER BY book_id";

    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        String searchValue = "%" + keyword.trim() + "%";

        ps.setString(1, searchValue);
        ps.setString(2, searchValue);
        ps.setString(3, searchValue);

        try (ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Map<String, Object> book = new HashMap<>();

                book.put("book_id", rs.getInt("book_id"));
                book.put("title", rs.getString("title"));
                book.put("author", rs.getString("author"));
                book.put("category", rs.getString("category"));
                book.put("isbn", rs.getString("isbn"));
                book.put("publisher", rs.getString("publisher"));
                book.put("total_copies", rs.getInt("total_copies"));
                book.put("available_copies", rs.getInt("available_copies"));
                book.put("status", rs.getString("status"));

                books.add(book);
            }
        }

    } catch (SQLException e) {
        throw new RuntimeException("Unable to search books", e);
    }

    return books;
}
// Delete a book by ID
public boolean deleteBook(int bookId) {

    String sql = "DELETE FROM books WHERE book_id = ?";

    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, bookId);

        return ps.executeUpdate() > 0;

    } catch (SQLException e) {
        throw new RuntimeException("Unable to delete book", e);
    }
}
}

