package com.library.servlet;

import com.library.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/login.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || email.trim().isEmpty()
                || password == null || password.isEmpty()) {

            request.setAttribute("error", "Please enter email and password.");
            request.getRequestDispatcher("/login.jsp")
                   .forward(request, response);
            return;
        }

        String sql = "SELECT user_id, first_name, last_name, email, password, role "
                   + "FROM users WHERE email = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email.trim());

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    String hashedPassword = rs.getString("password");

                    if (hashedPassword != null
                            && BCrypt.checkpw(password, hashedPassword)) {

                        HttpSession session = request.getSession();
                        session.setAttribute("userId", rs.getInt("user_id"));
                        session.setAttribute(
                                "userName",
                                rs.getString("first_name") + " "
                                + rs.getString("last_name"));
                        session.setAttribute("userEmail", rs.getString("email"));
                        session.setAttribute("userRole", rs.getString("role"));

                        response.sendRedirect(
                                request.getContextPath() + "/books");
                        return;
                    }
                }
            }

            request.setAttribute("error", "Invalid email or password.");
            request.getRequestDispatcher("/login.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            throw new ServletException("Unable to process login.", e);
        }
    }
}
