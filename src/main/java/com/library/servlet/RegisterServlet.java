
package com.library.servlet;

import com.library.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/register.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phoneNo = request.getParameter("phone_no");
        String address = request.getParameter("address");

        if (isBlank(firstName) || isBlank(lastName)
                || isBlank(email) || isBlank(password)
                || isBlank(phoneNo)) {

            request.setAttribute("error", "Please fill all required fields.");
            request.getRequestDispatcher("/register.jsp")
                   .forward(request, response);
            return;
        }

        try {
            boolean registered = userDAO.registerUser(
                    firstName.trim(),
                    lastName.trim(),
                    email.trim(),
                    password,
                    phoneNo.trim(),
                    address == null ? "" : address.trim()
            );

            if (registered) {
                response.sendRedirect(
                        request.getContextPath() + "/register.jsp?success=1");
            } else {
                request.setAttribute("error", "Registration failed. Please try again.");
                request.getRequestDispatcher("/register.jsp")
                       .forward(request, response);
            }

        } catch (RuntimeException e) {
            Throwable cause = e.getCause();

            if (cause instanceof SQLException
                    && ((SQLException) cause).getErrorCode() == 1062) {

                request.setAttribute("error", "This email is already registered.");
                request.getRequestDispatcher("/register.jsp")
                       .forward(request, response);

            } else {
                throw new ServletException("Registration failed.", e);
            }
        }
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
